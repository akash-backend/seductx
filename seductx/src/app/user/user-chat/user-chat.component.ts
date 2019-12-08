import { Component, OnInit, ElementRef, ViewChild, AfterViewChecked } from '@angular/core';
import { ChatService } from 'src/app/service/chat.service';
import { AuthService } from '../../service/auth.service';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { EscortService } from '../../service/escort.service';




@Component({
  selector: 'app-user-chat',
  templateUrl: './user-chat.component.html',
  styleUrls: ['./user-chat.component.css']
})
export class UserChatComponent implements OnInit {

  @ViewChild('scrollMe', {static: true}) private myScrollContainer: ElementRef;

  userFrom: string;
  userTo: string;
  messageText: string;
  name: string;
  messageArray: Array <{userFrom: string, userTo: string , message: string , sendForm: string}> = [];

  constructor(
    public chatService: ChatService,
    public authService: AuthService,
    public escortService: EscortService,
    public route: ActivatedRoute
  ) {
    this.chatService.newMessageUserReceived()
    .subscribe((data) => {
      if ((data.userFrom == this.userFrom && data.userTo == this.userTo) || (data.userFrom == this.userTo && data.userTo == this.userFrom)) {
        this.messageArray.push(data);
      }
    });
  }

  ngOnInit() {
    this.scrollToBottom();
    this.userFrom = this.authService.getUserId();

    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      if (paramMap.has('userId')) {
        // escort id
        this.userTo = paramMap.get('userId');

        this.escortService.getProfileInfo(this.userTo).subscribe(profileData => {
          this.name = profileData.escortinfo.first_name + ' ' + profileData.escortinfo.last_name;
        })
      }

      this.chatService.getChat(this.userFrom, this.userTo)
      .subscribe(chatData => {

        if (chatData.cahatInfo) {
          console.log(chatData.cahatInfo);
          this.messageArray = chatData.cahatInfo;
        }

      });
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
        this.messageArray.push({userFrom: this.userFrom, userTo: this.userTo, message: this.messageText, sendForm: 'user'});
        this.chatService.sendMessage({
          userFrom: this.userFrom,
          userTo: this.userTo,
          message: this.messageText ,
          type: 'toProvider',
          sendForm: 'user'});
    }

    onKeydown(event) {
      if (event.key === 'Enter' && this.messageText) {
        this.messageArray.push({userFrom: this.userFrom, userTo: this.userTo, message: this.messageText, sendForm: 'user'});
        this.chatService.sendMessage({
          userFrom: this.userFrom,
          userTo: this.userTo,
          message: this.messageText ,
          type: 'toProvider',
          sendForm: 'user'});
      }
    }






}
