import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthEscortGuard } from '../auth/auth-escort.guard';
import { ProviderChatComponent } from './provider-chat/provider-chat.component';
import { UserChatComponent } from './user-chat/user-chat.component';


const routes: Routes = [
  {
    path: '',
    children: [
         {
            path: 'providerChat/:escortId',
            component: ProviderChatComponent,
         },
         {
          path: 'userChat/:userId',
          component: UserChatComponent,
         }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [AuthEscortGuard]
})
export class ChatRoutingModule { }
