import { Component, OnInit } from '@angular/core';
import { UserService } from '../../service/user.service';
import { AuthService } from '../../service/auth.service';
import { UserProfile } from '../../model/UserProfile.model';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  userInfo: UserProfile[] = [];
  userId: string;
  constructor(public userService: UserService , public authService: AuthService) {}

  ngOnInit() {
    this.userId = this.authService.getUserId();
    console.log(this.userId);
    this.userService.getProfileInfo(this.userId)
    .subscribe(userData => {
      console.log(userData.userinfo);
      this.userInfo = userData.userinfo;
      console.log(this.userInfo);
    });
  }
}
