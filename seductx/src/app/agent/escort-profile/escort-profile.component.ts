import { Component, OnInit } from '@angular/core';
import { EscortService } from '../../service/escort.service';
import { AuthEscortService } from '../../service/auth-escort.service';
import { EscortProfile } from '../../model/escortProfile.model';
import { ActivatedRoute, ParamMap } from '@angular/router';


@Component({
  selector: 'app-escort-profile',
  templateUrl: './escort-profile.component.html',
  styleUrls: ['./escort-profile.component.css']
})
export class EscortProfileComponent implements OnInit {

  escortInfo: EscortProfile[] = [];
  escortId: string;
  constructor(public escortService: EscortService , public authService: AuthEscortService , public route: ActivatedRoute) {}

  ngOnInit() {
    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.escortId = paramMap.get('escortId');
      this.escortService.getProfileInfo(this.escortId)
      .subscribe(escortData => {
        console.log(escortData.escortinfo);
        this.escortInfo = escortData.escortinfo;
        console.log(this.escortInfo);
      });
    });
  }
}
