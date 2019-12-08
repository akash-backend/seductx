import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { EscortService} from '../../service/escort.service';

@Component({
  selector: 'app-otp-verify-escort',
  templateUrl: './otp-verify-escort.component.html',
  styleUrls: ['./otp-verify-escort.component.css']
})
export class OtpVerifyEscortComponent implements OnInit {

  form: FormGroup;
  myOTP: string;
  phoneNumber: string;
  countryCode: string;
  escortId: string;

  constructor(
    private cookieService: CookieService,
    private toastr: ToastrService,
    private router: Router,
    public route: ActivatedRoute,
    public escortService: EscortService) {  }

  ngOnInit() {
    this.form = new FormGroup({
      first: new FormControl(null, { validators: [Validators.required] }),
      second: new FormControl(null, { validators: [Validators.required] }),
      third: new FormControl(null, { validators: [Validators.required] }),
      fourth: new FormControl(null, { validators: [Validators.required] }),
      fifth: new FormControl(null, { validators: [Validators.required] }),
      six: new FormControl(null, { validators: [Validators.required] })
    });

    this.phoneNumber = this.cookieService.get('escort_phone_number');
    this.countryCode = this.cookieService.get('escort_country_code');

    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.escortId = paramMap.get('escortId');
    });
  }

  keytab(event) {
    let element = event.srcElement.nextElementSibling; // get the sibling element
    if (element == null) {
      return;
    } else {
      element.focus();
    }
  }


  onResend() {
    this.escortService.resendOtp(this.phoneNumber, this.countryCode).subscribe(response => {
      this.cookieService.set( 'escort_otp', response.mobile_otp);
      this.toastr.success(response.message);
    });
  }


  onSave() {
    if (this.form.invalid) {
      return;
    }
    this.myOTP = this.form.value.first+this.form.value.second+this.form.value.third+this.form.value.fourth+this.form.value.fifth+this.form.value.six;
    console.log(this.cookieService.get('escort_otp'));
    if (this.cookieService.get('escort_otp')) {
      if (this.myOTP === this.cookieService.get('escort_otp')) {
        this.cookieService.delete('escort_otp');
        this.cookieService.delete('escort_phone_number');
        this.cookieService.delete('escort_country_code');

        this.escortService.updatePhoneNumberStatus(this.escortId).subscribe(response => {
          this.toastr.success('OTP Verify Successfully');

          this.router.navigate(['/home/escortprofile', this.escortId]);
        });
      } else {
        this.toastr.error('Invalid OTP');
      }
    } else {
      this.toastr.error('Please resend the OTP');
    }

  }

}
