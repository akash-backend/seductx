import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { PremiumClientsComponent } from './premium-clients/premium-clients.component';
import { BecomeEscortComponent } from './become-escort/become-escort.component';
import { ContactComponent } from './contact/contact.component';
import { LoginComponent } from './login/login.component';
import { EscortLoginComponent } from './escort-login/escort-login.component';
import { SignupComponent } from './signup/signup.component';
import { AuthGuard } from '../guards/auth.guard';
import { EscortSignupComponent } from './escort-signup/escort-signup.component';
import { EscortProfileComponent } from './escort-profile/escort-profile.component';
import { ForgotPasswordComponent } from './forgot-password/forgot-password.component';
import { EscortServicesComponent } from './escort-services/escort-services.component';
import { RatesComponent } from './rates/rates.component';
import { ImageUploadComponent } from './image-upload/image-upload.component';
import { AuthBothGuard } from '../auth/auth-both.guard';
import { ForgotEscortPasswordComponent } from './forgot-escort-password/forgot-escort-password.component';
import { OtpVerifyComponent } from './otp-verify/otp-verify.component';
import { UserPhoneComponent } from './user-phone/user-phone.component';
import { OtpVerifyEscortComponent } from './otp-verify-escort/otp-verify-escort.component';
import { EscortPhoneComponent } from './escort-phone/escort-phone.component';
import { TermsComponent } from './terms/terms.component';
import { PrivacyPolicyComponent } from './privacy-policy/privacy-policy.component';
import { AboutComponent } from './about/about.component';
import { FaqComponent } from './faq/faq.component';
import { AgentLoginComponent } from './agent-login/agent-login.component';
import { AgentSignupComponent } from './agent-signup/agent-signup.component';
import { OtpVerifyAgentComponent } from './otp-verify-agent/otp-verify-agent.component';
import { ForgotAgentPasswordComponent } from './forgot-agent-password/forgot-agent-password.component';


const routes: Routes = [
  {
    path: '',
    children: [
         {
            path: 'PremiumClients',
            component: PremiumClientsComponent,
            canActivate: [AuthBothGuard]
         },
         {
          path: 'becomeEscort',
          component: BecomeEscortComponent,
          canActivate: [AuthBothGuard]
         },
         {
          path: 'contact',
          component: ContactComponent,
          canActivate: [AuthBothGuard]
         },
         {
          path: 'login',
          component: LoginComponent,
          canActivate: [AuthBothGuard]
         },
         {
           path: 'escortLogin',
           component: EscortLoginComponent,
           canActivate: [AuthBothGuard]
         },
         {
           path: 'agentLogin',
           component: AgentLoginComponent,
           canActivate: [AuthBothGuard]
         },
         {
          path: 'signup',
          component: SignupComponent,
          canActivate: [AuthBothGuard]
         },
         {
          path: 'escortsignup',
          component: EscortSignupComponent,
          canActivate: [AuthBothGuard]
         },
         {
          path: 'agentsignup',
          component: AgentSignupComponent,
          canActivate: [AuthBothGuard]
         },
         {
          path: 'escortprofile/:escortId',
          component: EscortProfileComponent,
          canActivate: [AuthBothGuard]
         },
         {
          path: 'escortservice/:escortId',
          component: EscortServicesComponent,
          canActivate: [AuthBothGuard]
         },
         {
          path: 'forgotpassword',
          component: ForgotPasswordComponent,
          canActivate: [AuthBothGuard]
         },
         {
          path: 'forgotpasswordescort',
          component: ForgotEscortPasswordComponent,
          canActivate: [AuthBothGuard]
         },
         {
          path: 'forgotpasswordagent',
          component: ForgotAgentPasswordComponent,
          canActivate: [AuthBothGuard]
         },
         {
          path: 'forgotpasswordagent',
          component: ForgotEscortPasswordComponent,
          canActivate: [AuthBothGuard]
         },
         {
          path: 'escortrates/:escortId',
          component: RatesComponent,
          canActivate: [AuthBothGuard]
         },
         {
          path: 'escortimage/:escortId',
          component: ImageUploadComponent,
          canActivate: [AuthBothGuard]
         },
         {
          path: 'otpVerify/:userId',
          component: OtpVerifyComponent
         },
         {
          path: 'userPhone/:userId',
          component: UserPhoneComponent
         },
         {
          path: 'escortOtpVerify/:escortId',
          component: OtpVerifyEscortComponent
         },
         {
          path: 'agentOtpVerify/:agentId',
          component: OtpVerifyAgentComponent
         },
         {
          path: 'escortPhone/:escortId',
          component: EscortPhoneComponent
         },
         {
          path: 'terms',
          component: TermsComponent
         },
         {
          path: 'privacy',
          component: PrivacyPolicyComponent
         },
         {
          path: 'about',
          component: AboutComponent
         },
         {
          path: 'faq',
          component: FaqComponent
         }





    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
  providers: [AuthBothGuard]
})
export class HomeRoutingModule { }
