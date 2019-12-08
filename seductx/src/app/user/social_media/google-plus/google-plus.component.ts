import { Component, ElementRef, AfterViewInit, Input } from '@angular/core';

@Component({
  selector: 'app-google-plus',
  templateUrl: './google-plus.component.html',
  styleUrls: ['./google-plus.component.css']
})
export class GooglePlusComponent implements AfterViewInit {

  @Input() url = 'http://jasonwatmore.com';

    constructor() {
        // load google plus sdk if required
        const url = 'https://apis.google.com/js/platform.js';
        if (!document.querySelector(`script[src='${url}']`)) {
            let script = document.createElement('script');
            script.src = url;
            document.body.appendChild(script);
        }
    }

    ngAfterViewInit(): void {
        // render google plus button
        window['gapi'] && window['gapi'].plusone.go();
    }

}
