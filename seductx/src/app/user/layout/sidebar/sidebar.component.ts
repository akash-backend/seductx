import { Component, OnInit } from '@angular/core';
import { UserService } from '../../../service/user.service';
import { AuthService } from '../../../service/auth.service';
import { UserProfile } from '../../../model/UserProfile.model';


@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {

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
