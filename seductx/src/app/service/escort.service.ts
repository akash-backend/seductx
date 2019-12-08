import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import {AuthData} from '../model/auth-data.model';
import { AuthLoginData} from '../model/auth-login-data.model';
import { environment } from '../../environments/environment';
import { Subject } from 'rxjs';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import {EscortGeneralProfile} from '../model/escortGeneralProfile.model';
import { CookieService } from 'ngx-cookie-service';

const API_URL = environment.apiUrl + 'escort';
@Injectable({ providedIn: 'root'})

export class EscortService {

  constructor(
    private http: HttpClient ,
    private router: Router,
    private toastr: ToastrService,
    private cookieService: CookieService) {}

  getUserProfileAdditionalInfo(){
    return this.http.get<{ success: string; message: string; body_type_info: any; bust_size_info: any;cup_size_info: any;chinese_info: any;gender_info: any;hip_size_info: any;japanese_info: any;korean_info: any;waise_size_info: any; english_info: any; countries_info: any; agent_info: any}>(
        API_URL + '/get_profile_info'
    );
}


getUserAddtionalServiceInfo(){
  return this.http.get<{ success: string; message: string; service_info: any; additional_service_info: any}>(
      API_URL + '/get_services_info'
  );
}


getUserAddtionalRatesInfo(){
  return this.http.get<{ success: string; message: string; rates_list: any; }>(
      API_URL + '/get_rates_info'
  );
}


getProfileInfo(escortId: string) {

  const profileData = new FormData();
  profileData.append('escort_id', escortId);

  return this.http.post<{ success: string; message: string; escortinfo: any; }>(
      API_URL + '/getProfile/', profileData
  );
}


getGenralProfileInfo(escortId: string) {
  const profileData = new FormData();
  profileData.append('escort_id', escortId);

  return this.http.post<{ success: string; message: string; escortinfo: EscortGeneralProfile; }>(
      API_URL + '/getGenralProfile/', profileData
  );
}


getSubscriptionStatus(escortId: string) {
  const data = new FormData();
  data.append('escort_id', escortId);
  return this.http.post<{ success: string; message: string; subscription_status: string; }>(
    API_URL + '/checkSubscription/' , data
  );
}

getProfileInfoByEmail(email: string) {
  const profileData = new FormData();
  profileData.append('email', email);

  return this.http.post<{ success: string; message: string; escortInfo: any; }>(
      API_URL + '/getEscortByEmail/', profileData
  );
}

getStateByStateId(id: string) {
  const data = new FormData();
  data.append('country_id', id);
  return this.http.post<{ success: string; message: string; state_list: any; }>(
    API_URL + '/state_list/' , data
  );
}

getCityByCityId(id: string) {
  const data = new FormData();
  data.append('country_id', id);
  return this.http.post<{ success: string; message: string; cities_list: any; }>(
    API_URL + '/city_list/' , data
  );
}



getSubscriptionPlan() {
  const data = new FormData();
  return this.http.post<{ success: string; message: string; plan_list: any; }>(
    API_URL + '/subscriptionPlanList/' , data
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



addSupport(escortId: string, email: string, comment: string) {
  const supportData = new FormData();
  supportData.append('escort_id', escortId);
  supportData.append('email', email);
  supportData.append('comment', comment);

  return this.http.post<{success: string; message: string;}>(
    API_URL + '/support/', supportData
  );
}


resendOtp(phoneNumber: string, countryCode: string) {
  const profileData = new FormData();
  profileData.append('country_code', countryCode);
  profileData.append('phone_number', phoneNumber);
  return this.http.post<{ success: string; message: string; mobile_otp: string}>(
      API_URL + '/resend_otp/', profileData
  );
}



updatePhoneNumberStatus(escortId: string) {
  const profileData = new FormData();
  profileData.append('escort_id', escortId);
  profileData.append('mobile_verify', '1');
  return this.http.post<{ success: string; message: string}>(
      API_URL + '/updateProfile/', profileData
  );
}


updatePhone(escortId: string, countryCode: string, phoneNumber: string) {
  const profileData = new FormData();
  profileData.append('escort_id', escortId);
  profileData.append('country_code', countryCode);
  profileData.append('phone_number', phoneNumber);

  this.http.post<{ success: string; message: string; mobile_otp: string}>(
      API_URL + '/updatePhone/', profileData
  ).subscribe(response => {
      if (response.success  === '1') {
        this.cookieService.set( 'escort_otp', response.mobile_otp);
        this.cookieService.set( 'escort_phone_number', phoneNumber);
        this.cookieService.set( 'escort_country_code', countryCode);
        this.router.navigate(['/home/escortOtpVerify', escortId]);
      } else {
        console.log('error');
        this.toastr.error(response.message);
        this.router.navigate(['/home/login']);
      }
  });
}



contactUs(name: string, message: string, email: string) {
  const contactData = new FormData();
  contactData.append('name', name);
  contactData.append('message', message);
  contactData.append('email', email);

  this.http.post<{ success: string; message: string; mobile_otp: string}>(
      API_URL + '/contactUs/', contactData
  ).subscribe(response => {
      if (response.success  === '1') {
        this.toastr.success(response.message);
        this.router.navigate(['/']);
      } else {
        this.toastr.error(response.message);
        this.router.navigate(['/']);
      }
  });
}



}
