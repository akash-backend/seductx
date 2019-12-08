import { Component, OnInit , OnDestroy} from '@angular/core';
import { AuthEscortService } from '../../../service/auth-escort.service';
import { Subscription } from 'rxjs';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import {OnlineService} from '../../../service/online.service';

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.css']
})
export class NavigationComponent implements OnInit, OnDestroy {
  active: boolean;
  escortIsAuthenticated = false;
  email: string;
  profileImage: string;
  escortId: string;

  private authListnerSubs: Subscription;

  constructor(
    public onlineService: OnlineService,
    public authService: AuthEscortService,
    public toastr: ToastrService,
    private router: Router) { }

  ngOnInit() {
    this.escortId = this.authService.getEscortId();
    this.active = false;
    this.email = this.authService.getEmail();
    this.profileImage = this.authService.getProfileImage();
    this.escortIsAuthenticated = this.authService.getIsAuth();
    this.authListnerSubs = this.authService
    .getAuthStatusListner()
    .subscribe(isAuthenticated => {
      this.escortIsAuthenticated = isAuthenticated;
    });

  }

  toggleClass(){
    this.active = !this.active;
  }


  onLogout() {

    this.onlineService.escortOffline({userId: this.escortId});
    this.toastr.success('Logout Successfully');
    this.authService.logout();
    this.router.navigate(['/home/escortLogin']);


  }

  checkSuccess() {
    console.log('test success');
  }

  ngOnDestroy() {
    this.authListnerSubs.unsubscribe();
}

}
