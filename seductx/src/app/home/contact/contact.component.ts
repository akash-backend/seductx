import { Component, OnInit , OnDestroy, NgZone, ViewChild, ElementRef} from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { EscortService} from '../../service/escort.service';
import { AuthService} from '../../service/auth.service';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.css']
})
export class ContactComponent implements OnInit {

  isLoading = false;
  form: FormGroup;
  escortId: string;
  country_list = [];
  constructor( public escortService: EscortService, public authService: AuthService ) { }

  ngOnInit() {
    this.isLoading = false;
    this.form = new FormGroup({
      name: new FormControl(null, { validators: [Validators.required] }),
      email: new FormControl(null, { validators: [Validators.required] }),
      message: new FormControl(null, { validators: [Validators.required] })
    });
  }


  onSave() {
    if (this.form.invalid) {
      console.log(this.form.value);
      return;
    }

    console.log(this.form.value);

    this.isLoading = true;
    this.escortService.contactUs(
      this.form.value.name,
      this.form.value.message,
      this.form.value.email
      );
  }

}
