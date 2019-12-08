import { Component, OnInit } from '@angular/core';
import { ChatService } from 'src/app/service/chat.service';
import { AuthService } from '../../service/auth.service';
import { ActivatedRoute, ParamMap } from '@angular/router';

@Component({
  selector: 'app-user-chat',
  templateUrl: './user-chat.component.html',
  styleUrls: ['./user-chat.component.css']
})
export class UserChatComponent implements OnInit {
  userFrom: string;
  userTo: string;
  messageText: string;
  messageArray: Array <{userFrom: string, userTo: string , message: string , sendForm: string}> = [];

  constructor(
    public chatService: ChatService,
    public authService: AuthService,
    public route: ActivatedRoute
  ) {
    this.chatService.newMessageUserReceived()
    .subscribe((data) => {
      console.log(data);
      this.messageArray.push(data);
    });
  }

  ngOnInit() {
    this.userFrom = this.authService.getUserId();

    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      if (paramMap.has('userId')) {
        this.userTo = paramMap.get('userId');
      }
    });
  }
    sendMessage() {
        this.messageArray.push({userFrom: this.userFrom, userTo: this.userTo, message: this.messageText, sendForm: 'user'});
        this.chatService.sendMessage({userFrom: this.userFrom, userTo: this.userTo, message: this.messageText , type: 'toProvider', sendForm: 'user'});
    }





}
