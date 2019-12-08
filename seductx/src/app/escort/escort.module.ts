import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { EscortRoutingModule } from './escort-routing.module';

import { FooterComponent } from './layout/footer/footer.component';
import { NavigationComponent } from './layout/navigation/navigation.component';

import { MatProgressSpinnerModule, MatPaginatorModule} from '@angular/material';

import { SharedModule } from '../shared/shared.module';
import { RequestComponent } from './request/request.component';
import { ProfileComponent } from './profile/profile.component';
import { BookingComponent } from './booking/booking.component';
import { PremiumEscortComponent } from './premium-escort/premium-escort.component';
import {ModalModule} from 'ngx-bootstrap/modal';
import { ProviderChatComponent } from './provider-chat/provider-chat.component';
import { OngoingComponent } from './ongoing/ongoing.component';
import { CompletedComponent } from './completed/completed.component';
import { EditProfileComponent } from './edit/edit-profile/edit-profile.component';
import { EditServiceComponent } from './edit/edit-service/edit-service.component';
import { EditRatesComponent } from './edit/edit-rates/edit-rates.component';
import { EditImagesComponent } from './edit/edit-images/edit-images.component';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import { SubscriptionComponent } from './subscription/subscription.component';
import { SubscriptionPlanComponent } from './subscription-plan/subscription-plan.component';
import { SupportComponent } from './support/support.component';
import { SuccessComponent } from './success/success.component';
import { TermsComponent } from './terms/terms.component';
import { PrivacyPolicyComponent } from './privacy-policy/privacy-policy.component';
import { FaqComponent } from './faq/faq.component';





@NgModule({
  imports: [
    CommonModule,
    EscortRoutingModule,
    ReactiveFormsModule,
    FormsModule,
    MatProgressSpinnerModule,
    MatPaginatorModule,
    SharedModule,
    ModalModule.forRoot(),
    NgbModule
  ],
  declarations: [
    FooterComponent,
    NavigationComponent,
    RequestComponent,
    ProfileComponent,
    BookingComponent,
    PremiumEscortComponent,
    ProviderChatComponent,
    OngoingComponent,
    CompletedComponent,
    EditProfileComponent,
    EditServiceComponent,
    EditRatesComponent,
    EditImagesComponent,
    SubscriptionComponent,
    SubscriptionPlanComponent,
    SupportComponent,
    SuccessComponent,
    TermsComponent,
    PrivacyPolicyComponent,
    FaqComponent
  ],
  providers: [],
  exports: [NavigationComponent],
})


export class EscortModule { }
