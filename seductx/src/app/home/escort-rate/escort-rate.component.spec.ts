import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EscortRateComponent } from './escort-rate.component';

describe('EscortRateComponent', () => {
  let component: EscortRateComponent;
  let fixture: ComponentFixture<EscortRateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EscortRateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EscortRateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
