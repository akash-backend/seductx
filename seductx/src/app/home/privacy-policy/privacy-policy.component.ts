import { Component, OnInit } from '@angular/core';
import { UserService } from '../../service/user.service';

@Component({
  selector: 'app-privacy-policy',
  templateUrl: './privacy-policy.component.html',
  styleUrls: ['./privacy-policy.component.css']
})
export class PrivacyPolicyComponent implements OnInit {

  privacyPocliy: string;

  constructor(public userService: UserService) { }

  ngOnInit() {
    this.userService.privacy_policy()
    .subscribe(privacyData => {
      this.privacyPocliy = privacyData.result.info;
    });
  }

}
