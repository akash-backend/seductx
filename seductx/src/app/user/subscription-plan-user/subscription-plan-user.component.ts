import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { UserService } from '../../service/user.service';
import {SubscriptionPlan} from '../../model/subscription-plan.model';
import { AuthService } from '../../service/auth.service';

@Component({
  selector: 'app-subscription-plan-user',
  templateUrl: './subscription-plan-user.component.html',
  styleUrls: ['./subscription-plan-user.component.css']
})
export class SubscriptionPlanUserComponent implements OnInit {

  subscriptionPlan: SubscriptionPlan[] = [];
  planId: string;
  userId: string;
  amount: string;
  url: string;
  isLoading = false;
  form: FormGroup;

  constructor(
    public userService: UserService,
    public authService: AuthService) {}

  ngOnInit() {
      this.userId = this.authService.getUserId();
      this.userService.getSubscriptionPlan().subscribe(profileData => {
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
      this.url = 'https://www.seductx.com/seductxApi/user/pay_spankPay?planId=' + this.planId + '&amount=' + this.amount + '&userId=' + this.userId;
      document.location.href = this.url;
    }
  }

}
