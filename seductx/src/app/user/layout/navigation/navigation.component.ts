import { Component, OnInit , OnDestroy} from '@angular/core';
import { AuthService } from '../../../service/auth.service';
import { Subscription } from 'rxjs';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.css']
})
export class NavigationComponent implements OnInit, OnDestroy {
  userIsAuthenticated = false;
  email: string;
  private authListnerSubs: Subscription;
  active: boolean;

  constructor(public authService: AuthService, public toastr: ToastrService, private router: Router) { }

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
    this.router.navigate(['/home/login']);
  }

  checkSuccess() {

    console.log('test success');
  }

  ngOnDestroy() {
    this.authListnerSubs.unsubscribe();
}


}
