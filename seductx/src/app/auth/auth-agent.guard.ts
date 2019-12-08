import { CanActivate, ActivatedRouteSnapshot , RouterStateSnapshot, Router} from '@angular/router';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { AuthAgentService } from '../service/auth-agent.service';

@Injectable()

export class AuthAgentGuard implements CanActivate {
  constructor(private authService: AuthAgentService, private router: Router){}
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
    ): boolean  | Observable<boolean>  | Promise<boolean> {
      const isAgentAuth = this.authService.getIsAuth();
      if (!isAgentAuth)
      {
        this.router.navigate(['/home/agentLogin']);
      }
      return isAgentAuth;
  }

}
