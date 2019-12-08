import { Injectable} from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Subject } from 'rxjs';
import { map } from 'rxjs/operators';
import { Router } from '@angular/router';

import {Booking} from '../model/booking.model';
import { environment } from '../../environments/environment';
const API_URL = environment.apiUrl + 'escort';

@Injectable({providedIn: 'root'})
export class RequestService {
    private requests: Booking[] = [];
    private requestsUpdated = new Subject<{ requests: Booking[]; requestCount: number }>();


    constructor(private http: HttpClient, private router: Router) {}

    getRequests(requestsPerPage: number, currentPage: number, requestStatus: string, escortId: string) {


      const requestSendData = new FormData();
      if (currentPage != 1) {
        requestSendData.append('start', requestsPerPage.toString());
      }
      requestSendData.append('limit_status', '1');
      requestSendData.append('request_status', requestStatus);
      requestSendData.append('escort_id', escortId);

      this.http
        .post<{ success: string, message: string, request_list: any; maxRequests: number }>(
          API_URL + '/bookingList', requestSendData
        )
      .pipe(map((requestData) => {
        return{
          requests: requestData.request_list.map(request => {
          return {
            booking_id: request.booking_id,
            user_id: request.user_id,
            escort_id: request.escort_id,
            hour: request.hour,
            shot: request.shot,
            price: request.price,
            user_name: request.user_name,
            user_email: request.user_email,
            special_request: request.special_request,
            hotel: request.hotel,
            room_no: request.room_no,
            booking_date: request.booking_date,
            booking_end_date: request.booking_end_date,
            booking_expiry_date: request.booking_expiry_date,
            booking_location: request.booking_location,
            booking_latitude: request.booking_latitude,
            booking_longitude: request.booking_longitude,
            total_amount: request.total_amount,
            request_status: request.request_status,
            created_at: request.created_at,
            hour_name: request.hour_name,
            hour_time: request.hour_time,
            shot_name: request.shot_name,
            user_first_name: request.user_first_name,
            user_last_name: request.user_last_name,
            user_country_code: request.user_country_code,
            user_phone_number: request.user_phone_number,
            escort_first_name: request.escort_first_name,
            escort_last_name: request.escort_last_name,
            escort_latitude: request.escort_latitude,
            escort_longitude: request.escort_longitude,
            escort_email: request.escort_email,
            escort_profile_image: request.escort_profile_image,
            escort_country_code: request.escort_country_code,
            escort_phone_number: request.escort_phone_number,
            services: request.services,
            escort_rating: request.escort_rating,
            user_rating: request.user_rating,
            booking_time_hour: request.booking_time_hour,
            time: request.time
          };
        }),
        maxRequests: requestData.maxRequests
      };
      })
      )
      .subscribe(transformedRequestData => {
        this.requests = transformedRequestData.requests;
        this.requestsUpdated.next({
          requests: [...this.requests],
          requestCount: transformedRequestData.maxRequests
        });
      });
    }

    getRequestsUpdateListener() {
        return this.requestsUpdated.asObservable();
      }

    bookingStatusManage(bookingId: string, escortId: string, userId: string, requestStatus: string) {
      const requestData = new FormData();
      requestData.append('booking_id', bookingId);
      requestData.append('escort_id', escortId);
      requestData.append('user_id', userId);
      requestData.append('request_status', requestStatus);

      return this.http.post(
        API_URL + '/accept_request/', requestData
      );
    }

      getRequest(id: string) {
        return this.http.get<{ _id: string; name: string; ressort: string }>(
          API_URL + '/request_detail/' + id
        );
      }


      getRequestCount(escortId: string) {
        const escortData = new FormData();
        escortData.append('escort_id', escortId);
        return this.http.post<{
          success: string;
          message: string;
          requestCount: string;
          acceptCount: string;
          ongoingCount: string;
          completedCount: string}>(
            API_URL + '/bookingCount/', escortData
        );
      }

}
