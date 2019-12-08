import { Component, OnInit } from '@angular/core';
import { UserService } from '../../service/user.service';

@Component({
  selector: 'app-faq',
  templateUrl: './faq.component.html',
  styleUrls: ['./faq.component.css']
})
export class FaqComponent implements OnInit {

  faq: string;

  constructor(public userService: UserService) { }

  ngOnInit() {
    this.userService.faq()
    .subscribe(faqData => {
      this.faq = faqData.result.info;
    });
  }
}
