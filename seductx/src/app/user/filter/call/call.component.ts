import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-call',
  templateUrl: './call.component.html',
  styleUrls: ['./call.component.css']
})
export class CallComponent implements OnInit {
  item: string;
  city: string;
  gender: string;

  constructor(
    private cookieService: CookieService,
    private router: Router
  ) { }

  ngOnInit() {
    this.gender = this.cookieService.get('filter_gender');
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
      this.cookieService.set( 'filter_call', this.item);
      this.router.navigate(['/user/filtertime']);
    }
  }

}
