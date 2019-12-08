import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-search-header',
  templateUrl: './search-header.component.html',
  styleUrls: ['./search-header.component.css']
})
export class SearchHeaderComponent implements OnInit {
  call: string;
  city: string;
  time: string;
  hour: string;
  gender: string;


  constructor(private cookieService: CookieService) { }

  ngOnInit() {
    this.gender = this.cookieService.get('filter_gender');
    this.call = this.cookieService.get('filter_call');
    this.city = this.cookieService.get('filter_city');
    this.time = this.cookieService.get('filter_time');
    this.hour = this.cookieService.get('filter_hour');
  }

}
