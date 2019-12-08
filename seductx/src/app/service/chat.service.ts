import { Injectable} from '@angular/core';
import * as io from 'socket.io-client';
import {Observable} from 'rxjs';
import { AuthService } from './auth.service';
import { AuthEscortService } from './auth-escort.service';
import { environment } from '../../environments/environment';
import { HttpClient } from '@angular/common/http';

const API_URL = environment.apiUrl + 'chat';

@Injectable({ providedIn: 'root'})
export class ChatService {
    user: string;
    provider: string;
    private socket = io('https://www.seductx.com:5000');

    constructor(
      private http: HttpClient,
      public authService: AuthService,
      public authEscortService: AuthEscortService,
    ) {
      this.user = this.authService.getUserId();
      this.provider = this.authEscortService.getEscortId();
    }

    escortOnline(data) {
        console.log("escortOnline");
        this.socket.emit('IamOnline', data);
    }



    escortOffline(data) {
      console.log("IamOffline");
        this.socket.emit('IamOffline', data);
    }

    ///////////////////////////

    sendMessage(data)
    {
      console.log(data);
        this.socket.emit('message',data);
    }

    newMessageProviderReceived() {
        let observable = new Observable<{userFrom: string, userTo: string , message: string , sendForm: string}>(observer => {
        console.log('new messagetoProvider' + this.provider);
            this.socket.on('new messagetoProvider' + this.provider, (data)=>{
                observer.next(data);
            });
            return () => {this.socket.disconnect();}
        });

        return observable;
    }


    newMessageUserReceived() {
      let observable = new Observable<{userFrom: string, userTo: string , message: string , sendForm: string}>(observer => {
      console.log('new messagetoUser' + this.user);
          this.socket.on('new messagetoUser' + this.user, (data)=>{
              observer.next(data);
          });
          return () => {this.socket.disconnect();}
      });

      return observable;
  }


  getChat(id: string, uid: string) {
    const chatData = new FormData();
    chatData.append('id', id);
    chatData.append('uid', uid);
    return this.http
    .post<{ success: string, message: string, cahatInfo: any;}>(
      API_URL + '/chatHistory', chatData
    );
  }



}
