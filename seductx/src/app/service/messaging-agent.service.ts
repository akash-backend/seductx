import { Injectable } from '@angular/core';
import { AngularFireDatabase } from '@angular/fire/database';
import { AngularFireAuth } from '@angular/fire/auth';
import { AngularFireMessaging } from '@angular/fire/messaging';
import { mergeMapTo } from 'rxjs/operators';
import { take } from 'rxjs/operators';
import { BehaviorSubject } from 'rxjs';
import { AuthAgentService} from './auth-agent.service';
import { ToastrService } from 'ngx-toastr';
import { AgentService} from './agent.service';
import { Router } from '@angular/router';

@Injectable({ providedIn: 'root'})
export class MessagingAgentService {

  currentMessage = new BehaviorSubject(null);

  constructor(
    private angularFireDB: AngularFireDatabase,
    private angularFireAuth: AngularFireAuth,
    public authService: AuthAgentService,
    private toastr: ToastrService,
    public agentService: AgentService,
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
        this.agentService.getProfileInfoByEmail(email)
        .subscribe(agentData => {
          if (agentData.success  == '1') {
            this.updateToken('agent00' + agentData.agentInfo.agent_id, token);
            console.log(token);
            this.authService.login(email, password, token);

          } else {
            this.toastr.error(agentData.message);
            this.router.navigate(['/home/agentLogin']);
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
