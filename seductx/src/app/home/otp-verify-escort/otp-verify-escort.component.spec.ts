import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OtpVerifyEscortComponent } from './otp-verify-escort.component';

describe('OtpVerifyEscortComponent', () => {
  let component: OtpVerifyEscortComponent;
  let fixture: ComponentFixture<OtpVerifyEscortComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OtpVerifyEscortComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OtpVerifyEscortComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
