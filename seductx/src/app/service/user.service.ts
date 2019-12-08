import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {AuthData} from '../model/auth-data.model';
import { AuthLoginData} from '../model/auth-login-data.model';
import { environment } from '../../environments/environment';
import { Subject } from 'rxjs';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { CookieService } from 'ngx-cookie-service';

const API_URL = environment.apiUrl + 'user';
@Injectable({ providedIn: 'root'})

export class UserService {

constructor(
  private http: HttpClient ,
  private router: Router,
  private toastr: ToastrService,
  private cookieService: CookieService) {}

  getProfileInfo(userId: string) {

    const profileData = new FormData();
    profileData.append('user_id', userId);

    return this.http.post<{ success: string; message: string; userinfo: any; }>(
        API_URL + '/getProfile/', profileData
    );
  }


  faq() {
    return this.http.get<{ success: string; message: string; result: any; }>(
        API_URL + '/get_faq'
    );
  }

  privacy_policy() {
    return this.http.get<{ success: string; message: string; result: any; }>(
        API_URL + '/get_privacy_policy'
    );
  }

  terms() {
    return this.http.get<{ success: string; message: string; result: any; }>(
        API_URL + '/get_terms_condition'
    );
  }

  changePassword(userId: string, password: string, new_password: string) {
    const updateUserData = new FormData();

    updateUserData.append('user_id', userId);
    updateUserData.append('old_password', password);
    updateUserData.append('new_password', new_password);


    this.http
    .post<{success: string; message: string;}>(
        API_URL + '/change_password',
        updateUserData
    )
    .subscribe(response => {
        if (response.success  == '1') {
          this.toastr.success(response.message);
          this.router.navigate(['/user/profile']);
        } else {
          this.toastr.error(response.message);
          this.router.navigate(['/user/profile']);
        }
    })
}


getSubscriptionPlan() {
  const data = new FormData();
  return this.http.post<{ success: string; message: string; plan_list: any; }>(
    API_URL + '/subscriptionPlanList/' , data
  );
}

getProfileInfoByEmail(email: string) {
  const profileData = new FormData();
  profileData.append('email', email);

  return this.http.post<{ success: string; message: string; userInfo: any; }>(
      API_URL + '/getUserByEmail/', profileData
  );
}



updatePhoneNumberStatus(userId: string) {
  const profileData = new FormData();
  profileData.append('user_id', userId);
  profileData.append('mobile_verify', '1');
  return this.http.post<{ success: string; message: string}>(
      API_URL + '/updateProfile/', profileData
  );
}


updatePhone(userId: string, countryCode: string, phoneNumber: string) {
  const profileData = new FormData();
  profileData.append('user_id', userId);
  profileData.append('country_code', countryCode);
  profileData.append('phone_number', phoneNumber);

  this.http.post<{ success: string; message: string; mobile_otp: string}>(
      API_URL + '/updatePhone/', profileData
  ).subscribe(response => {
      if (response.success  === '1') {
        this.cookieService.set( 'user_otp', response.mobile_otp);
        this.cookieService.set( 'user_phone_number', phoneNumber);
        this.cookieService.set( 'user_country_code', countryCode);
        this.router.navigate(['/home/otpVerify', userId]);
      } else {
        console.log('error');
        this.toastr.error(response.message);
        this.router.navigate(['/home/login']);
      }
  });
}



resendOtp(phoneNumber: string, countryCode: string) {
  const profileData = new FormData();
  profileData.append('country_code', countryCode);
  profileData.append('phone_number', phoneNumber);
  return this.http.post<{ success: string; message: string; mobile_otp: string}>(
      API_URL + '/resend_otp/', profileData
  );
}



getSubscriptionStatus(userId: string) {
  const data = new FormData();
  data.append('user_id', userId);
  return this.http.post<{ success: string; message: string; subscription_status: string; }>(
    API_URL + '/checkSubscription/' , data
  );
}


getCountryList() {
  return this.http.get<{ success: string; message: string; country_list: any; }>(
      API_URL + '/countryData_list'
  );
}

getCityByCityId(id: string) {
  const data = new FormData();
  data.append('country_id', id);
  return this.http.post<{ success: string; message: string; cities_list: any; }>(
    API_URL + '/city_list/' , data
  );
}


addRatting(escortId: string, userId: string, rating: string) {
  const requestData = new FormData();
  requestData.append('escort_id', escortId);
  requestData.append('user_id', userId);
  requestData.append('rating', rating);

  return this.http.post<{success: string; message: string;}>(
    API_URL + '/addRating/', requestData
  );
}


}
