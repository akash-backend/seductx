import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ForgotAgentPasswordComponent } from './forgot-agent-password.component';

describe('ForgotAgentPasswordComponent', () => {
  let component: ForgotAgentPasswordComponent;
  let fixture: ComponentFixture<ForgotAgentPasswordComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ForgotAgentPasswordComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ForgotAgentPasswordComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
