import { Component, OnInit , OnDestroy} from '@angular/core';
import { FormGroup, FormControl, Validators } from "@angular/forms";
import { EscortService} from '../../../service/escort.service';
import { AuthEscortService} from '../../../service/auth-escort.service';
import { Subscription } from 'rxjs';
import { ActivatedRoute, ParamMap } from '@angular/router';
import {Gender} from '../../../model/gender.model';
import {EscortGeneralProfile} from '../../../model/escortGeneralProfile.model';

@Component({
  selector: 'app-edit-profile',
  templateUrl: './edit-profile.component.html',
  styleUrls: ['./edit-profile.component.css']
})
export class EditProfileComponent implements OnInit {

  isLoading = true;
  form: FormGroup;
  escortId: string;
  countries_list = [];
  state_list = [];
  city_list = [];
  gender_list: [];
  body_type_list = [];
  bust_size_list = [];
  cup_size_list = [];
  waise_size_list = [];
  hip_size_list = [];
  english_list = [];
  chinese_list = [];
  japanese_list = [];
  korean_list = [];
  escortData: any;


  constructor(
    public escortService: EscortService,
    public authEscortService: AuthEscortService,
    public route: ActivatedRoute) {}

  ngOnInit() {

    this.form = new FormGroup({
      country_id: new FormControl(null, { validators: [Validators.required] }),
      city_id: new FormControl(null, { validators: [Validators.required] }),
      gender: new FormControl(null, { validators: [Validators.required] }),
      body_type: new FormControl(null, { validators: [Validators.required] }),
      age: new FormControl(null, { validators: [Validators.required] }),
      height: new FormControl(null, { validators: [Validators.required] }),
      bust_size: new FormControl(null, { validators: [Validators.required] }),
      cup_size: new FormControl(null, { validators: [Validators.required] }),
      waise_size: new FormControl(null, { validators: [Validators.required] }),
      hip_size: new FormControl(null, { validators: [Validators.required] }),
      english: new FormControl(null, { validators: [Validators.required] }),
      chinese: new FormControl(null, { validators: [Validators.required] }),
      japanese: new FormControl(null, { validators: [Validators.required] }),
      korean: new FormControl(null, { validators: [Validators.required] }),
    });

    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.escortId = paramMap.get('escortId');
    });

    this.escortService.getGenralProfileInfo(this.escortId).subscribe(userData => {
      this.onChangeCountry(userData.escortinfo.country_id);
      this.escortData = {
        escort_id: userData.escortinfo.escort_id,
        last_name: userData.escortinfo.last_name,
        latitude: userData.escortinfo.latitude,
        longitude: userData.escortinfo.longitude,
        email: userData.escortinfo.email,
        deviceToken: userData.escortinfo.deviceToken,
        profile_image: userData.escortinfo.profile_image,
        password: userData.escortinfo.password,
        reset_code: userData.escortinfo.reset_code,
        token: userData.escortinfo.token,
        country_code: userData.escortinfo.country_code,
        phone_number: userData.escortinfo.phone_number,
        country_id: userData.escortinfo.country_id,
        state_id: userData.escortinfo.state_id,
        city_id: userData.escortinfo.city_id,
        gender: userData.escortinfo.gender,
        body_type: userData.escortinfo.body_type,
        age: userData.escortinfo.age,
        height: userData.escortinfo.height,
        bust_size: userData.escortinfo.bust_size,
        cup_size: userData.escortinfo.cup_size,
        waise_size: userData.escortinfo.waise_size,
        hip_size: userData.escortinfo.hip_size,
        english: userData.escortinfo.english,
        chinese: userData.escortinfo.chinese,
        japanese: userData.escortinfo.japanese,
        korean: userData.escortinfo.korean,
        image1: userData.escortinfo.image1,
        image2: userData.escortinfo.image2,
        image3: userData.escortinfo.image3,
        image4: userData.escortinfo.image4,
        image5: userData.escortinfo.image5,
        image6: userData.escortinfo.image6,
        service: userData.escortinfo.service,
        cancellation_policy: userData.escortinfo.cancellation_policy,
        payment_method: userData.escortinfo.payment_method,
        status: userData.escortinfo.status,
        online_status: userData.escortinfo.online_status,
        progress_status: userData.escortinfo.progress_status,
        addtional_service: userData.escortinfo.addtional_service
      };

      this.form.patchValue({
        country_id: this.escortData.country_id,
        city_id: this.escortData.city_id,
        gender: this.escortData.gender,
        body_type: this.escortData.body_type,
        age: this.escortData.age,
        height: this.escortData.height,
        bust_size: this.escortData.bust_size,
        cup_size: this.escortData.cup_size,
        waise_size: this.escortData.waise_size,
        hip_size: this.escortData.hip_size,
        english: this.escortData.english,
        chinese: this.escortData.english,
        japanese: this.escortData.english,
        korean: this.escortData.english,
      });

      console.log(this.escortData);
      console.log(this.escortData);


      this.escortService.getUserProfileAdditionalInfo().subscribe(profileData => {
        console.log(profileData);
        this.body_type_list = profileData.body_type_info;
        this.cup_size_list = profileData.cup_size_info;
        this.chinese_list = profileData.chinese_info;
        this.bust_size_list = profileData.bust_size_info;
        this.gender_list = profileData.gender_info;
        this.hip_size_list = profileData.hip_size_info;
        this.japanese_list = profileData.japanese_info;
        this.korean_list = profileData.korean_info;
        this.waise_size_list = profileData.waise_size_info;
        this.english_list = profileData.english_info;
        this.countries_list = profileData.countries_info;
        this.isLoading = false;

      });

    });







  }






  onChangeCountry(countryId: string) {
    if (countryId) {
      this.escortService.getCityByCityId(countryId).subscribe(
        citydata => {
          this.city_list = [];
          this.city_list = citydata.cities_list;
        }
      );
    } else {
      this.city_list = [];
    }
  }




  onSave() {
    if (this.form.invalid) {
      return;
    }



    this.isLoading = true;
    this.authEscortService.updateProfile(
      this.escortId,
      this.form.value.country_id,
      this.form.value.city_id,
      this.form.value.gender,
      this.form.value.body_type,
      this.form.value.age,
      this.form.value.height,
      this.form.value.bust_size,
      this.form.value.cup_size,
      this.form.value.waise_size,
      this.form.value.hip_size,
      this.form.value.english,
      this.form.value.chinese,
      this.form.value.japanese,
      this.form.value.korean,
      '2',
      '4');
  }

}
