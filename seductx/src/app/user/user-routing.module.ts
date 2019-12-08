import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ProfileComponent } from '../user/profile/profile.component';
import { BookingHistoryComponent } from './booking-history/booking-history.component';
import { ChangePwdComponent } from './change-pwd/change-pwd.component';
import { CountryComponent } from './filter/country/country.component';
import { CityComponent } from './filter/city/city.component';
import { GenderComponent } from './filter/gender/gender.component';
import { TimeComponent } from './filter/time/time.component';
import { CallComponent } from './filter/call/call.component';
import { OnlineComponent } from './search/online/online.component';
import { OfflineComponent } from './search/offline/offline.component';
import { FavouritesComponent } from './search/favourites/favourites.component';
import { AuthUserGuard } from '../auth/auth-user.guard';
import { SearchComponent } from './filter/search/search.component';
import { HourComponent } from './filter/hour/hour.component';
import { UserChatComponent } from './user-chat/user-chat.component';
import { EscortProfileComponent } from './escort-profile/escort-profile.component';
import { ConfirmBookingComponent } from './confirm-booking/confirm-booking.component';
import { SubscriptionPlanUserComponent } from './subscription-plan-user/subscription-plan-user.component';
import { SuccessComponent } from './success/success.component';
import { TermsComponent } from './terms/terms.component';
import { PrivacyPolicyComponent } from './privacy-policy/privacy-policy.component';
import { FaqComponent } from './faq/faq.component';




const routes: Routes = [
  {
    path: '',
    children: [
         {
            path: 'profile',
            component: ProfileComponent,
            canActivate: [AuthUserGuard]
         },
         {
           path: 'bookinghistory',
           component: BookingHistoryComponent,
           canActivate: [AuthUserGuard]
         },
         {
            path: 'changepassword',
            component: ChangePwdComponent,
            canActivate: [AuthUserGuard]
         },
         {
          path: 'changepassword',
          component: ChangePwdComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'filtercountry',
          component: CountryComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'filtercity',
          component: CityComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'filtergender',
          component: GenderComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'filtertime',
          component: TimeComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'filtercall',
          component: CallComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'filterhour',
          component: HourComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'searchonline',
          component: OnlineComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'searchoffline',
          component: OfflineComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'searchfavourite',
          component: FavouritesComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'filtersearch',
          component: SearchComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'userChat/:userId',
          component: UserChatComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'escortProfile/:escortId',
          component: EscortProfileComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'confirmBooking',
          component: ConfirmBookingComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'subscriptionPlan',
          component: SubscriptionPlanUserComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'success',
          component: SuccessComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'terms',
          component: TermsComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'privacy',
          component: PrivacyPolicyComponent,
          canActivate: [AuthUserGuard]
         },
         {
          path: 'faq',
          component: FaqComponent,
          canActivate: [AuthUserGuard]
         }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [AuthUserGuard]
})
export class UserRoutingModule { }
