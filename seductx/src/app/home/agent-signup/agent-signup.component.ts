import { Component, OnInit , OnDestroy, NgZone, ViewChild, ElementRef} from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AuthAgentService} from '../../service/auth-agent.service';
import { MapsAPILoader, MouseEvent } from '@agm/core';
import { Subscription } from 'rxjs';


@Component({
  selector: 'app-agent-signup',
  templateUrl: './agent-signup.component.html',
  styleUrls: ['./agent-signup.component.css']
})
export class AgentSignupComponent implements OnInit , OnDestroy {

  isLoading = false;
  private authStatusSub: Subscription;
  form: FormGroup;
  country_list = [];

  latitude: number;
  longitude: number;
  zoom: number;
  address: string;
  private geoCoder;
  locationChosen = false;

  @ViewChild('search', {static: true}) private searchElementRef: ElementRef;



  constructor(
    public authService: AuthAgentService,
    private mapsAPILoader: MapsAPILoader,
    private ngZone: NgZone) { }

  ngOnInit() {
    this.form = new FormGroup({
      first_name: new FormControl(null, {
        validators: [Validators.required, Validators.minLength(3)]
      }),
      last_name: new FormControl(null, { validators: [Validators.required] }),
      email: new FormControl(null, { validators: [Validators.required] }),
      password: new FormControl(null, { validators: [Validators.required] }),
      country_code: new FormControl(null, { validators: [Validators.required] }),
      phone_number: new FormControl(null, { validators: [Validators.required] }),
      address: new FormControl(null, { validators: [Validators.required] }),
      agency_name: new FormControl(null, { validators: [Validators.required] }),
    });


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

    this.authStatusSub = this.authService.getauthAgentStatusListner().subscribe(
      authStatus => {
        this.isLoading = false;
      }
    )

    this.authService.getCountryList().subscribe(countrytData => {
      this.country_list = countrytData.country_list;
    });
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


  // private setCurrentLocation() {
  //   this.latitude = 22.7239117;
  //   this.longitude = 75.7237611;
  //   this.zoom = 8;
  //   this.getAddress(this.latitude, this.longitude);
  // }

  // Get Current Location Coordinates end

  markerDragEnd($event: MouseEvent) {
    console.log($event);
    this.latitude = $event.coords.lat;
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

  onSignup() {
    if (this.form.invalid) {
      return;
    }
    this.isLoading = true;
    this.authService.createAgent(
      this.form.value.first_name,
      this.form.value.last_name,
      this.form.value.email,
      this.form.value.password,
      this.form.value.country_code,
      this.form.value.phone_number,
      this.latitude.toString(),
      this.longitude.toString(),
      this.form.value.agency_name)
  }

  ngOnDestroy() {
    this.authStatusSub.unsubscribe();
  }

}
