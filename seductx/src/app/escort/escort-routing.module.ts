import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RequestComponent } from './request/request.component';
import { ProfileComponent } from './profile/profile.component';
import { BookingComponent } from './booking/booking.component';
import { PremiumEscortComponent } from './premium-escort/premium-escort.component';
import { AuthEscortGuard } from '../auth/auth-escort.guard';
import { ProviderChatComponent } from './provider-chat/provider-chat.component';
import { OngoingComponent } from './ongoing/ongoing.component';
import { CompletedComponent } from './completed/completed.component';
import { EditProfileComponent } from './edit/edit-profile/edit-profile.component';
import { EditServiceComponent } from './edit/edit-service/edit-service.component';
import { EditRatesComponent } from './edit/edit-rates/edit-rates.component';
import { EditImagesComponent } from './edit/edit-images/edit-images.component';
import { Subscription } from 'rxjs';
import { SubscriptionPlanComponent } from './subscription-plan/subscription-plan.component';
import { SupportComponent } from './support/support.component';
import { SuccessComponent } from './success/success.component';
import { TermsComponent } from './terms/terms.component';
import { PrivacyPolicyComponent } from './privacy-policy/privacy-policy.component';
import { FaqComponent } from './faq/faq.component';


const routes: Routes = [
  {
    path: '',
    children: [
         {
            path: 'request',
            component: RequestComponent,
            canActivate: [AuthEscortGuard]
         },
         {
          path: 'profile',
          component: ProfileComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'booking',
          component: BookingComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'ongoing',
          component: OngoingComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'completed',
          component: CompletedComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'premiumescort',
          component: PremiumEscortComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'providerChat/:escortId',
          component: ProviderChatComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'editProfile/:escortId',
          component: EditProfileComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'editService/:escortId',
          component: EditServiceComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'editRates/:escortId',
          component: EditRatesComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'editImages/:escortId',
          component: EditImagesComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'subscriptionPlan',
          component: SubscriptionPlanComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'support',
          component: SupportComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'success',
          component: SuccessComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'terms',
          component: TermsComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'privacy',
          component: PrivacyPolicyComponent,
          canActivate: [AuthEscortGuard]
         },
         {
          path: 'faq',
          component: FaqComponent,
          canActivate: [AuthEscortGuard]
         }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [AuthEscortGuard]
})
export class EscortRoutingModule { }
