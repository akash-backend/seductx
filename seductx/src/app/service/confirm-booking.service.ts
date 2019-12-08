import {Injectable} from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Subject } from 'rxjs';
import { map } from 'rxjs/operators';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { ToastrService } from 'ngx-toastr';

import { environment } from '../../environments/environment';
const API_URL = environment.apiUrl + '/user';

@Injectable({providedIn: 'root'})

export class ConfirmBookingService {
    constructor(private http: HttpClient, private router: Router, private cookieService: CookieService, private toastr: ToastrService) {}

      addBooking(
        userName: string,
        userEmail: string,
        hotel: string,
        roomNo: string,
        specialRequest: string,
        rateId: string,
        escortId: string,
        userId: string,
        totalAmount: string,
        latitude: string,
        longitude: string,
        address: string,
        bookingDate: string,
        bookingCall: string) {
        const bookingData = new FormData();
        bookingData.append('user_id', userId);
        bookingData.append('escort_id', escortId);
        bookingData.append('rate_id', rateId);
        bookingData.append('user_name', userName);
        bookingData.append('user_email', userEmail);
        bookingData.append('hotel', hotel);
        bookingData.append('room_no', roomNo);
        bookingData.append('total_amount', totalAmount);
        bookingData.append('special_request', specialRequest);
        bookingData.append('booking_location', address);
        bookingData.append('booking_latitude', latitude);
        bookingData.append('booking_longitude', longitude);
        bookingData.append('booking_date', bookingDate);
        bookingData.append('booking_call', bookingCall);
        this.http
        .post<{success: string, message: string}>(
            API_URL + '/bookingAdd',
            bookingData
        )
        .subscribe(responseData => {
          this.cookieService.delete('booking_rate_id');
          this.cookieService.delete('booking_escortId');
          this.cookieService.delete('booking_userId');
          this.cookieService.delete('booking_price');
          this.cookieService.delete('booking_user_name');
          this.cookieService.delete('total_amount');

          if (responseData.success  == '1') {
            this.toastr.success(responseData.message);
            this.router.navigate(['/user/bookinghistory']);
          } else {
            this.toastr.error(responseData.message);
            this.router.navigate(['/user/bookinghistory']);
          }

        });
      }

}
