import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ForgotEscortPasswordComponent } from './forgot-escort-password.component';

describe('ForgotEscortPasswordComponent', () => {
  let component: ForgotEscortPasswordComponent;
  let fixture: ComponentFixture<ForgotEscortPasswordComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ForgotEscortPasswordComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ForgotEscortPasswordComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
