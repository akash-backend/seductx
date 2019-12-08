import { Component, ElementRef, AfterViewInit, Input, ViewChild } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-linkedin',
  templateUrl: './linkedin.component.html',
  styleUrls: ['./linkedin.component.css']
})
export class LinkedinComponent implements AfterViewInit {

  escortId: string;
  url: string;
  @ViewChild('element', {static: true}) private searchElementRef: ElementRef;

  constructor(private cookieService: CookieService) {
      // load twitter sdk if required
      this.escortId = this.cookieService.get('share_escort');
      this.url = 'https://seductx.com//#/user/escortProfile/' + this.escortId;
      const url = 'https://platform.linkedin.com/in.js';
      if (!document.querySelector(`script[src='${url}']`)) {
          let script = document.createElement('script');
          script.src = url;
          script.innerHTML = ' lang: en_US';
          document.body.appendChild(script);
      }
  }

  ngAfterViewInit(): void {
      // add linkedin share button script tag to element
      this.searchElementRef.nativeElement.innerHTML = `<script type="IN/Share" data-url="${this.url}"></script>`;

      // render share button
      window['IN'] && window['IN'].parse();
  }

}
