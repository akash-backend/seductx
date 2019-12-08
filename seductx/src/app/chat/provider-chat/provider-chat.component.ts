import { Component, OnInit } from '@angular/core';
import { ChatService } from 'src/app/service/chat.service';

import { AuthEscortService } from '../../service/auth-escort.service';
import { ActivatedRoute, ParamMap } from '@angular/router';

@Component({
  selector: 'app-provider-chat',
  templateUrl: './provider-chat.component.html',
  styleUrls: ['./provider-chat.component.css']
})
export class ProviderChatComponent implements OnInit {

  userFrom: string;
  userTo: string;
  messageText: string;
  messageArray: Array <{userFrom: string, userTo: string , message: string , sendForm: string}> = [];

  constructor(
    public chatService: ChatService,
    public authService: AuthEscortService,
    public route: ActivatedRoute
  ) {
    this.chatService.newMessageProviderReceived()
    .subscribe((data) => {
      console.log(data);
      this.messageArray.push(data);

      console.log(this.messageArray);
    });
  }

  ngOnInit() {
    this.userFrom = this.authService.getEscortId();

    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      if (paramMap.has('escortId')) {
        this.userTo = paramMap.get('escortId');
      }
    });
  }
    sendMessage() {
        this.messageArray.push({userFrom: this.userFrom, userTo: this.userTo, message: this.messageText, sendForm: 'provider'});
        this.chatService.sendMessage({userFrom: this.userFrom, userTo: this.userTo, message: this.messageText , type: 'toUser', sendForm: 'provider'});
    }





}
