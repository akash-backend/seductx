import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { UserRoutingModule } from './user-routing.module';

import { FooterComponent } from './layout/footer/footer.component';
import { NavigationComponent } from './layout/navigation/navigation.component';

import { MatProgressSpinnerModule, MatPaginatorModule} from '@angular/material';
import {NgxMaterialTimepickerModule} from 'ngx-material-timepicker';

import { SharedModule } from '../shared/shared.module';
import { ProfileComponent } from './profile/profile.component';
import { ChangePwdComponent } from './change-pwd/change-pwd.component';
import { BookingHistoryComponent } from './booking-history/booking-history.component';
import { SidebarComponent } from './layout/sidebar/sidebar.component';
import { CountryComponent } from './filter/country/country.component';
import { CityComponent } from './filter/city/city.component';
import { GenderComponent } from './filter/gender/gender.component';
import { CallComponent } from './filter/call/call.component';
import { TimeComponent } from './filter/time/time.component';
import { OnlineComponent } from './search/online/online.component';
import { OfflineComponent } from './search/offline/offline.component';
import { FavouritesComponent } from './search/favourites/favourites.component';
import { SearchComponent } from './filter/search/search.component';
import { HourComponent } from './filter/hour/hour.component';
import { SearchHeaderComponent } from './search/search-header/search-header.component';
import { UserChatComponent } from './user-chat/user-chat.component';
import { EscortProfileComponent } from './escort-profile/escort-profile.component';
import { ConfirmBookingComponent } from './confirm-booking/confirm-booking.component';
import { AgmCoreModule } from '@agm/core';
import {ModalModule} from 'ngx-bootstrap/modal';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import { SubscriptionPlanUserComponent } from './subscription-plan-user/subscription-plan-user.component';
import { SuccessComponent } from './success/success.component';
import { JwSocialButtonsModule } from 'jw-angular-social-buttons';
import { FbLikeComponent } from './social_media/fb-like/fb-like.component';
import { TweetComponent } from './social_media/tweet/tweet.component';
import { PinItComponent } from './social_media/pin-it/pin-it.component';
import { GooglePlusComponent } from './social_media/google-plus/google-plus.component';
import { LinkedinComponent } from './social_media/linkedin/linkedin.component';
import { MobileNumberComponent } from './mobile-number/mobile-number.component';
import { OtpVerifyComponent } from './otp-verify/otp-verify.component';
import { FaqComponent } from './faq/faq.component';
import { PrivacyPolicyComponent } from './privacy-policy/privacy-policy.component';
import { TermsComponent } from './terms/terms.component';








@NgModule({
  imports: [
    CommonModule,
    UserRoutingModule,
    ReactiveFormsModule,
    FormsModule,
    MatProgressSpinnerModule,
    MatPaginatorModule,
    SharedModule,
    NgxMaterialTimepickerModule,
    JwSocialButtonsModule,
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyBz_5wUAu5_IYnw4RnwiK50qT1GUQiy1DE',
      libraries: ['places', 'geometry']
    }),
    NgbModule,
    ModalModule.forRoot()
  ],
  declarations: [
    FooterComponent,
    NavigationComponent,
    ProfileComponent,
    ChangePwdComponent,
    BookingHistoryComponent,
    SidebarComponent,
    CountryComponent,
    CityComponent,
    GenderComponent,
    CallComponent,
    TimeComponent,
    OnlineComponent,
    OfflineComponent,
    FavouritesComponent,
    SearchComponent,
    HourComponent,
    SearchHeaderComponent,
    UserChatComponent,
    EscortProfileComponent,
    ConfirmBookingComponent,
    SubscriptionPlanUserComponent,
    SuccessComponent,
    FbLikeComponent,
    TweetComponent,
    PinItComponent,
    GooglePlusComponent,
    LinkedinComponent,
    MobileNumberComponent,
    OtpVerifyComponent,
    FaqComponent,
    PrivacyPolicyComponent,
    TermsComponent],
  providers: [],
  exports: [NavigationComponent],
})


export class UserModule { }
