import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { AgentService} from '../../service/agent.service';

@Component({
  selector: 'app-otp-verify-agent',
  templateUrl: './otp-verify-agent.component.html',
  styleUrls: ['./otp-verify-agent.component.css']
})
export class OtpVerifyAgentComponent implements OnInit {

  form: FormGroup;
  myOTP: string;
  phoneNumber: string;
  countryCode: string;
  agentId: string;

  constructor(
    private cookieService: CookieService,
    private toastr: ToastrService,
    private router: Router,
    public route: ActivatedRoute,
    public agentService: AgentService) {  }

  ngOnInit() {
    this.form = new FormGroup({
      first: new FormControl(null, { validators: [Validators.required] }),
      second: new FormControl(null, { validators: [Validators.required] }),
      third: new FormControl(null, { validators: [Validators.required] }),
      fourth: new FormControl(null, { validators: [Validators.required] }),
      fifth: new FormControl(null, { validators: [Validators.required] }),
      six: new FormControl(null, { validators: [Validators.required] })
    });

    this.phoneNumber = this.cookieService.get('agent_phone_number');
    this.countryCode = this.cookieService.get('agent_country_code');

    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.agentId = paramMap.get('agentId');
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
    this.agentService.resendOtp(this.phoneNumber, this.countryCode).subscribe(response => {
      this.cookieService.set( 'agent_otp', response.mobile_otp);
      this.toastr.success(response.message);
    });
  }


  onSave() {
    if (this.form.invalid) {
      return;
    }
    this.myOTP = this.form.value.first+this.form.value.second+this.form.value.third+this.form.value.fourth+this.form.value.fifth+this.form.value.six;
    console.log(this.cookieService.get('agent_otp'));
    if (this.cookieService.get('agent_otp')) {
      if (this.myOTP === this.cookieService.get('agent_otp')) {
        this.cookieService.delete('agent_otp');
        this.cookieService.delete('agent_phone_number');
        this.cookieService.delete('agent_country_code');

        this.agentService.updatePhoneNumberStatus(this.agentId).subscribe(response => {
          this.toastr.success('OTP Verify Successfully');

          this.router.navigate(['/home/agentLogin']);
        });
      } else {
        this.toastr.error('Invalid OTP');
      }
    } else {
      this.toastr.error('Please resend the OTP');
    }

  }

}
