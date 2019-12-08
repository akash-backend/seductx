import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-city',
  templateUrl: './city.component.html',
  styleUrls: ['./city.component.css']
})
export class CityComponent implements OnInit {
  item: string;

  constructor(
    private cookieService: CookieService,
    private router: Router
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
      this.cookieService.set( 'filter_city', this.item);
      this.router.navigate(['/user/filtergender']);
    }
  }

}
