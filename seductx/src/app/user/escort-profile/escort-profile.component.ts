import { Component, OnInit } from '@angular/core';
import { EscortService } from '../../service/escort.service';
import { EscortProfile } from '../../model/escortProfile.model';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { AuthService } from '../../service/auth.service';


@Component({
  selector: 'app-escort-profile',
  templateUrl: './escort-profile.component.html',
  styleUrls: ['./escort-profile.component.css']
})
export class EscortProfileComponent implements OnInit {
  item: string;
  escortInfo: EscortProfile[] = [];
  escortId: string;
  userId: string;
  price: string;
  userFullName: string;
  constructor(
    private cookieService: CookieService,
    public escortService: EscortService ,
    public authService: AuthService,
    public route: ActivatedRoute,
    private router: Router
    ) {}

  ngOnInit() {
    this.userId = this.authService.getUserId();
    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.escortId = paramMap.get('escortId');
    });

    this.escortService.getProfileInfo(this.escortId)
    .subscribe(escortData => {
      console.log(escortData.escortinfo);
      this.escortInfo = escortData.escortinfo;
      this.userFullName = escortData.escortinfo.first_name + ' ' + 	escortData.escortinfo.last_name;
      console.log(this.escortInfo);
    });
  }


  onClick(item, price) {
    this.item = item;
    this.price = price;
  }

  isActive(item) {
    return this.item === item;
  }


  onSave() {
    if (this.item) {
      this.cookieService.set('booking_rate_id', this.item);
      this.cookieService.set('booking_escortId', this.escortId);
      this.cookieService.set('booking_userId', this.userId);
      this.cookieService.set('booking_price', this.price);
      this.cookieService.set('booking_user_name', this.userFullName);
      this.router.navigate(['/user/confirmBooking']);
    }
  }
}
