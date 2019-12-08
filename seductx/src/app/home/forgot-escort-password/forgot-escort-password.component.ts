import { Component, OnInit , OnDestroy} from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AuthEscortService} from '../../service/auth-escort.service';
import { Subscription } from 'rxjs';


@Component({
  selector: 'app-forgot-escort-password',
  templateUrl: './forgot-escort-password.component.html',
  styleUrls: ['./forgot-escort-password.component.css']
})
export class ForgotEscortPasswordComponent implements OnInit {
  isLoading = false;
  authStausSub: Subscription;
  form: FormGroup;
  constructor(public authService: AuthEscortService) { }

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
