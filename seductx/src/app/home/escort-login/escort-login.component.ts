import { Component, OnInit , OnDestroy} from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AuthEscortService} from '../../service/auth-escort.service';
import { Subscription } from 'rxjs';
import { MessagingService } from '../../service/messaging.service';
import { CookieService } from 'ngx-cookie-service';


@Component({
  selector: 'app-escort-login',
  templateUrl: './escort-login.component.html',
  styleUrls: ['./escort-login.component.css']
})
export class EscortLoginComponent implements OnInit,OnDestroy {

  isLoading = false;
  authStausSub: Subscription;
  checkStatus: boolean;
  form: FormGroup;
  message;
  constructor(
    public authService: AuthEscortService,
    private cookieService: CookieService,
    private messagingService: MessagingService) { }

  ngOnInit() {
    this.form = new FormGroup({
      email: new FormControl(null, { validators: [Validators.required] }),
      password: new FormControl(null, { validators: [Validators.required] })
    });


    this.form.patchValue({
      email: this.cookieService.get('escortForgotEmail'),
      password: this.cookieService.get('escortForgotPassword')
    });

    this.authStausSub =  this.authService.getAuthStatusListner().subscribe(
      authStatus => {
        this.isLoading = false;
      }
    );


    if (this.cookieService.get('checkEscortForgotStatus')) {
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
      this.cookieService.get('escortForgotEmail')
      && this.cookieService.get('escortForgotPassword')
      && this.cookieService.get('checkEscortForgotStatus')) {
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
      this.cookieService.set( 'escortForgotEmail', this.form.value.email);
      this.cookieService.set( 'escortForgotPassword', this.form.value.password);
      this.cookieService.set( 'checkEscortForgotStatus', 'true');
    } else {
      this.cookieService.delete('escortForgotEmail');
      this.cookieService.delete('escortForgotPassword');
      this.cookieService.delete('checkEscortForgotStatus');
    }
    // check forgot status checked or not (end)

    this.isLoading = true;
    this.messagingService.requestPermission(this.form.value.email, this.form.value.password);
    this.messagingService.receiveMessage();
    this.message = this.messagingService.currentMessage;
  }

  ngOnDestroy() {
    this.authStausSub.unsubscribe();
  }


}
