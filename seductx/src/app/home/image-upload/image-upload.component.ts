import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators} from '@angular/forms';
import { AuthEscortService} from '../../service/auth-escort.service';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-image-upload',
  templateUrl: './image-upload.component.html',
  styleUrls: ['./image-upload.component.css']
})
export class ImageUploadComponent implements OnInit {
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
  constructor(
    public authEscortService: AuthEscortService,
    public route: ActivatedRoute,
    private toastr: ToastrService) { }



  ngOnInit() {
    this.form = new FormGroup({
     profileImage: new FormControl(null, {
        validators: [Validators.required]
      }),
      image1: new FormControl(null, {
        validators: [Validators.required]
      }),
      image2: new FormControl(null, {
        validators: [Validators.required]
      }),
      image3: new FormControl(null, {
        validators: [Validators.required]
      }),
      image4: new FormControl(null, {
        validators: [Validators.required]
      }),
      image5: new FormControl(null, {
        validators: [Validators.required]
      }),
      image6: new FormControl(null, {
        validators: [Validators.required]
      })
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
      this.toastr.error('You have to upload all the images');
      return;
    }

    this.route.paramMap.subscribe((paramMap: ParamMap) => {
      this.escortId = paramMap.get('escortId');
    });

    this.isLoading = true;


   this.authEscortService.escortImageUpload(this.escortId,this.form.value.profileImage, this.form.value.image1, this.form.value.image2, this.form.value.image3, this.form.value.image4, this.form.value.image5, this.form.value.image6, '1', '4');

    this.form.reset();
  }

}
