import { CanActivate, ActivatedRouteSnapshot , RouterStateSnapshot, Router} from '@angular/router';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { AuthEscortService } from '../service/auth-escort.service';
import { AuthService } from '../service/auth.service';
import { AuthAgentService } from '../service/auth-agent.service';

@Injectable()

export class AuthBothGuard implements CanActivate {
  constructor(
    private authAgentService: AuthAgentService,
    private authEscortService: AuthEscortService,
    private authService: AuthService,
    private router: Router){}
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
    ): boolean  | Observable<boolean>  | Promise<boolean> {
      const isAuth = this.authEscortService.getIsAuth();
      const isUserAuth = this.authService.getIsAuth();
      const isAgentAuth = this.authAgentService.getIsAuth();
      const isAuthBoth = true;

      if (isAuth) {
        this.router.navigate(['/escort/request']);
      } else if (isUserAuth) {
        this.router.navigate(['/user/profile']);
      } else if (isAgentAuth) {
        this.router.navigate(['/agent/agentdashboard']);
      } else {
        const isAuthBoth = true;
      }
      return isAuthBoth;
  }

}
