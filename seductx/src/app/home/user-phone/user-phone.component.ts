import { Component, OnInit , OnDestroy, NgZone, ViewChild, ElementRef} from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { UserService} from '../../service/user.service';
import { AuthService} from '../../service/auth.service';
import { ActivatedRoute, ParamMap } from '@angular/router';



@Component({
  selector: 'app-user-phone',
  templateUrl: './user-phone.component.html',
  styleUrls: ['./user-phone.component.css']
})
export class UserPhoneComponent implements OnInit {
  isLoading = false;
  form: FormGroup;
  userId: string;
  country_list = [];
  constructor( public userService: UserService, public route: ActivatedRoute,  public authService: AuthService ) { }

  ngOnInit() {
    this.isLoading = false;
    this.form = new FormGroup({
      country_code: new FormControl(null, { validators: [Validators.required] }),
      phone_number: new FormControl(null, { validators: [Validators.required] })
    });

    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.userId = paramMap.get('userId');
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
    this.userService.updatePhone(
      this.userId,
      this.form.value.country_code,
      this.form.value.phone_number
      );
  }

}
