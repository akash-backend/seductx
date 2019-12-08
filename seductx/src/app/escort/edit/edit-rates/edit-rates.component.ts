import { Component, OnInit } from '@angular/core';
import {Subscription} from 'rxjs';
import { FormGroup, FormControl, Validators } from "@angular/forms";
import { EscortService} from '../../../service/escort.service';
import { AuthEscortService} from '../../../service/auth-escort.service';
import { ActivatedRoute, ParamMap } from '@angular/router';

@Component({
  selector: 'app-edit-rates',
  templateUrl: './edit-rates.component.html',
  styleUrls: ['./edit-rates.component.css']
})
export class EditRatesComponent implements OnInit {

  isLoading = true;
  form: FormGroup;
  escortId: string;
  rates_list = [];
  service = [];

  constructor(
    public escortService: EscortService,
    public route: ActivatedRoute,
    public authEscortService: AuthEscortService) {}
  ngOnInit() {

    this.form = new FormGroup({
      cancellation_policy: new FormControl(null, { validators: [Validators.required] }),
      payment_method: new FormControl(null, { validators: [Validators.required] }),
    });

    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.escortId = paramMap.get('escortId');
    });

    this.escortService.getGenralProfileInfo(this.escortId).subscribe(userData => {
      this.service = userData.escortinfo.rate;
      console.log(userData);
      this.form.patchValue({
        cancellation_policy: userData.escortinfo.cancellation_policy,
        payment_method: userData.escortinfo.payment_method,
      });

      console.log("before srtataj");
      console.log(this.service);
      console.log("before endataj");
      this.escortService.getUserAddtionalRatesInfo().subscribe(ratesData => {
        this.rates_list = ratesData.rates_list;
        this.isLoading = false;
      });
    });
  }

  onCheck(ev, data) {
    if (ev.target.checked){
      // Pushing the object into array
      let hour = ((document.getElementById('styled-checkbox-' + data) as HTMLInputElement).value);
      let shot = ((document.getElementById('sampleShot' + data) as HTMLInputElement).value);
      let price = ((document.getElementById('samplePrice' + data) as HTMLInputElement).value);

      this.service.push({'hour':hour,'shot':shot,'price':price});

    } else {
        let index = this.service.findIndex((item) => item.hour === this.rates_list[data].hour_id);
        if (index !== -1) {
          this.service.splice(index, 1);

        }
    }
  }

  onChage(data) {
    let index = this.service.findIndex((item) => item.hour === this.rates_list[data].hour_id);

    if (index !== -1) {

      let hour = ((document.getElementById('styled-checkbox-' + data) as HTMLInputElement).value);
      let shot = ((document.getElementById('sampleShot' + data) as HTMLInputElement).value);
      let price = ((document.getElementById('samplePrice' + data) as HTMLInputElement).value);
      this.service[index] = {'hour':hour,'shot':shot,'price':price};
    }
  }


  // Check Data exixt start

  checkHourExist(hourId: string) {
    if (hourId) {
      let index = this.service.findIndex((item) => item.hour === hourId);
      if (index !== -1) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }


  checkShotExist(hourId: string, shotId: string) {
    if (hourId && shotId) {
      let index = this.service.findIndex((item) => item.hour === hourId);
      if (index !== -1) {
        let indexShot = this.service.findIndex((item) => item.shot === shotId);
        if (indexShot !== -1) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }


  checkPriceExist(hourId: string, priceId: string) {
    if (hourId && priceId) {
      let index = this.service.findIndex((item) => item.hour === hourId);
      if (index !== -1) {
        let indexShot = this.service.findIndex((item) => item.price === priceId);
        if (indexShot !== -1) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  // Check Data exixt end


  onSave() {

    if (this.form.invalid || this.service.length <= 0) {
      return;
    }
    this.isLoading = true;
    this.authEscortService.updateRates(this.escortId, this.service, this.form.value.cancellation_policy, this.form.value.payment_method, '2', '4');
  }

}
