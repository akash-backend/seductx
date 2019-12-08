import { Component, ElementRef, AfterViewInit, Input } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
@Component({
  selector: 'app-tweet',
  templateUrl: './tweet.component.html',
  styleUrls: ['./tweet.component.css']
})
export class TweetComponent implements AfterViewInit {

  escortId: string;
  url: string;
  @Input() text = '';

  constructor(private cookieService: CookieService) {
      // load twitter sdk if required
      this.escortId = this.cookieService.get('share_escort');
      this.url = 'https://seductx.com//#/user/escortProfile/' + this.escortId;
      const url = 'https://platform.twitter.com/widgets.js';
      if (!document.querySelector(`script[src='${url}']`)) {
          let script = document.createElement('script');
          script.src = url;
          document.body.appendChild(script);
      }
  }

  ngAfterViewInit(): void {
      // render tweet button
      window['twttr'] && window['twttr'].widgets.load();
  }

}
