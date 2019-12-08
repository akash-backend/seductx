import { Component, OnInit , OnDestroy} from '@angular/core';
import { FormGroup, FormControl, Validators } from "@angular/forms";
import { AuthService} from '../../service/auth.service';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-forgot-password',
  templateUrl: './forgot-password.component.html',
  styleUrls: ['./forgot-password.component.css']
})
export class ForgotPasswordComponent implements OnInit {

  isLoading = false;
  authStausSub: Subscription;
  form: FormGroup;
  constructor(public authService: AuthService) { }

  ngOnInit() {
    this.form = new FormGroup({
      email: new FormControl(null, { validators: [Validators.required] }),
    });
  }

  onForgotPassword() {
    if (this.form.invalid) {
      return;
    }

    this.isLoading = true;
    this.authService.forgot_password(this.form.value.email);
  }

}
