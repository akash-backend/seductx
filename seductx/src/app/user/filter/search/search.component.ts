import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { EscortService} from '../../../service/escort.service';
import { AuthEscortService} from '../../../service/auth-escort.service';
import { Subscription } from 'rxjs';
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';


@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent implements OnInit {

  isLoading = true;
  form: FormGroup;
  escortId: string;
  body_type_list = [];
  cup_size_list = [];
  service_info = [];
  height = [];
  start_height: string;
  end_height: string;
  age = [];
  start_age: string;
  end_age: string;
  service = [];
  agent_list = [];




  constructor(
      public escortService: EscortService,
      public authEscortService: AuthEscortService,
      private cookieService: CookieService,
      private router: Router
      ) {}


  ngOnInit() {
    console.log(this.cookieService.get('Test'));

    this.form = new FormGroup({
      body_type: new FormControl(null, { validators: [Validators.required] }),
      age: new FormControl(null, { validators: [Validators.required] }),
      height: new FormControl(null, { validators: [Validators.required] }),
      cup_size: new FormControl(null, { validators: [Validators.required] }),
      agent: new FormControl(null, { validators: [Validators.required] }),
      });


    this.escortService.getUserProfileAdditionalInfo().subscribe(profileData => {

      this.body_type_list = profileData.body_type_info;
      this.cup_size_list = profileData.cup_size_info;
      this.agent_list = profileData.agent_info;
      this.isLoading = false;
    });


    this.escortService.getUserAddtionalServiceInfo().subscribe(profileData => {
      console.log(profileData);
      this.service_info = profileData.service_info;
    });
  }



  onCheck(ev, data) {
    if (ev.target.checked){
      // Pushing the object into array
      this.service.push(data);
    } else {
      const removeIndex = this.service.indexOf(data);
      if (removeIndex !== -1) {
        this.service.splice(removeIndex, 1);
      }
    }
  }



  onSave() {
    if (this.form.invalid || this.service.length <= 0) {
      return;
    }

    console.log(this.service);
    // height code start

    if (this.form.value.height !== 'any') {
      this.height = this.form.value.height.split('-');
      this.start_height = this.height[0];
      this.end_height = this.height[1];

      if (this.height[0] === 'less_then') {
        this.end_height = '';
        this.start_height = this.height[1];
      }

      if (this.height[0] === 'greater_then') {
        this.start_height = '';
      }
    } else {
      this.start_height = '';
      this.end_height = '';
    }


    // height code end


    // age code start

    if (this.form.value.age !== 'any') {

    this.age = this.form.value.age.split('-');
    this.start_age = this.age[0];
    this.end_age = this.age[1];

    if (this.age[0] === 'greater_then') {
      this.start_age = '';
    }

    } else {
      this.start_age = '';
      this.end_age = '';
    }


    if (this.form.value.body_type == 'any') {
      this.form.value.body_type = '';
    }



    this.cookieService.set( 'filter_start_age', this.start_age );
    this.cookieService.set( 'filter_end_age', this.end_age );
    this.cookieService.set( 'filter_start_height', this.start_height );
    this.cookieService.set( 'filter_end_height', this.end_height );
    this.cookieService.set( 'filter_body_type', this.form.value.body_type);
    this.cookieService.set( 'filter_cup_size', this.form.value.cup_size);
    this.cookieService.set( 'filter_service', this.service.toString());
    this.cookieService.set( 'filter_agent', this.form.value.agent);


    this.router.navigate(['/user/searchonline']);
  }


}
