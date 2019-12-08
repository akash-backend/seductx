import { Component, OnInit , OnDestroy} from '@angular/core';
import { FormGroup, FormControl, Validators } from "@angular/forms";
import { EscortService} from '../../service/escort.service';
import { AuthEscortService} from '../../service/auth-escort.service';
import { Subscription } from 'rxjs';
import { ActivatedRoute, ParamMap } from "@angular/router";

@Component({
  selector: 'app-escort-profile',
  templateUrl: './escort-profile.component.html',
  styleUrls: ['./escort-profile.component.css']
})
export class EscortProfileComponent implements OnInit {
  isLoading = true;
  form: FormGroup;
  escortId: string;
  countries_list = [];
  state_list = [];
  city_list = [];
  gender_list = [];
  body_type_list = [];
  bust_size_list = [];
  cup_size_list = [];
  waise_size_list = [];
  hip_size_list = [];
  english_list = [];
  chinese_list = [];
  japanese_list = [];
  korean_list = [];


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


    this.escortService.getUserProfileAdditionalInfo().subscribe(profileData => {
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

    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.escortId = paramMap.get('escortId');
    });

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
      '1',
      '1');
  }


}
