import { Injectable } from '@angular/core';
import { AngularFireDatabase } from '@angular/fire/database';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFireMessaging } from '@angular/fire/messaging';
import { mergeMapTo } from 'rxjs/operators';
import { take } from 'rxjs/operators';
import { BehaviorSubject } from 'rxjs';
import { AuthEscortService} from './auth-escort.service';
import { ToastrService } from 'ngx-toastr';
import { EscortService} from './escort.service';
import { Router } from '@angular/router';

@Injectable({ providedIn: 'root'})
export class MessagingService {

  currentMessage = new BehaviorSubject(null);

  constructor(
    private angularFireDB: AngularFireDatabase,
    private angularFireAuth: AngularFireAuth,
    public authService: AuthEscortService,
    private toastr: ToastrService,
    public escortService: EscortService,
    private router: Router,
    private angularFireMessaging: AngularFireMessaging) {
    this.angularFireMessaging.messaging.subscribe(
      (_messaging) => {
        _messaging.onMessage = _messaging.onMessage.bind(_messaging);
        _messaging.onTokenRefresh = _messaging.onTokenRefresh.bind(_messaging);
      }
    )
  }

  /**
   * update token in firebase database
   *
   * @param userId userId as a key
   * @param token token as a value
   */
  updateToken(userId, token) {
     // we can change this function to request our backend service
    this.angularFireAuth.authState.pipe(take(1)).subscribe(
      () => {
        const data = {};
        data[userId] = token
        this.angularFireDB.object('fcmTokens/').update(data)
      })
  }

  /**
   * request permission for notification from firebase cloud messaging
   *
   * @param userId userId
   */
  requestPermission(email: string, password: string) {
    console.log('dsfsdhfsdfsdfsdf');
    this.angularFireMessaging.requestToken.subscribe(
      (token) => {
        console.log('tokentokentokentokentokentoken');
        this.escortService.getProfileInfoByEmail(email)
        .subscribe(escortData => {
          if (escortData.success  == '1') {
            this.updateToken('escort00' + escortData.escortInfo.escort_id, token);
            console.log(token);
            this.authService.login(email, password, token);

          } else {
            this.toastr.error(escortData.message);
            this.router.navigate(['/']);
          }

        });
      },
      (err) => {
        this.authService.login(email, password, '');
      }
    );
  }

  /**
   * hook method when new notification received in foreground
   */
  receiveMessage() {
    this.angularFireMessaging.messages.subscribe(
      (payload) => {
        console.log('new message received. ', payload);
        this.currentMessage.next(payload);
      })
  }
}
