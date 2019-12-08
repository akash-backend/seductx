import { Component, OnInit , OnDestroy} from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AuthAgentService} from '../../service/auth-agent.service';
import { Subscription } from 'rxjs';
import { MessagingAgentService } from '../../service/messaging-agent.service';
import { CookieService } from 'ngx-cookie-service';



@Component({
  selector: 'app-agent-login',
  templateUrl: './agent-login.component.html',
  styleUrls: ['./agent-login.component.css']
})
export class AgentLoginComponent implements OnInit,OnDestroy {

  isLoading = false;
  authStausSub: Subscription;
  checkStatus: boolean;
  form: FormGroup;
  message;
  constructor(
    public authService: AuthAgentService,
    private cookieService: CookieService,
    private messagingService: MessagingAgentService) { }

  ngOnInit() {
    this.form = new FormGroup({
      email: new FormControl(null, { validators: [Validators.required] }),
      password: new FormControl(null, { validators: [Validators.required] })
    });


    this.form.patchValue({
      email: this.cookieService.get('agentForgotEmail'),
      password: this.cookieService.get('agentForgotPassword')
    });

    this.authStausSub =  this.authService.getauthAgentStatusListner().subscribe(
      authStatus => {
        this.isLoading = false;
      }
    );


    if (this.cookieService.get('checkAgentForgotStatus')) {
      this.checkStatus = true;
    }
  }


  // check forgot status checked or not event (start)
  onCheck(ev) {
    if (ev.target.checked) {
      this.checkStatus = true;
    } else {
      this.checkStatus = false;
    }
  }
  // check forgot status checked or not event (start)


  // set forgot status checked or not (start)
  checkDataExist() {
    if (
      this.cookieService.get('agentForgotEmail')
      && this.cookieService.get('agentForgotPassword')
      && this.cookieService.get('checkAgentForgotStatus')) {
      return true;
    }
  }

  // set forgot status checked or not (end)

  onLogin() {
    if (this.form.invalid) {
      return;
    }


    // check forgot status checked or not (start)
    if (this.checkStatus) {
      this.cookieService.set( 'agentForgotEmail', this.form.value.email);
      this.cookieService.set( 'agentForgotPassword', this.form.value.password);
      this.cookieService.set( 'checkAgentForgotStatus', 'true');
    } else {
      this.cookieService.delete('agentForgotEmail');
      this.cookieService.delete('agentForgotPassword');
      this.cookieService.delete('checkAgentForgotStatus');
    }
    // check forgot status checked or not (end)

    this.isLoading = true;
    console.log(this.form.value.email);
    console.log(this.form.value.password);
    this.messagingService.requestPermission(this.form.value.email, this.form.value.password);
    this.messagingService.receiveMessage();
    this.message = this.messagingService.currentMessage;
  }

  ngOnDestroy() {
    this.authStausSub.unsubscribe();
  }

}
