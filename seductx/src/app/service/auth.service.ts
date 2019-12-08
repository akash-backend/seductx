import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {AuthData} from '../model/auth-data.model';
import { AuthLoginData} from '../model/auth-login-data.model';
import { environment } from '../../environments/environment';
import { CookieService } from 'ngx-cookie-service';
import { Subject } from 'rxjs';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

const API_URL = environment.apiUrl + 'user';
@Injectable({ providedIn: 'root'})


export class AuthService {
  private isUserAuthenticated = false;
  private token: string;
  private tokenTimer: any;
  private userId: string;
  private email: string;
  private authUserStatusListner = new Subject<boolean>();
  constructor(
    private http: HttpClient ,
    private router: Router,
    private toastr: ToastrService,
    private cookieService: CookieService
    ) {}


  getToken() {
    return this.token;
  }

  getIsAuth() {
    return this.isUserAuthenticated;
  }

  getUserId() {
    return this.userId;
  }

  getEmail() {
    return this.email;
  }

  getauthUserStatusListner() {
    return this.authUserStatusListner.asObservable();
  }


  createUser(
    first_name: string,
    last_name: string ,
    email: string ,
    password: string ,
    country_code: string ,
    phone_number: string,
    latitude: string,
    longitude: string) {
    const authData = new FormData();
    authData.append('first_name', first_name);
    authData.append('last_name', last_name);
    authData.append('email', email);
    authData.append('password', password);
    authData.append('country_code', country_code);
    authData.append('phone_number', phone_number);
    authData.append('latitude', latitude);
    authData.append('longitude', longitude);
    this.http.post<{success: string, message: string, userinfo: any}>(API_URL + '/signup', authData)
    .subscribe((response) => {
      if (response.success  === '1') {
        this.cookieService.set( 'user_otp', response.userinfo.mobile_otp);
        this.cookieService.set( 'user_phone_number', response.userinfo.phone_number);
        this.cookieService.set( 'user_country_code', response.userinfo.country_code);
        console.log(response.userinfo.mobile_otp);
        this.toastr.success(response.message);
        this.router.navigate(['/home/otpVerify', response.userinfo.user_id]);
      } else {
        console.log('error');
        this.toastr.error(response.message);
        this.router.navigate(['/']);
      }


    }, error => {
      this.authUserStatusListner.next(false);
    });
  }

  login(email: string, password: string, message: string) {
    localStorage.clear();
    const authData = new FormData();
    authData.append('email', email);
    authData.append('password', password);
    authData.append('password', password);
    authData.append('deviceToken', message);
    this.http.post<{
      success: string,
      message: string,
      user_id: string,
      email: string,
      token: string,
      expiresIn: number,
      mobile_verify: string}>
    ( API_URL + '/login', authData)
    .subscribe(response => {
      const token = response.token;
      this.token = token;
      if (response.success  === '1' && token) {
          console.log(response.mobile_verify);
          if (response.mobile_verify === '0') {
             this.router.navigate(['/home/userPhone', response.user_id]);
          } else {
            const expiresInDuration = response.expiresIn;
            this.setAuthTimer(expiresInDuration);
            this.isUserAuthenticated = true;
            this.userId = response.user_id;
            this.email = response.email;
            this.authUserStatusListner.next(true);
            const now = new Date();
            const expirationUserDate = new Date(now.getTime() + expiresInDuration * 1000);
            this.sveAuthData(token, expirationUserDate, this.userId ,this.email);
            this.toastr.success(response.message);
            this.router.navigate(['/user/profile']);
          }
      } else {
        this.authUserStatusListner.next(false);
        this.toastr.error(response.message);
        this.router.navigate(['/home/login']);
      }
    }, error => {
      this.authUserStatusListner.next(false);
    });
  }

  forgot_password(email: string) {
    const authData = new FormData();
    authData.append('email', email);
    this.http.post<{success: string, message: string}>
    ( API_URL + '/forgot_password', authData)
    .subscribe(response => {
      if (response.success  == '1') {
          this.toastr.success(response.message);
      } else {
        this.toastr.error(response.message);
      }
    }, error => {
      this.authUserStatusListner.next(false);
    });
  }

  getCountryList(){
    return this.http.get<{ success: string; message: string; country_list: any;}>(
        API_URL + '/country_list'
    );
  }

  logout() {
    const authData = new FormData();
    authData.append('user_id', this.userId);
    this.http.post<{success: string, message: string}>
    ( API_URL + '/logout', authData)
    .subscribe(response => {
      localStorage.clear();
      this.token = null;
      this.isUserAuthenticated = false;
      this.authUserStatusListner.next(false);
      this.userId = null;
      this.email = null;
      clearTimeout(this.tokenTimer);
      this.clearAuthData();
      this.router.navigate(['/']);
    }, error => {
      this.authUserStatusListner.next(false);
    });
  }

  autoAuthUser() {
    const authInformation = this.getAuthData();
    if (!authInformation) {
        return;
    }

    const now = new Date();
    const expiresIn = authInformation.expirationUserDate.getTime() - now.getTime();
    if (expiresIn > 0) {
      this.token = authInformation.token;
      this.isUserAuthenticated = true;
      this.userId = authInformation.userId;
      this.email = authInformation.email;
      this.setAuthTimer(expiresIn / 1000);
      this.authUserStatusListner.next(true);
    }
  }

  private setAuthTimer(duration: number) {
    this.tokenTimer = setTimeout(() => {
      this.logout();
    }, duration * 1000);
  }


  private sveAuthData(token: string, expirationUserDate: Date, userId: string, email: string) {
    localStorage.setItem('token', token);
    localStorage.setItem('expirationUser', expirationUserDate.toISOString());
    localStorage.setItem('userId', userId);
    localStorage.setItem('email', email);
  }

  private clearAuthData() {
    localStorage.removeItem('token');
    localStorage.removeItem('expirationUser');
    localStorage.removeItem('userId');
    localStorage.removeItem('email');
  }

  private getAuthData() {
    const token = localStorage.getItem('token');
    const expirationUserDate = localStorage.getItem('expirationUser');
    const userId = localStorage.getItem('userId');
    const email = localStorage.getItem('email');
    if (!token && !expirationUserDate) {
      return;
    }

    return {
      token: token,
      expirationUserDate: new Date(expirationUserDate),
      userId: userId,
      email: email
    }
  }

}

