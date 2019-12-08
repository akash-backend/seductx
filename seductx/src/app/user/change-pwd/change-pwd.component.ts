import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import {Subscription} from 'rxjs';
import {UserService} from '../../service/user.service';
import { AuthService } from '../../service/auth.service';

@Component({
  selector: 'app-change-pwd',
  templateUrl: './change-pwd.component.html',
  styleUrls: ['./change-pwd.component.css']
})
export class ChangePwdComponent implements OnInit {
  form: FormGroup;
  isLoading = false;
  userId: string;

  constructor(public userService: UserService , public authService: AuthService) {}

  ngOnInit() {
    this.form = new FormGroup({
      password: new FormControl(null, { validators: [Validators.required] }),
      new_password: new FormControl(null, { validators: [Validators.required] }),
      confirm_pwd: new FormControl(null, { validators: [Validators.required] }),
    });

    this.userId = this.authService.getUserId();
  }

  onSavePassword() {
    if (this.form.invalid) {
      return;
    }
    this.isLoading = true;
    this.userService.changePassword(
      this.userId,
      this.form.value.password,
      this.form.value.new_password,
    );
    this.form.reset();
  }

}
