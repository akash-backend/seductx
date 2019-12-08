import { Component, OnInit , OnDestroy, NgZone, ViewChild, ElementRef} from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { EscortService} from '../../service/escort.service';
import { AuthService} from '../../service/auth.service';
import { ActivatedRoute, ParamMap } from '@angular/router';
@Component({
  selector: 'app-escort-phone',
  templateUrl: './escort-phone.component.html',
  styleUrls: ['./escort-phone.component.css']
})
export class EscortPhoneComponent implements OnInit {

  isLoading = false;
  form: FormGroup;
  escortId: string;
  country_list = [];
  constructor( public escortService: EscortService, public route: ActivatedRoute,  public authService: AuthService ) { }

  ngOnInit() {
    this.isLoading = false;
    this.form = new FormGroup({
      country_code: new FormControl(null, { validators: [Validators.required] }),
      phone_number: new FormControl(null, { validators: [Validators.required] })
    });

    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.escortId = paramMap.get('escortId');
    });

    this.authService.getCountryList().subscribe(countrytData => {
      this.country_list = countrytData.country_list;
    });
  }


  onSave() {
    if (this.form.invalid) {
      console.log(this.form.value);
      return;
    }

    this.isLoading = true;
    this.escortService.updatePhone(
      this.escortId,
      this.form.value.country_code,
      this.form.value.phone_number
      );
  }

}
