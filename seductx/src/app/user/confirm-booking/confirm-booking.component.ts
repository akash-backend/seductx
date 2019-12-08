import { Component, OnInit , OnDestroy, NgZone, ViewChild, ElementRef} from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import {Subscription} from 'rxjs';
import { ActivatedRoute, ParamMap } from '@angular/router';
import { ConfirmBookingService } from '../../service/confirm-booking.service';
import { CookieService } from 'ngx-cookie-service';
import { MapsAPILoader, MouseEvent } from '@agm/core';
import { AgmCoreModule } from '@agm/core';

@Component({
  selector: 'app-confirm-booking',
  templateUrl: './confirm-booking.component.html',
  styleUrls: ['./confirm-booking.component.css']
})
export class ConfirmBookingComponent implements OnInit {
  @ViewChild('search', {static: true}) private searchElementRef: ElementRef;
  isLoading = false;
  form: FormGroup;
  rateId: string;
  escortId: string;
  userId: string;
  price: string;
  gender: string;
  hour: string;
  call: string;
  city: string;
  time: string;
  userName: string;

  latitude: number;
  longitude: number;
  zoom: number;
  address: string;
  private geoCoder;
  locationChosen = false;

  constructor(
    private cookieService: CookieService,
    public confirmBookingService: ConfirmBookingService,
    private mapsAPILoader: MapsAPILoader,
    private ngZone: NgZone) { }

  ngOnInit() {


    this.form = new FormGroup({
      userName: new FormControl(null, { validators: [Validators.required] }),
      userEmail: new FormControl(null, { validators: [Validators.required] }),
      hotel: new FormControl(null, { validators: [Validators.required] }),
      roomNo: new FormControl(null, { validators: [Validators.required] }),
      specialRequest: new FormControl(null, { validators: [Validators.required] }),
      address: new FormControl(null, { validators: [Validators.required] })
    });

    this.rateId = this.cookieService.get('booking_rate_id');
    this.escortId = this.cookieService.get('booking_escortId');
    this.userId = this.cookieService.get('booking_userId');
    this.price = this.cookieService.get('booking_price');
    this.hour = this.cookieService.get('filter_hour');
    this.gender = this.cookieService.get('filter_gender');
    this.call = this.cookieService.get('filter_call');
    this.city = this.cookieService.get('filter_city');
    this.time = this.cookieService.get('filter_time');
    this.userName = this.cookieService.get('booking_user_name');


    // load Places Autocomplete start

    this.mapsAPILoader.load().then(() => {
      this.setCurrentLocation();
      this.geoCoder = new google.maps.Geocoder;

      let autocomplete = new google.maps.places.Autocomplete(this.searchElementRef.nativeElement);
      autocomplete.addListener('place_changed', () => {
        this.ngZone.run(() => {
          // get the place result
          let place: google.maps.places.PlaceResult = autocomplete.getPlace();

          // verify result
          if (place.geometry === undefined || place.geometry === null) {
            return;
          }

          // set latitude, longitude and zoom
          this.latitude = place.geometry.location.lat();
          this.longitude = place.geometry.location.lng();
          console.log(this.latitude);
          console.log(this.longitude);
          this.zoom = 16;
        });
      });
    });

    // load Places Autocomplete end
  }

  // Get Current Location Coordinates start

  private setCurrentLocation() {
    if ('geolocation' in navigator) {
      navigator.geolocation.getCurrentPosition((position) => {
        this.latitude = position.coords.latitude;
        this.longitude = position.coords.longitude;
        this.zoom = 8;
        this.getAddress(this.latitude, this.longitude);
      });
    }
  }


  // Get Current Location Coordinates end

  markerDragEnd($event: MouseEvent) {
    console.log(this.latitude);
    this.latitude = $event.coords.lat;
    console.log(this.latitude);
    this.longitude = $event.coords.lng;
    this.getAddress(this.latitude, this.longitude);
  }

  getAddress(latitude, longitude) {
    this.geoCoder.geocode({ 'location': { lat: latitude, lng: longitude } }, (results, status) => {
      console.log(results);
      console.log(status);
      if (status === 'OK') {
        if (results[0]) {
          this.zoom = 12;
          this.address = results[0].formatted_address;
        } else {
          window.alert('No results found');
        }
      } else {
        window.alert('Geocoder failed due to: ' + status);
      }

    });
  }

  onSaveBooking() {
    if (this.form.invalid) {
      return;
    }
    this.isLoading = true;
    this.confirmBookingService.addBooking(
      this.form.value.userName,
      this.form.value.userEmail,
      this.form.value.hotel,
      this.form.value.roomNo,
      this.form.value.specialRequest,
      this.rateId,
      this.escortId,
      this.userId,
      this.price,
      this.latitude.toString(),
      this.longitude.toString(),
      this.address,
      this.time,
      this.call
    );
    this.form.reset();
  }
}
