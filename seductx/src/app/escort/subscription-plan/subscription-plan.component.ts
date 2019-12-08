import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { EscortService } from '../../service/escort.service';
import {SubscriptionPlan} from '../../model/subscription-plan.model';
import { AuthEscortService } from '../../service/auth-escort.service';

@Component({
  selector: 'app-subscription-plan',
  templateUrl: './subscription-plan.component.html',
  styleUrls: ['./subscription-plan.component.css']
})
export class SubscriptionPlanComponent implements OnInit {
  subscriptionPlan: SubscriptionPlan[] = [];
  planId: string;
  escortId: string;
  amount: string;
  url: string;
  isLoading = false;
  form: FormGroup;
  constructor(
    public escortService: EscortService,
    public authService: AuthEscortService) {}

  ngOnInit() {
      this.escortId = this.authService.getEscortId();
      this.escortService.getSubscriptionPlan().subscribe(profileData => {
        this.isLoading = false;
        this.subscriptionPlan = profileData.plan_list;
        console.log(this.subscriptionPlan);
      });
  }


  onClick(planId, amount) {
    this.planId = planId;
    this.amount = amount;
  }

  isActive(planId) {
    return this.planId === planId;
  }



  onSave() {
    if (this.planId && this.amount) {
      this.url = 'https://www.seductx.com/seductxApi/escort/pay_spankPay?planId=' + this.planId + '&amount=' + this.amount + '&escortId=' + this.escortId;
      document.location.href = this.url;
    }
  }
}
