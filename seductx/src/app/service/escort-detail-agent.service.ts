import { Injectable} from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Subject } from 'rxjs';
import { map } from 'rxjs/operators';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';

import {EscortAgent} from '../model/escort-agent.model';
import { environment } from '../../environments/environment';
const API_URL = environment.apiUrl + 'agent';

@Injectable({providedIn: 'root'})
export class EscortsDetailAgentService {
    private escorts: EscortAgent[] = [];
    private escortsUpdated = new Subject<{ escorts: EscortAgent[]; escortCount: number }>();

    constructor(private http: HttpClient, private router: Router,  private cookieService: CookieService) {}

    getEscorts(escortsPerPage: number, currentPage: number, agentId: string) {

      const escortSendData = new FormData();
      if (currentPage != 1) {
        escortSendData.append('start', escortsPerPage.toString());
      }

      escortSendData.append('limit_status', '1');
      escortSendData.append('agent_id', agentId);

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
            avg_rating: escort.avg_rating
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

    getEscortsUpdateListener() {
        return this.escortsUpdated.asObservable();
      }

      getEscort(id: string) {
        return this.http.get<{ _id: string; name: string; ressort: string }>(
          API_URL + '/escort_detail/' + id
        );
      }

}
