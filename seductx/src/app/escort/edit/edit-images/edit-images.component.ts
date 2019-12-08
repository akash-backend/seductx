import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators} from '@angular/forms';
import { AuthEscortService} from '../../../service/auth-escort.service';
import { EscortService} from '../../../service/escort.service';
import { ActivatedRoute, ParamMap } from '@angular/router';
@Component({
  selector: 'app-edit-images',
  templateUrl: './edit-images.component.html',
  styleUrls: ['./edit-images.component.css']
})
export class EditImagesComponent implements OnInit {

  isLoading = false;
  profileImagePreview = 'assets/images/profile.jpg';
  image1Preview = 'assets/images/photo.jpg';
  image2Preview = 'assets/images/photo.jpg';
  image3Preview = 'assets/images/photo.jpg';
  image4Preview = 'assets/images/photo.jpg';
  image5Preview = 'assets/images/photo.jpg';
  image6Preview = 'assets/images/photo.jpg';

  form: FormGroup;
  escortId: string;
  constructor(public authEscortService: AuthEscortService, public route: ActivatedRoute, public escortService: EscortService) { }



  ngOnInit() {
    this.form = new FormGroup({
     profileImage: new FormControl(null, {}),
      image1: new FormControl(null, {}),
      image2: new FormControl(null, {}),
      image3: new FormControl(null, {}),
      image4: new FormControl(null, {}),
      image5: new FormControl(null, {}),
      image6: new FormControl(null, {})
    });

    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.escortId = paramMap.get('escortId');
    });


    this.escortService.getGenralProfileInfo(this.escortId).subscribe(userData => {
        this.profileImagePreview = userData.escortinfo.profile_image;
        this.image1Preview = userData.escortinfo.image1;
        this.image2Preview = userData.escortinfo.image2;
        this.image3Preview = userData.escortinfo.image3;
        this.image4Preview = userData.escortinfo.image4;
        this.image5Preview = userData.escortinfo.image5;
        this.image6Preview = userData.escortinfo.image6;
    });
  }


  onProfileImagePicked(event: Event) {
    const file = (event.target as HTMLInputElement).files[0];
    this.form.patchValue({ profileImage: file });
    this.form.get('profileImage').updateValueAndValidity();
    const reader = new FileReader();
    reader.onload = () => {
      this.profileImagePreview = reader.result as string;
    };
    reader.readAsDataURL(file);
  }

  onImage1Picked(event: Event) {
    const file = (event.target as HTMLInputElement).files[0];
    this.form.patchValue({image1: file });
    this.form.get('image1').updateValueAndValidity();
    const reader = new FileReader();
    reader.onload = () => {
      this.image1Preview = reader.result as string;
    };
    reader.readAsDataURL(file);
  }

  onImage2Picked(event: Event) {
    const file = (event.target as HTMLInputElement).files[0];
    this.form.patchValue({image2: file });
    this.form.get('image2').updateValueAndValidity();
    const reader = new FileReader();
    reader.onload = () => {
      this.image2Preview = reader.result as string;
    };
    reader.readAsDataURL(file);
  }

  onImage3Picked(event: Event) {
    const file = (event.target as HTMLInputElement).files[0];
    this.form.patchValue({image3: file });
    this.form.get('image3').updateValueAndValidity();
    const reader = new FileReader();
    reader.onload = () => {
      this.image3Preview = reader.result as string;
    };
    reader.readAsDataURL(file);
  }

  onImage4Picked(event: Event) {
    const file = (event.target as HTMLInputElement).files[0];
    this.form.patchValue({image4: file });
    this.form.get('image4').updateValueAndValidity();
    const reader = new FileReader();
    reader.onload = () => {
      this.image4Preview = reader.result as string;
    };
    reader.readAsDataURL(file);
  }
  onImage5Picked(event: Event) {
    const file = (event.target as HTMLInputElement).files[0];
    this.form.patchValue({image5: file });
    this.form.get('image5').updateValueAndValidity();
    const reader = new FileReader();
    reader.onload = () => {
      this.image5Preview = reader.result as string;
    };
    reader.readAsDataURL(file);
  }

  onImage6Picked(event: Event) {
    const file = (event.target as HTMLInputElement).files[0];
    this.form.patchValue({image6: file });
    this.form.get('image6').updateValueAndValidity();
    const reader = new FileReader();
    reader.onload = () => {
      this.image6Preview = reader.result as string;
    };
    reader.readAsDataURL(file);
  }

  onSavePost() {
    if (this.form.invalid) {
      return;
    }

    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.escortId = paramMap.get('escortId');
    });

    this.isLoading = true;


   this.authEscortService.escortImageUpload(this.escortId,this.form.value.profileImage, this.form.value.image1, this.form.value.image2, this.form.value.image3, this.form.value.image4, this.form.value.image5, this.form.value.image6, '2', '4');

    this.form.reset();
  }

}
