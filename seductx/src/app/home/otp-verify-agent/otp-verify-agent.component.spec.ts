import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OtpVerifyAgentComponent } from './otp-verify-agent.component';

describe('OtpVerifyAgentComponent', () => {
  let component: OtpVerifyAgentComponent;
  let fixture: ComponentFixture<OtpVerifyAgentComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OtpVerifyAgentComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OtpVerifyAgentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
