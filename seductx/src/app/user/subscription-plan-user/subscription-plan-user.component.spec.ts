import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SubscriptionPlanUserComponent } from './subscription-plan-user.component';

describe('SubscriptionPlanUserComponent', () => {
  let component: SubscriptionPlanUserComponent;
  let fixture: ComponentFixture<SubscriptionPlanUserComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SubscriptionPlanUserComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SubscriptionPlanUserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
