import { Component, OnInit , OnDestroy} from '@angular/core';
import { FormGroup, FormBuilder ,FormArray, FormControl, Validators } from '@angular/forms';
import {Subscription} from 'rxjs';
import { EscortService} from '../../service/escort.service';
import { AuthEscortService} from '../../service/auth-escort.service';
import { ActivatedRoute, ParamMap } from '@angular/router';

@Component({
  selector: 'app-escort-services',
  templateUrl: './escort-services.component.html',
  styleUrls: ['./escort-services.component.css']
})
export class EscortServicesComponent implements OnInit {
  isLoading = true;
  escortId: string;
  service_info = [];
  additional_service_info = [];
  service = [];
  additional_service = [];

  constructor(
    public escortService: EscortService,
    public authEscortService: AuthEscortService,
    public route: ActivatedRoute) {}


  ngOnInit() {
    this.escortService.getUserAddtionalServiceInfo().subscribe(profileData => {
      this.service_info = profileData.service_info;
      this.additional_service_info = profileData.additional_service_info;
      console.log(this.additional_service_info);
    });
  }


  onCheck(ev, data) {
    if (ev.target.checked){
      // Pushing the object into array
      this.service.push(data);
      console.log(this.service);
    } else {
      const removeIndex = this.service.indexOf(data);
      if (removeIndex !== -1) {
        this.service.splice(removeIndex, 1);
        console.log(this.service);
      }
    }
  }

  onCheckAdditional(ev, data) {
    if (ev.target.checked){
      // Pushing the object into array
      let additional_service_id = ((document.getElementById('styled-checkbox-add-' + data) as HTMLInputElement).value);
      let info = ((document.getElementById('sampleInfo' + data) as HTMLInputElement).value);


      this.additional_service.push({'additional_service_id':additional_service_id,'info':info});
      console.log('start');
      console.log(this.additional_service);
    } else {
        let index = this.additional_service.findIndex((item) => item.additional_service_id === this.additional_service_info[data].services_id);
        if (index !== -1) {
          this.additional_service.splice(index, 1);
        }
    }
  }


  onChage(data) {
    let index = this.additional_service.findIndex((item) => item.additional_service_id === this.additional_service_info[data].services_id);

    if (index !== -1) {

      let additional_service_id = ((document.getElementById('styled-checkbox-add-' + data) as HTMLInputElement).value);
      let info = ((document.getElementById('sampleInfo' + data) as HTMLInputElement).value);
      this.additional_service[index] = {'additional_service_id':additional_service_id,'info':info};
    }
  }


  onSave() {
    if (this.service.length > 0) {


      this.route.paramMap.subscribe((paramMap: ParamMap) => {
        this.escortId = paramMap.get('escortId');
      });

      console.log(this.additional_service);
      this.isLoading = true;
      this.authEscortService.updateService(this.escortId, this.service.join(), this.additional_service, '1', '2');
    } else {
      console.log('data not found');
    }
  }

}


