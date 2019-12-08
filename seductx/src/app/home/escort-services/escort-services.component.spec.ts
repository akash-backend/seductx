import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EscortServicesComponent } from './escort-services.component';

describe('EscortServicesComponent', () => {
  let component: EscortServicesComponent;
  let fixture: ComponentFixture<EscortServicesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EscortServicesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EscortServicesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
