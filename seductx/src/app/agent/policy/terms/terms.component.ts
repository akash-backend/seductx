import { Component, OnInit } from '@angular/core';
import { UserService } from '../../../service/user.service';

@Component({
  selector: 'app-terms',
  templateUrl: './terms.component.html',
  styleUrls: ['./terms.component.css']
})
export class TermsComponent implements OnInit {

  terms: string;

  constructor(public userService: UserService) { }

  ngOnInit() {
    this.userService.terms()
    .subscribe(termData => {
      this.terms = termData.result.info;
    });
  }

}
