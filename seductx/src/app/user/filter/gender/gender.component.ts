import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-gender',
  templateUrl: './gender.component.html',
  styleUrls: ['./gender.component.css']
})
export class GenderComponent implements OnInit {
  item: string;
  city: string;

  constructor(
    private cookieService: CookieService,
    private router: Router
  ) { }

  ngOnInit() {
    this.city = this.cookieService.get('filter_city');
  }

  onClick(item) {
    this.item = item;
  }

  isActive(item) {
    return this.item === item;
  }


  onSaveFilter() {
    if (this.item) {
      this.cookieService.set( 'filter_gender', this.item);
      this.router.navigate(['/user/filtercall']);
    }
  }


}
