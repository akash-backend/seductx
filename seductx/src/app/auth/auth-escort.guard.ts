import { CanActivate, ActivatedRouteSnapshot , RouterStateSnapshot, Router} from '@angular/router';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { AuthEscortService } from '../service/auth-escort.service';

@Injectable()

export class AuthEscortGuard implements CanActivate {
  constructor(private authService: AuthEscortService, private router: Router){}
  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot
    ): boolean  | Observable<boolean>  | Promise<boolean> {
      const isAuth = this.authService.getIsAuth();
      console.log('isAuthsdescorteeeeeeeeeeeeeeeeeeeeeeeee');
      console.log(isAuth);
      console.log('isAuthsdescorteeeeeeeeeeeeeeeeeeeeeeeee');
      if (!isAuth)
      {
        this.router.navigate(['/home/escortLogin']);
      }
      return isAuth;
  }

}
