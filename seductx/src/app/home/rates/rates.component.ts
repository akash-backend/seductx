import { Component, OnInit } from '@angular/core';
import {Subscription} from 'rxjs';
import { FormGroup, FormControl, Validators } from "@angular/forms";
import { EscortService} from '../../service/escort.service';
import { AuthEscortService} from '../../service/auth-escort.service';
import { ActivatedRoute, ParamMap } from '@angular/router';

@Component({
  selector: 'app-rates',
  templateUrl: './rates.component.html',
  styleUrls: ['./rates.component.css']
})
export class RatesComponent implements OnInit {
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


    this.escortService.getUserAddtionalRatesInfo().subscribe(ratesData => {
      this.rates_list = ratesData.rates_list;
      console.log(this.rates_list);
      this.isLoading = false;
    });
  }

  onCheck(ev, data) {
    if (ev.target.checked){
      // Pushing the object into array
      let hour = ((document.getElementById('styled-checkbox-' + data) as HTMLInputElement).value);
      let shot = ((document.getElementById('sampleShot' + data) as HTMLInputElement).value);
      let price = ((document.getElementById('samplePrice' + data) as HTMLInputElement).value);

      this.service.push({'hour':hour,'shot':shot,'price':price});
      console.log(this.service);
    } else {
        let index = this.service.findIndex((item) => item.hour === this.rates_list[data].hour_id);
        if (index !== -1) {
          this.service.splice(index, 1);
          console.log(this.service);
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


  onSave() {

    if (this.form.invalid && this.service.length <= 0) {
      return;
    }

    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.escortId = paramMap.get('escortId');
      console.log(this.form.value);
      this.isLoading = true;
      this.authEscortService.updateRates(this.escortId, this.service, this.form.value.cancellation_policy, this.form.value.payment_method, '1', '3');
    });
  }




}
