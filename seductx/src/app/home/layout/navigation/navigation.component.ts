import { Component, OnInit , OnDestroy} from '@angular/core';

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.css']
})
export class NavigationComponent implements OnInit {
  active: boolean;
  constructor() { }

  ngOnInit() {
    this.active = false;
  }

  toggleClass(){
    this.active = !this.active;
  }



}
