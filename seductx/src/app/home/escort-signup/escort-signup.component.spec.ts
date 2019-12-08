import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EscortSignupComponent } from './escort-signup.component';

describe('EscortSignupComponent', () => {
  let component: EscortSignupComponent;
  let fixture: ComponentFixture<EscortSignupComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EscortSignupComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EscortSignupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
