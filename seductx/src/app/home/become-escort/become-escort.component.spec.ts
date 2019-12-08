import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BecomeEscortComponent } from './become-escort.component';

describe('BecomeEscortComponent', () => {
  let component: BecomeEscortComponent;
  let fixture: ComponentFixture<BecomeEscortComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BecomeEscortComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BecomeEscortComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
