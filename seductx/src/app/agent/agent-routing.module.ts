import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthAgentGuard } from '../auth/auth-agent.guard';
import { AgentDashboardComponent } from './agent-dashboard/agent-dashboard.component';
import { EscortListComponent } from './escort-list/escort-list.component';
import { EscortProfileComponent } from './escort-profile/escort-profile.component';
import { CreateEscortComponent } from './create-escort/create-escort.component';
import { AcceptedComponent } from './booking/accepted/accepted.component';
import { StartedComponent } from './booking/started/started.component';
import { CompletedComponent } from './booking/completed/completed.component';
import { TermsComponent } from './policy/terms/terms.component';
import { PrivacyPolicyComponent } from './policy/privacy-policy/privacy-policy.component';
import { FaqComponent } from './policy/faq/faq.component';




const routes: Routes = [
  {
    path: '',
    children: [
         {
            path: 'agentdashboard',
            component: AgentDashboardComponent,
            canActivate: [AuthAgentGuard]
         },
         {
          path: 'agentEscortList',
          component: EscortListComponent,
          canActivate: [AuthAgentGuard]
         },
         {
          path: 'agentEscortProfile/:escortId',
          component: EscortProfileComponent,
          canActivate: [AuthAgentGuard]
         },
         {
          path: 'agentEscortCreate',
          component: CreateEscortComponent,
          canActivate: [AuthAgentGuard]
         },
         {
          path: 'escortAccepted/:escortId',
          component: AcceptedComponent,
          canActivate: [AuthAgentGuard]
         },
         {
          path: 'escortStarted/:escortId',
          component: StartedComponent,
          canActivate: [AuthAgentGuard]
         },
         {
          path: 'escortCompleted/:escortId',
          component: CompletedComponent,
          canActivate: [AuthAgentGuard]
         },
         {
          path: 'terms',
          component: TermsComponent,
          canActivate: [AuthAgentGuard]
         },
         {
          path: 'privacyPolicy',
          component: PrivacyPolicyComponent,
          canActivate: [AuthAgentGuard]
         },
         {
          path: 'faq',
          component: FaqComponent,
          canActivate: [AuthAgentGuard]
         }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [AuthAgentGuard]
})
export class AgentRoutingModule { }
