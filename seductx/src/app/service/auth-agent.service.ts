import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import { environment } from '../../environments/environment';
import { Subject } from 'rxjs';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { CookieService } from 'ngx-cookie-service';

const API_URL = environment.apiUrl + 'agent';
@Injectable({ providedIn: 'root'})


export class AuthAgentService {
  private isAgentAuthenticated = false;
  private token: string;
  private tokenTimer: any;
  private agentId: string;
  private email: string;
  private authAgentStatusListner = new Subject<boolean>();
  constructor(
    private http: HttpClient ,
    private router: Router,
    private toastr: ToastrService,
    private cookieService: CookieService) {}


    getToken() {
      return this.token;
    }

    getIsAuth() {
      return this.isAgentAuthenticated;
    }

    getAgentId() {
      return this.agentId;
    }

    getEmail() {
      return this.email;
    }

    getauthAgentStatusListner() {
      return this.authAgentStatusListner.asObservable();
    }


  createAgent(
    first_name: string,
    last_name: string ,
    email: string ,
    password: string ,
    country_code: string ,
    phone_number: string,
    latitude: string,
    longitude: string,
    agency_name: string) {
    const authData = new FormData();
    authData.append('first_name', first_name);
    authData.append('last_name', last_name);
    authData.append('email', email);
    authData.append('password', password);
    authData.append('country_code', country_code);
    authData.append('phone_number', phone_number);
    authData.append('latitude', latitude);
    authData.append('longitude', longitude);
    authData.append('agency_name', agency_name);
    this.http.post<{
      success: string,
      message: string,
      agent_id: string,
      mobile_otp: string,
      agentinfo: any}>
      (API_URL + '/signup', authData)
      .subscribe((response) => {
      if (response.success  === '1') {
        this.cookieService.set( 'agent_otp', response.mobile_otp);
        this.cookieService.set( 'agent_phone_number', response.agentinfo.phone_number);
        this.cookieService.set( 'agent_country_code', response.agentinfo.country_code);
        this.toastr.success(response.message);
        this.router.navigate(['/home/agentOtpVerify', response.agent_id]);
      } else {
        this.toastr.error(response.message);
        this.router.navigate(['/home/signup']);
      }


    }, error => {
      this.authAgentStatusListner.next(false);
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
      agent_id: string,
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
             this.router.navigate(['/home/agentPhone', response.agent_id]);
          } else {
            const expiresInDuration = response.expiresIn;
            this.setAuthTimer(expiresInDuration);
            this.isAgentAuthenticated = true;
            this.agentId = response.agent_id;
            this.email = response.email;
            this.authAgentStatusListner.next(true);
            const now = new Date();
            const expirationAgentDate = new Date(now.getTime() + expiresInDuration * 1000);
            this.sveAuthData(token, expirationAgentDate, this.agentId ,this.email);
            this.toastr.success(response.message);
            this.router.navigate(['/agent/agentdashboard']);
          }
      } else {
        this.authAgentStatusListner.next(false);
        this.toastr.error(response.message);
        this.router.navigate(['/home/agentLogin']);
      }
    }, error => {
      this.authAgentStatusListner.next(false);
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
      this.authAgentStatusListner.next(false);
    });
  }



  getCountryList() {
    return this.http.get<{ success: string; message: string; country_list: any;}>(
        API_URL + '/country_list'
    );
  }

  logout() {
    const authData = new FormData();
    authData.append('agent_id', this.agentId);
    this.http.post<{success: string, message: string}>
    ( API_URL + '/logout', authData)
    .subscribe(response => {
      localStorage.clear();
      this.token = null;
      this.isAgentAuthenticated = false;
      this.authAgentStatusListner.next(false);
      this.agentId = null;
      this.email = null;
      clearTimeout(this.tokenTimer);
      this.clearAuthData();
      this.router.navigate(['/']);
    }, error => {
      this.authAgentStatusListner.next(false);
    });
  }

  autoAuthAgent() {
    const authInformation = this.getAuthData();
    if (!authInformation) {
        return;
    }

    const now = new Date();
    const expiresIn = authInformation.expirationAgentDate.getTime() - now.getTime();
    if (expiresIn > 0) {
      this.token = authInformation.token;
      this.isAgentAuthenticated = true;
      this.agentId = authInformation.agentId;
      this.email = authInformation.email;
      this.setAuthTimer(expiresIn / 1000);
      this.authAgentStatusListner.next(true);
    }
  }

  private setAuthTimer(duration: number) {
    this.tokenTimer = setTimeout(() => {
      this.logout();
    }, duration * 1000);
  }


  private sveAuthData(token: string, expirationAgentDate: Date, agentId: string, email: string) {
    localStorage.setItem('token', token);
    localStorage.setItem('expirationAgent', expirationAgentDate.toISOString());
    localStorage.setItem('agentId', agentId);
    localStorage.setItem('email', email);
  }

  private clearAuthData() {
    localStorage.removeItem('token');
    localStorage.removeItem('expirationAgent');
    localStorage.removeItem('agentId');
    localStorage.removeItem('email');
  }

  private getAuthData() {
    const token = localStorage.getItem('token');
    const expirationAgentDate = localStorage.getItem('expirationAgent');
    const agentId = localStorage.getItem('agentId');
    const email = localStorage.getItem('email');
    if (!token && !expirationAgentDate) {
      return;
    }

    return {
      token: token,
      expirationAgentDate: new Date(expirationAgentDate),
      agentId: agentId,
      email: email
    }
  }

}

