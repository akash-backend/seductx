import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {AuthData} from '../model/auth-data.model';
import { AuthLoginData} from '../model/auth-login-data.model';
import { environment } from '../../environments/environment';
import { Subject } from 'rxjs';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { CookieService } from 'ngx-cookie-service';

const API_URL = environment.apiUrl + 'escort';
@Injectable({ providedIn: 'root'})


export class AuthEscortService {
  private isAuthenticated = false;
  private token: string;
  private tokenTimer: any;
  private escortId: string;
  private email: string;
  private profileImage: string;
  private authStatusListner = new Subject<boolean>();
  constructor(
    private http: HttpClient ,
    private router: Router,
    private toastr: ToastrService,
    private cookieService: CookieService) {}


  getToken() {
    return this.token;
  }

  getIsAuth() {
    return this.isAuthenticated;
  }

  getEscortId() {
    return this.escortId;
  }

  getEmail() {
    return this.email;
  }

  getProfileImage() {
    return this.profileImage;
  }

  getAuthStatusListner() {
    return this.authStatusListner.asObservable();
  }


  createEscort(
    first_name: string,
    last_name: string ,
    email: string ,
    password: string ,
    country_code: string ,
    phone_number: string,
    latitude: string,
    longitude: string,
    agentId: string,
    escortType: string) {
    const authData = new FormData();

    authData.append('agent_id', agentId);
    authData.append('first_name', first_name);
    authData.append('last_name', last_name);
    authData.append('email', email);
    authData.append('password', password);
    authData.append('country_code', country_code);
    authData.append('phone_number', phone_number);
    authData.append('latitude', latitude);
    authData.append('longitude', longitude);
    this.http.post<{
      success: string,
      message: string,
      escort_id: string,
      mobile_otp: string,
      escortinfo: any}>
      (API_URL + '/signup', authData)
      .subscribe((response) => {
      if (response.success  === '1') {
        this.cookieService.set( 'escort_otp', response.mobile_otp);
        this.cookieService.set( 'escort_phone_number', response.escortinfo.phone_number);
        this.cookieService.set( 'escort_country_code', response.escortinfo.country_code);

        if (escortType === '1') {
          this.toastr.success(response.message);
          this.router.navigate(['/home/escortOtpVerify', response.escort_id]);
        } else {
          this.toastr.success('Escort added successfully');
          this.router.navigate(['/agent/agentEscortList']);
        }

      } else {
        this.toastr.error(response.message);
        this.router.navigate(['/home/signup']);
      }


    }, error => {
      this.authStatusListner.next(false);
    });
  }

  login(email: string, password: string, message: string) {
    this.logout();
    const authData = new FormData();
    authData.append('email', email);
    authData.append('password', password);
    authData.append('deviceToken', message);
    this.http.post<{
      success: string,
      message: string,
      escort_id: string,
      email: string,
      profile_image: string,
      token: string,
      expiresIn: number,
      progress_status: string,
      mobile_verify: string}>
    ( API_URL + '/login', authData)
    .subscribe(response => {
      console.log(response);
      const token = response.token;
      this.token = token;
      if (response.success  === '1' && token) {
          if  (response.mobile_verify === '0') {
            this.router.navigate(['/home/escortPhone', response.escort_id]);
          } else if  (response.progress_status === '0') {
            this.router.navigate(['/home/escortprofile', response.escort_id]);
          } else if (response.progress_status === '1') {
            this.router.navigate(['/home/escortservice', response.escort_id]);
          } else if (response.progress_status === '2') {
            this.router.navigate(['/home/escortrates', response.escort_id]);
          } else if (response.progress_status === '3') {
            this.router.navigate(['/home/escortimage', response.escort_id]);
          } else {
            const expiresInDuration = response.expiresIn;
            this.setAuthTimer(expiresInDuration);
            this.isAuthenticated = true;
            this.escortId = response.escort_id;
            this.email = response.email;
            this.profileImage = response.profile_image;
            this.authStatusListner.next(true);
            const now = new Date();
            const expirationDate = new Date(now.getTime() + expiresInDuration * 1000);
            this.sveAuthData(token, expirationDate, this.escortId , this.email, this.profileImage);
            this.toastr.success(response.message);
            this.router.navigate(['/escort/request']);
          }
      } else {
        this.authStatusListner.next(false);
        this.toastr.error(response.message);
        this.router.navigate(['/']);
      }
    }, error => {
      this.authStatusListner.next(false);
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
      this.authStatusListner.next(false);
    });
  }


  escortImageUpload(escortId: string, profileImage: File, image1: File, image2: File, image3: File, image4: File, image5: File, image6: File, redirectType: string, progress_status: string) {
    const imageData = new FormData();
    imageData.append('escort_id', escortId);
    imageData.append('profile_image', profileImage);
    imageData.append('image1', image1);
    imageData.append('image2', image2);
    imageData.append('image3', image3);
    imageData.append('image4', image4);
    imageData.append('image5', image5);
    imageData.append('image6', image6);
    imageData.append('progress_status', progress_status);

    this.http
      .post<{ success: string; message: string; escort_id: number}>(
        API_URL + '/updateProfile',
        imageData
      )
      .subscribe(response => {
        if (response.success  == '1') {
          this.toastr.success(response.message);
          if  (redirectType === '1') {
            this.router.navigate(['/home/escortLogin']);
          } else {
            this.router.navigate(['/escort/profile']);
          }
        } else {
          this.toastr.error(response.message);
          this.router.navigate(['/home/escortimage', response.escort_id]);
        }
      });
  }



