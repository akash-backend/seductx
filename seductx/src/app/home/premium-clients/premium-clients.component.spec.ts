import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PremiumClientsComponent } from './premium-clients.component';

describe('PremiumClientsComponent', () => {
  let component: PremiumClientsComponent;
  let fixture: ComponentFixture<PremiumClientsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PremiumClientsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PremiumClientsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
