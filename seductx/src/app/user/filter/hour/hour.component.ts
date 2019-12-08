import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';


@Component({
  selector: 'app-hour',
  templateUrl: './hour.component.html',
  styleUrls: ['./hour.component.css']
})
export class HourComponent implements OnInit {
  gender: string;
  call: string;
  city: string;
  time: string;
  hour: number;
  i = 0;
  HourArray = [1, 2, 3, 4, 6, 8, 10, 12, 15, 24];


  constructor(
    private cookieService: CookieService
  ) { }

  ngOnInit() {
    this.gender = this.cookieService.get('filter_gender');
    this.call = this.cookieService.get('filter_call');
    this.city = this.cookieService.get('filter_city');
    this.time = this.cookieService.get('filter_time');
    this.hour = this.HourArray[this.i];
    this.cookieService.set('filter_hour', this.hour.toString());
  }

  onIncrement() {
    if (this.HourArray.length - 1 > this.i) {
      this.i++;
      this.hour = this.HourArray[this.i];
      this.cookieService.set('filter_hour', this.hour.toString());
    }
  }


  onDecrement() {
    if (this.i > 0) {
      this.i--;
      this.hour = this.HourArray[this.i];
      this.cookieService.set('filter_hour', this.hour.toString());
    }
  }

}
