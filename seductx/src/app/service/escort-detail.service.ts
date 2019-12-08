import { Injectable} from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Subject } from 'rxjs';
import { map } from 'rxjs/operators';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';

import {Escort} from '../model/escort.model';
import { environment } from '../../environments/environment';
const API_URL = environment.apiUrl + 'user';

@Injectable({providedIn: 'root'})
export class EscortsDetailService {
    private escorts: Escort[] = [];
    private escortsUpdated = new Subject<{ escorts: Escort[]; escortCount: number }>();

    constructor(private http: HttpClient, private router: Router,  private cookieService: CookieService) {}

    getEscorts(escortsPerPage: number, currentPage: number, onlineStatus: string, userId: string, favouriteStatus: string) {


      const escortSendData = new FormData();
      if (currentPage != 1) {
        escortSendData.append('start', escortsPerPage.toString());
      }

      if(favouriteStatus === '1') {
        escortSendData.append('favourite_status', favouriteStatus);
      }

      if (onlineStatus === '1' || onlineStatus === '2') {
        escortSendData.append('online_status', onlineStatus);
      }

      escortSendData.append('start_age', this.cookieService.get('filter_start_age'));
      escortSendData.append('end_age', this.cookieService.get('filter_end_age'));
      escortSendData.append('start_height', this.cookieService.get('filter_start_height'));
      escortSendData.append('end_height', this.cookieService.get('filter_end_height'));
      escortSendData.append('cup_size', this.cookieService.get('filter_cup_size'));
      escortSendData.append('body_type', this.cookieService.get('filter_body_type'));
      escortSendData.append('gender', this.cookieService.get('filter_gender'));
      escortSendData.append('city', this.cookieService.get('filter_city'));
      escortSendData.append('searchTime', this.cookieService.get('filter_time'));
      escortSendData.append('searchService', this.cookieService.get('filter_service'));
      escortSendData.append('hour', this.cookieService.get('filter_hour'));
      escortSendData.append('sort_filter', this.cookieService.get('sortType'));
      escortSendData.append('agent_filter', this.cookieService.get('filter_agent'));
      escortSendData.append('latitude', '22.723412');
      escortSendData.append('longitude', '75.83011399999998');
      escortSendData.append('limit_status', '1');
      escortSendData.append('user_id', userId);
      this.http
        .post<{ success: string, message: string, escort_list: any; maxEscorts: number }>(
          API_URL + '/escort_list', escortSendData
        )
      .pipe(map((escortData) => {
        return{
          escorts: escortData.escort_list.map(escort => {
          return {
            escort_id: escort.escort_id,
            first_name: escort.first_name,
            last_name: escort.last_name,
            email: escort.email,
            profile_image: escort.profile_image,
            image1: escort.image1,
            image2: escort.image2,
            image3: escort.image3,
            image4: escort.image4,
            image5: escort.image5,
            image6: escort.image6,
            reset_code: escort.reset_code,
            country_code: escort.country_code,
            phone_number: escort.phone_number,
            age: escort.age,
            height: escort.height,
            status: escort.status,
            progress_status: escort.progress_status,
            latitude: escort.latitude,
            longitude: escort.escort_id,
            country_id: escort.country_id,
            country_name: escort.country_name,
            body_type_id: escort.body_type_id,
            body_type_name: escort.body_type_name,
            city_id: escort.city_id,
            city_name: escort.city_name,
            gender_id: escort.gender_id,
            gender: escort.gender,
            bust_size_id: escort.bust_size_id,
            bust_size: escort.bust_size,
            cup_size_id: escort.cup_size_id,
            cup_size: escort.cup_size,
            waise_size_id: escort.waise_size_id,
            waise_size: escort.waise_size,
            hip_size_id: escort.hip_size_id,
            hip_size: escort.hip_size,
            english_id: escort.english_id,
            english_type: escort.english_type,
            chinese_id: escort.chinese_id,
            chinese_type: escort.chinese_type,
            japanese_id: escort.hip_size,
            japanese_type: escort.english_id,
            korean_id: escort.english_type,
            korean_type: escort.chinese_id,
            distance: escort.distance,
            online_status: escort.online_status,
            favouriteStatus: escort.favouriteStatus,
            avg_rating: escort.avg_rating,
            followStatus: escort.followStatus,
            agency: escort.agency,
            request_status: escort.request_status,
            hour_time: escort.request_status,
            amount: escort.amount
          };
        }),
        maxEscorts: escortData.maxEscorts
      };
      })
      )
      .subscribe(transformedEscortData => {
        this.escorts = transformedEscortData.escorts;
        this.escortsUpdated.next({
          escorts: [...this.escorts],
          escortCount: transformedEscortData.maxEscorts
        });
      });
    }

    addFavourite(userId: string, escortId: string, status: string) {
      const profileData = new FormData();
      profileData.append('user_id', userId);
      profileData.append('escort_id', escortId);
      profileData.append('status', status);
      return this.http.post<{ success: string; message: string}>(
          API_URL + '/addFavourite/', profileData
      );
    }


    addFollow(userId: string, escortId: string, status: string) {
      const followData = new FormData();
      followData.append('user_id', userId);
      followData.append('escort_id', escortId);
      followData.append('status', status);
      return this.http.post<{ success: string; message: string}>(
          API_URL + '/follow_escort/', followData
      );
    }

    getEscortsUpdateListener() {
        return this.escortsUpdated.asObservable();
      }

      getEscort(id: string) {
        return this.http.get<{ _id: string; name: string; ressort: string }>(
          API_URL + '/escort_detail/' + id
        );
      }

}
