import {Injectable} from '@angular/core';
import {HttpClient} from '@angular/common/http';
import { environment } from '../../environments/environment';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { CookieService } from 'ngx-cookie-service';

const API_URL = environment.apiUrl + 'agent';
@Injectable({ providedIn: 'root'})

export class AgentService {

constructor(
  private http: HttpClient ,
  private router: Router,
  private toastr: ToastrService,
  private cookieService: CookieService) {}

  getProfileInfo(agentId: string) {

    const profileData = new FormData();
    profileData.append('agent_id', agentId);

    return this.http.post<{ success: string; message: string; agentinfo: any; }>(
        API_URL + '/getProfile/', profileData
    );
  }



  changePassword(agentId: string, password: string, new_password: string) {
    const updateAgentData = new FormData();

    updateAgentData.append('agent_id', agentId);
    updateAgentData.append('old_password', password);
    updateAgentData.append('new_password', new_password);


    this.http
    .post<{success: string; message: string;}>(
        API_URL + '/change_password',
        updateAgentData
    )
    .subscribe(response => {
        if (response.success  == '1') {
          this.toastr.success(response.message);
          this.router.navigate(['/agent/profile']);
        } else {
          this.toastr.error(response.message);
          this.router.navigate(['/agent/profile']);
        }
    })
}




getProfileInfoByEmail(email: string) {
  const profileData = new FormData();
  profileData.append('email', email);

  return this.http.post<{ success: string; message: string; agentInfo: any; }>(
      API_URL + '/getAgentByEmail/', profileData
  );
}



updatePhoneNumberStatus(agentId: string) {
  const profileData = new FormData();
  profileData.append('agent_id', agentId);
  profileData.append('mobile_verify', '1');
  return this.http.post<{ success: string; message: string}>(
      API_URL + '/updateProfile/', profileData
  );
}


updatePhone(agentId: string, countryCode: string, phoneNumber: string) {
  const profileData = new FormData();
  profileData.append('agent_id', agentId);
  profileData.append('country_code', countryCode);
  profileData.append('phone_number', phoneNumber);

  this.http.post<{ success: string; message: string; mobile_otp: string}>(
      API_URL + '/updatePhone/', profileData
  ).subscribe(response => {
      if (response.success  === '1') {
        this.cookieService.set( 'agent_otp', response.mobile_otp);
        this.cookieService.set( 'agent_phone_number', phoneNumber);
        this.cookieService.set( 'agent_country_code', countryCode);
        this.router.navigate(['/home/otpVerify', agentId]);
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


}
