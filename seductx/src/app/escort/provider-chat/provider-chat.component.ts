import { Component, OnInit, ElementRef, ViewChild, AfterViewChecked } from '@angular/core';
import { ChatService } from 'src/app/service/chat.service';

import { AuthEscortService } from '../../service/auth-escort.service';
import { UserService } from '../../service/user.service';

import { ActivatedRoute, ParamMap } from '@angular/router';

@Component({
  selector: 'app-provider-chat',
  templateUrl: './provider-chat.component.html',
  styleUrls: ['./provider-chat.component.css']
})
export class ProviderChatComponent implements OnInit, AfterViewChecked {

  @ViewChild('scrollMe', {static: true}) private myScrollContainer: ElementRef;

  userFrom: string;
  userTo: string;
  messageText: string;
  name: string;
  messageArray: Array <{userFrom: string, userTo: string , message: string , sendForm: string}> = [];

  constructor(
    public chatService: ChatService,
    public authService: AuthEscortService,
    public userService: UserService,
    public route: ActivatedRoute
  ) {
    this.chatService.newMessageProviderReceived()
    .subscribe((data) => {
      console.log(data);

      if ((data.userFrom == this.userFrom && data.userTo == this.userTo) || (data.userFrom == this.userTo && data.userTo == this.userFrom)) {
        this.messageArray.push(data);
      }

    });
  }

  ngOnInit() {
    this.scrollToBottom();
    this.userFrom = this.authService.getEscortId();


    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      if (paramMap.has('escortId')) {
        this.userTo = paramMap.get('escortId');

        this.userService.getProfileInfo(this.userTo).subscribe(profileData => {
          this.name = profileData.userinfo.first_name + ' ' + profileData.userinfo.last_name;
        })
      }
    });

    this.chatService.getChat(this.userFrom, this.userTo)
      .subscribe(chatData => {
        console.log(chatData.cahatInfo);
        if (chatData.cahatInfo) {
          console.log(chatData.cahatInfo);
          this.messageArray = chatData.cahatInfo;
        }
      });
  }

  ngAfterViewChecked() {
     this.scrollToBottom();
  }


  scrollToBottom(): void {
    try {
        this.myScrollContainer.nativeElement.scrollTop = this.myScrollContainer.nativeElement.scrollHeight;
    } catch(err) { }
  }

    sendMessage() {
        this.messageArray.push({userFrom: this.userFrom, userTo: this.userTo, message: this.messageText, sendForm: 'provider'});
        this.chatService.sendMessage({
          userFrom: this.userFrom,
          userTo: this.userTo,
          message: this.messageText,
          type: 'toUser',
          sendForm: 'provider'});
    }

    onKeydown(event) {
      if (event.key === 'Enter' && this.messageText) {
        this.messageArray.push({userFrom: this.userFrom, userTo: this.userTo, message: this.messageText, sendForm: 'provider'});
        this.chatService.sendMessage({
          userFrom: this.userFrom,
          userTo: this.userTo,
          message: this.messageText,
          type: 'toUser',
          sendForm: 'provider'});
      }
    }

}
