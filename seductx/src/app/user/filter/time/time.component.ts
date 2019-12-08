import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import * as moment from 'moment';

@Component({
  selector: 'app-time',
  templateUrl: './time.component.html',
  styleUrls: ['./time.component.css']
})
export class TimeComponent implements OnInit {
  gender: string;
  call: string;
  city: string;
  minsToAdd = 15;
  now: any;
  time: any;
  endTime: any;
  currentDate: any;
  endDateTime: any;
  minute: any;
  hour: any;

  constructor(
    private cookieService: CookieService
  ) { }

  ngOnInit() {

    // get current date and time
    this.now = moment().format('YYYY-MM-DD H:mm:ss');
    this.currentDate = moment().format('YYYY-MM-DD');

    // get end date and time
    this.endDateTime = this.currentDate + ' ' + '23:59:00';
    this.endDateTime = moment().format(this.endDateTime);

    // set start date after one hour start
    let startdate = moment(this.now);
    this.now = moment(startdate).add(1, 'hours').format('YYYY-MM-DD H:mm:ss');

    this.minute = moment(this.now).format('mm');
    this.hour = moment(this.now).format('H');
    if (this.minute >= 1 && this.minute <= 15) {
      this.minute = 15;
      this.now = moment(this.now).format('YYYY-MM-DD H:' + this.minute + ':ss');
    } else if (this.minute >= 16 && this.minute <= 30) {
      this.minute = 30;
      this.now = moment(this.now).format('YYYY-MM-DD H:' + this.minute + ':ss');
    } else if (this.minute >= 31 && this.minute <= 45) {
      this.minute = 45;
      this.now = moment(this.now).format('YYYY-MM-DD H:' + this.minute + ':ss');
    } else if (this.minute >= 46 && this.minute <= 60) {
      this.minute = 0;
      this.hour = parseInt(this.hour) + 1;
      this.now = moment(this.now).format('YYYY-MM-DD ' + this.hour + ':' + this.minute + ':ss');
      console.log(this.now);
    }
    this.time = this.now;

    this.gender = this.cookieService.get('filter_gender');
    this.call = this.cookieService.get('filter_call');
    this.city = this.cookieService.get('filter_city');
    this.cookieService.set('filter_time', this.time);
  }





  onAddTime() {
      if (this.endDateTime > this.time) {
        let startdate = moment(this.time);
        this.time = moment(startdate).add(15, 'minutes').format('YYYY-MM-DD H:mm:ss');
        console.log(this.time);
        this.cookieService.set('filter_time', this.time);
      }
  }


  onRemoveTime() {
    if (this.now < this.time) {
      let startdate = moment(this.time);
      this.time = moment(startdate).subtract(15, 'minutes').format('YYYY-MM-DD H:mm:ss');;
      this.cookieService.set('filter_time', this.time);
    }
  }

}
