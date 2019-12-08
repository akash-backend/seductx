import { Component, OnInit , OnDestroy} from '@angular/core';
import { AuthAgentService } from '../../../service/auth-agent.service';
import { Subscription } from 'rxjs';
import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.css']
})
export class NavigationComponent implements OnInit, OnDestroy {

  active: boolean;
  agentIsAuthenticated = false;
  email: string;
  profileImage: string;

  private authListnerSubs: Subscription;

  constructor(public authService: AuthAgentService, public toastr: ToastrService, private router: Router) { }

  ngOnInit() {
    this.active = false;
    this.email = this.authService.getEmail();
    this.agentIsAuthenticated = this.authService.getIsAuth();
    this.authListnerSubs = this.authService
    .getauthAgentStatusListner()
    .subscribe(isAuthenticated => {
      this.agentIsAuthenticated = isAuthenticated;
    });

  }

  toggleClass(){
    this.active = !this.active;
  }


  onLogout() {
    this.toastr.success('Logout Successfully');
    this.authService.logout();
    this.router.navigate(['/home/agentLogin']);
  }

  checkSuccess() {
    console.log('test success');
  }

  ngOnDestroy() {
    this.authListnerSubs.unsubscribe();
}

}
