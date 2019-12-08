import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { AppComponent } from './app.component';
import { HomeDashboardComponent } from './home-dashboard/home-dashboard.component';
import { AuthGuard } from './guards/auth.guard';
import { AuthBothGuard } from './auth/auth-both.guard';


const routes: Routes = [
  { path: '', component: HomeDashboardComponent, canActivate: [AuthBothGuard]},
  { path: 'home',
    loadChildren: './home/home.module#HomeModule'
  },
  { path: 'escort',
    loadChildren: './escort/escort.module#EscortModule'
  },
  { path: 'user',
    loadChildren: './user/user.module#UserModule'
  },
  { path: 'chat',
    loadChildren: './chat/chat.module#ChatModule'
  },
  { path: 'agent',
    loadChildren: './agent/agent.module#AgentModule'
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { useHash: true })],
  exports: [RouterModule],
  providers: [AuthBothGuard]
})
export class AppRoutingModule {}
