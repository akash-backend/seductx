import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HomeRoutingModule } from './home-routing.module';
import { PremiumClientsComponent } from './premium-clients/premium-clients.component';
import { HeaderComponent } from './layout/header/header.component';
import { FooterComponent } from './layout/footer/footer.component';
import { NavigationComponent } from './layout/navigation/navigation.component';
import { BecomeEscortComponent } from './become-escort/become-escort.component';
import { ContactComponent } from './contact/contact.component';
import { LoginComponent } from './login/login.component';
import { EscortLoginComponent } from './escort-login/escort-login.component';
import { SignupComponent } from './signup/signup.component';
import { EscortSignupComponent } from './escort-signup/escort-signup.component';
import { EscortProfileComponent } from './escort-profile/escort-profile.component';
import { EscortRateComponent } from './escort-rate/escort-rate.component';
import { EscortPhotosComponent } from './escort-photos/escort-photos.component';

import { ForgotPasswordComponent } from './forgot-password/forgot-password.component';
import { MatProgressSpinnerModule} from '@angular/material';

import { SharedModule } from '../shared/shared.module';
import { EscortServicesComponent } from './escort-services/escort-services.component';
import { RatesComponent } from './rates/rates.component';
import { ImageUploadComponent } from './image-upload/image-upload.component';
import { ForgotEscortPasswordComponent } from './forgot-escort-password/forgot-escort-password.component';
import { AgmCoreModule } from '@agm/core';

// firebase
import { AngularFireMessagingModule } from '@angular/fire/messaging';
import { AngularFireDatabaseModule } from '@angular/fire/database';
import { AngularFireAuthModule } from '@angular/fire/auth';
import { AngularFireModule } from '@angular/fire';
import { environment } from '../../environments/environment';
import { MessagingService } from '../service/messaging.service';
import { MessagingUserService } from '../service/messaging-user.service';
import { MessagingAgentService } from '../service/messaging-agent.service';
import { OtpVerifyComponent } from './otp-verify/otp-verify.component';
import { UserPhoneComponent } from './user-phone/user-phone.component';
import { OtpVerifyEscortComponent } from './otp-verify-escort/otp-verify-escort.component';
import { EscortPhoneComponent } from './escort-phone/escort-phone.component';
import { PrivacyPolicyComponent } from './privacy-policy/privacy-policy.component';
import { AboutComponent } from './about/about.component';
import { TermsComponent } from './terms/terms.component';
import { FaqComponent } from './faq/faq.component';
import { AgentLoginComponent } from './agent-login/agent-login.component';
import { AgentSignupComponent } from './agent-signup/agent-signup.component';
import { OtpVerifyAgentComponent } from './otp-verify-agent/otp-verify-agent.component';
import { ForgotAgentPasswordComponent } from './forgot-agent-password/forgot-agent-password.component';





@NgModule({
  imports: [
    CommonModule,
    HomeRoutingModule,
    ReactiveFormsModule,
    FormsModule,
    MatProgressSpinnerModule,
    SharedModule,
    AgmCoreModule.forRoot({
      apiKey: 'AIzaSyBz_5wUAu5_IYnw4RnwiK50qT1GUQiy1DE',
      libraries: ['places', 'geometry']
    }),
    AngularFireDatabaseModule,
    AngularFireAuthModule,
    AngularFireMessagingModule,
    AngularFireModule.initializeApp(environment.firebase)
  ],
  declarations: [
    PremiumClientsComponent,
    HeaderComponent,
    FooterComponent,
    NavigationComponent,
    BecomeEscortComponent,
    ContactComponent,
    LoginComponent,
    EscortLoginComponent,
    SignupComponent,
    EscortSignupComponent,
    EscortProfileComponent ,
    EscortRateComponent,
    EscortPhotosComponent,
    ForgotPasswordComponent,
    EscortServicesComponent,
    RatesComponent,
    ImageUploadComponent,
    ForgotEscortPasswordComponent,
    OtpVerifyComponent,
    UserPhoneComponent,
    OtpVerifyEscortComponent,
    EscortPhoneComponent,
    PrivacyPolicyComponent,
    AboutComponent,
    TermsComponent,
    FaqComponent,
    AgentLoginComponent,
    AgentSignupComponent,
    OtpVerifyAgentComponent,
    ForgotAgentPasswordComponent
  ],
  providers: [MessagingService, MessagingUserService, MessagingAgentService],
  exports: [NavigationComponent],
})


export class HomeModule { }
