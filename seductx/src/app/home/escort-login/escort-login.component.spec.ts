import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EscortLoginComponent } from './escort-login.component';

describe('EscortLoginComponent', () => {
  let component: EscortLoginComponent;
  let fixture: ComponentFixture<EscortLoginComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EscortLoginComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EscortLoginComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
