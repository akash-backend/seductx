import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AgentRoutingModule } from './agent-routing.module';

import { MatProgressSpinnerModule, MatPaginatorModule} from '@angular/material';
import {NgxMaterialTimepickerModule} from 'ngx-material-timepicker';

import { SharedModule } from '../shared/shared.module';
import { AgmCoreModule } from '@agm/core';
import {ModalModule} from 'ngx-bootstrap/modal';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import { JwSocialButtonsModule } from 'jw-angular-social-buttons';
import { AgentDashboardComponent } from './agent-dashboard/agent-dashboard.component';
import { FooterComponent } from './layout/footer/footer.component';
import { NavigationComponent } from './layout/navigation/navigation.component';
import { EscortListComponent } from './escort-list/escort-list.component';
import { EscortProfileComponent } from './escort-profile/escort-profile.component';
import { CreateEscortComponent } from './create-escort/create-escort.component';
import { AcceptedComponent } from './booking/accepted/accepted.component';
import { StartedComponent } from './booking/started/started.component';
import { CompletedComponent } from './booking/completed/completed.component';
import { PrivacyPolicyComponent } from './policy/privacy-policy/privacy-policy.component';
import { FaqComponent } from './policy/faq/faq.component';
import { TermsComponent } from './policy/terms/terms.component';
import { SubscriptionPlanComponent } from './subscription-plan/subscription-plan.component';









@NgModule({
  imports: [
    CommonModule,
    ReactiveFormsModule,
    FormsModule,
    MatProgressSpinnerModule,
    MatPaginatorModule,
    SharedModule,
    NgxMaterialTimepickerModule,
    JwSocialButtonsModule,
    AgentRoutingModule,
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyBz_5wUAu5_IYnw4RnwiK50qT1GUQiy1DE',
      libraries: ['places', 'geometry']
    }),
    NgbModule,
    ModalModule.forRoot()
  ],
  declarations: [
    AgentDashboardComponent,
    FooterComponent,
    NavigationComponent,
    EscortListComponent,
    EscortProfileComponent,
    CreateEscortComponent,
    AcceptedComponent,
    StartedComponent,
    CompletedComponent,
    PrivacyPolicyComponent,
    FaqComponent,
    TermsComponent,
    SubscriptionPlanComponent],
  providers: [],
  exports: [],
})


export class AgentModule { }