  updateProfile(
    escortId: string,
    country_id: string,
    city_id: string,
    gender: string,
    body_type: string,
    age: string,
    height: string,
    bust_size: string,
    cup_size: string,
    waise_size: string,
    hip_size: string,
    english: string,
    chinese: string,
    japanese: string,
    korean: string,
    redirectType: string,
    progress_status: string) {
    const profileData = new FormData();
    profileData.append('escort_id', escortId);
    profileData.append('country_id', country_id);
    profileData.append('city_id', city_id);
    profileData.append('gender', gender);
    profileData.append('body_type', body_type);
    profileData.append('age', age);
    profileData.append('height', height);
    profileData.append('bust_size', bust_size);
    profileData.append('cup_size', cup_size);
    profileData.append('waise_size', waise_size);
    profileData.append('hip_size', hip_size);
    profileData.append('english', english);
    profileData.append('chinese', chinese);
    profileData.append('japanese', japanese);
    profileData.append('korean', korean);
    profileData.append('progress_status', progress_status);
    this.http
      .post<{ success: string; message: string; escort_id: number }>(
        API_URL + '/updateProfile',
        profileData
      )
      .subscribe(response => {
        if (response.success  === '1') {
          this.toastr.success(response.message);
          if(redirectType === '1') {
            this.router.navigate(['/home/escortservice', response.escort_id]);
          } else {
            this.router.navigate(['/escort/profile']);
          }
        } else {
          this.toastr.error(response.message);
          this.router.navigate(['/home/escortprofile', response.escort_id]);
        }
      });
  }



  updateService(escortId: string, service: string, additionalService: any, redirectType: string, progress_status: string) {
    const profileData = new FormData();
    profileData.append('escort_id', escortId);
    profileData.append('service', service);
    profileData.append('additionalService', JSON.stringify(additionalService));
    profileData.append('progress_status', progress_status);

    this.http
      .post<{ success: string; message: string; escort_id: number }>(
        API_URL + '/updateProfile',
        profileData
      )
      .subscribe(response => {
        if (response.success  == '1') {
          this.toastr.success(response.message);
          if  (redirectType === '1') {
            this.router.navigate(['/home/escortrates', response.escort_id]);
          } else {
            this.router.navigate(['/escort/profile']);
          }
        } else {
          this.toastr.error(response.message);
          this.router.navigate(['/home/escortservice', response.escort_id]);
        }
      });
  }



  updateRates(escortId: string, rates: any, cancellation_policy: string, payment_method: string, redirectType: string, progress_status: string) {
    const profileData = new FormData();
    profileData.append('escort_id', escortId);
    profileData.append('cancellation_policy', cancellation_policy);
    profileData.append('payment_method', payment_method);
    profileData.append('rates', JSON.stringify(rates));
    profileData.append('progress_status', progress_status);

    this.http
      .post<{ success: string; message: string; escort_id: number }>(
        API_URL + '/updateProfile',
        profileData
      )
      .subscribe(response => {
        if (response.success  == '1') {
          this.toastr.success(response.message);

          if  (redirectType === '1') {
            this.router.navigate(['/home/escortimage', response.escort_id]);
          } else {
            this.router.navigate(['/escort/profile']);
          }
        } else {
          this.toastr.error(response.message);
          this.router.navigate(['/home/escortrates', response.escort_id]);
        }
      });
  }





  logout() {
    const authData = new FormData();
    authData.append('escort_id', this.escortId);
    this.http.post<{success: string, message: string}>
    ( API_URL + '/logout', authData)
    .subscribe(response => {
      localStorage.clear();
      this.token = null;
      this.isAuthenticated = false;
      this.authStatusListner.next(false);
      this.escortId = null;
      this.email = null;
      this.profileImage = null;
      clearTimeout(this.tokenTimer);
      this.clearAuthData();
      this.router.navigate(['/']);
    }, error => {
      this.authStatusListner.next(false);
    });
  }

  getCountryList() {
    return this.http.get<{ success: string; message: string; country_list: any;}>(
        API_URL + '/country_list'
    );
  }

  autoAuthEscort() {
    const authInformation = this.getAuthData();
    if (!authInformation) {
        return;
    }

    const now = new Date();
    const expiresIn = authInformation.expirationDate.getTime() - now.getTime();
    if (expiresIn > 0) {
      this.token = authInformation.token;
      this.isAuthenticated = true;
      this.escortId = authInformation.escortId;
      this.email = authInformation.email;
      this.profileImage = authInformation.profileImage;
      this.setAuthTimer(expiresIn / 1000);
      this.authStatusListner.next(true);
    }
  }

  private setAuthTimer(duration: number) {
    this.tokenTimer = setTimeout(() => {
      this.logout();
    }, duration * 1000);
  }


  private sveAuthData(token: string, expirationDate: Date, escortId: string, email: string, profileImage: string) {
    localStorage.setItem('token', token);
    localStorage.setItem('expiration', expirationDate.toISOString());
    localStorage.setItem('escortId', escortId);
    localStorage.setItem('email', email);
    localStorage.setItem('profileImage', profileImage);
  }

  private clearAuthData() {
    localStorage.removeItem('token');
    localStorage.removeItem('expiration');
    localStorage.removeItem('escortId');
    localStorage.removeItem('email');
    localStorage.removeItem('profileImage');
  }

  private getAuthData() {
    const token = localStorage.getItem('token');
    const expirationDate = localStorage.getItem('expiration');
    const escortId = localStorage.getItem('escortId');
    const email = localStorage.getItem('email');
    const profileImage = localStorage.getItem('profileImage');
    if (!token && !expirationDate) {
      return;
    }

    return {
      token: token,
      expirationDate: new Date(expirationDate),
      escortId: escortId,
      email: email,
      profileImage: profileImage
    }
  }

}

