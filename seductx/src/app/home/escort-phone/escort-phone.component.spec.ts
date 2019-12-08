import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EscortPhoneComponent } from './escort-phone.component';

describe('EscortPhoneComponent', () => {
  let component: EscortPhoneComponent;
  let fixture: ComponentFixture<EscortPhoneComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EscortPhoneComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EscortPhoneComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
