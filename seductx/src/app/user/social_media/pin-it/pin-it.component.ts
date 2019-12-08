import { Component, ElementRef, AfterViewInit, Input } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-pin-it',
  templateUrl: './pin-it.component.html',
  styleUrls: ['./pin-it.component.css']
})
export class PinItComponent implements AfterViewInit {

  escortId: string;
  escortProfileImage: string;
  url: string;
  media: string;
  @Input() description = `Jason Watmore's Blog | A Web Developer in Sydney`;

  constructor(private cookieService: CookieService) {
      // load pinterest sdk if required
      this.escortId = this.cookieService.get('share_escort');
      this.url = 'https://seductx.com//#/user/escortProfile/' + this.escortId;
      this.media = this.cookieService.get('share_profileImage');
      const url = 'https://assets.pinterest.com/js/pinit.js';
      if (!document.querySelector(`script[src='${url}']`)) {
          let script = document.createElement('script');
          script.src = url;
          script['data-pin-build'] = 'parsePins';
          document.body.appendChild(script);
      }
  }

  ngAfterViewInit(): void {
      // render pin it button
      window['parsePins'] && window['parsePins']();
  }

}
