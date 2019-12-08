import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-country',
  templateUrl: './country.component.html',
  styleUrls: ['./country.component.css']
})
export class CountryComponent implements OnInit {
  item: string;
  constructor(
    private cookieService: CookieService,
    private router: Router,
  ) { }


  ngOnInit() {
  }

  onClick(item) {
    this.item = item;
  }

  isActive(item) {
    return this.item === item;
  }

  onSaveFilter() {
    if (this.item) {
      this.cookieService.set( 'filter_country', this.item);
      this.router.navigate(['/user/filtercity']);
    }
  }
}
