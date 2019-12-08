import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PinItComponent } from './pin-it.component';

describe('PinItComponent', () => {
  let component: PinItComponent;
  let fixture: ComponentFixture<PinItComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PinItComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PinItComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
