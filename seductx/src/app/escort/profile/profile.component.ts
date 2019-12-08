import { Component, OnInit } from '@angular/core';
import { EscortService } from '../../service/escort.service';
import { AuthEscortService } from '../../service/auth-escort.service';
import { EscortProfile } from '../../model/escortProfile.model';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  escortInfo: EscortProfile[] = [];
  escortId: string;
  constructor(public escortService: EscortService , public authService: AuthEscortService) {}

  ngOnInit() {
    this.escortId = this.authService.getEscortId();
    this.escortService.getProfileInfo(this.escortId)
    .subscribe(escortData => {
      console.log(escortData.escortinfo);
      this.escortInfo = escortData.escortinfo;
      console.log(this.escortInfo);
    });
  }



}
