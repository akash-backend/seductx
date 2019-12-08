import { Component, OnInit , OnDestroy} from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AuthService} from '../../service/auth.service';
import { Subscription } from 'rxjs';
import { MessagingUserService } from '../../service/messaging-user.service';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit, OnDestroy {
  isLoading = false;
  authStausSub: Subscription;
  checkStatus: boolean;
  form: FormGroup;
  message;
  constructor(
    public authService: AuthService,
    private cookieService: CookieService,
    private messagingUserService: MessagingUserService) { }

  ngOnInit() {
    this.form = new FormGroup({
      email: new FormControl(null, { validators: [Validators.required] }),
      password: new FormControl(null, { validators: [Validators.required] }),
    });


    this.form.patchValue({
      email: this.cookieService.get('userForgotEmail'),
      password: this.cookieService.get('userForgotPassword')
    });

    this.authStausSub =  this.authService.getauthUserStatusListner().subscribe(
      authStatus => {
        this.isLoading = false;
      }
    );

    if (this.cookieService.get('checkForgotStatus')) {
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
      this.cookieService.get('userForgotEmail')
      && this.cookieService.get('userForgotPassword')
      && this.cookieService.get('checkForgotStatus')) {
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
      this.cookieService.set( 'userForgotEmail', this.form.value.email);
      this.cookieService.set( 'userForgotPassword', this.form.value.password);
      this.cookieService.set( 'checkForgotStatus', 'true');
    } else {
      this.cookieService.delete('userForgotEmail');
      this.cookieService.delete('userForgotPassword');
      this.cookieService.delete('checkForgotStatus');
    }
    // check forgot status checked or not (end)

    this.isLoading = true;
    this.messagingUserService.requestPermission(this.form.value.email, this.form.value.password);
    this.messagingUserService.receiveMessage();
    this.message = this.messagingUserService.currentMessage;

  }

  ngOnDestroy() {
    this.authStausSub.unsubscribe();
  }

}
