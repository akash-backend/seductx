import { Component, OnInit , OnDestroy} from '@angular/core';
import { AuthService } from '../service/auth.service';
import { Subscription } from 'rxjs';
import { ToastrService } from 'ngx-toastr';
import { NgbCarouselConfig } from '@ng-bootstrap/ng-bootstrap';


@Component({
  selector: 'app-home-dashboard',
  templateUrl: './home-dashboard.component.html',
  styleUrls: ['./home-dashboard.component.css'],
  providers: [NgbCarouselConfig]
})
export class HomeDashboardComponent implements OnInit,OnDestroy {
  images = [1, 2, 3, 4].map(() => `https://picsum.photos/900/500?random&t=${Math.random()}`);
  userIsAuthenticated = false;
  private authListnerSubs: Subscription;
  email: string;
  active: boolean;

  constructor(public authService: AuthService, public toastr: ToastrService,config: NgbCarouselConfig) {
    config.interval = 1000;
    config.wrap = true;
    config.keyboard = true;
    config.pauseOnHover = true;
  }

  ngOnInit() {
    this.active = false;
    this.email = this.authService.getEmail();
    this.userIsAuthenticated = this.authService.getIsAuth();
    this.authListnerSubs = this.authService
    .getauthUserStatusListner()
    .subscribe(isAuthenticated => {
      this.userIsAuthenticated = isAuthenticated;
    });

  }


  toggleClass(){
    this.active = !this.active;
  }


  onLogout() {
    this.toastr.success('Logout Successfully');
    this.authService.logout();
  }

  checkSuccess() {
    this.toastr.success("test success");
    console.log("test success");
  }



  ngOnDestroy() {
    this.authListnerSubs.unsubscribe();
}


}
