import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ChatRoutingModule } from './chat-routing.module';


import { MatProgressSpinnerModule} from '@angular/material';

import { SharedModule } from '../shared/shared.module';
import {ModalModule} from 'ngx-bootstrap/modal';
import { ProviderChatComponent } from './provider-chat/provider-chat.component';
import { UserChatComponent } from './user-chat/user-chat.component';







@NgModule({
  imports: [
    CommonModule,
    ChatRoutingModule,
    ReactiveFormsModule,
    FormsModule,
    MatProgressSpinnerModule,
    SharedModule,
    ModalModule.forRoot()
  ],
  declarations: [ProviderChatComponent, UserChatComponent],
  providers: [],
  exports: [],
})


export class ChatModule { }
