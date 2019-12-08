import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PremiumEscortComponent } from './premium-escort.component';

describe('PremiumEscortComponent', () => {
  let component: PremiumEscortComponent;
  let fixture: ComponentFixture<PremiumEscortComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PremiumEscortComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PremiumEscortComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
