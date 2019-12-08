import { Component, OnInit , OnDestroy} from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AuthAgentService} from '../../service/auth-agent.service';
import { Subscription } from 'rxjs';
@Component({
  selector: 'app-forgot-agent-password',
  templateUrl: './forgot-agent-password.component.html',
  styleUrls: ['./forgot-agent-password.component.css']
})
export class ForgotAgentPasswordComponent implements OnInit {

  isLoading = false;
  authStausSub: Subscription;
  form: FormGroup;
  constructor(public authService: AuthAgentService) { }

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
