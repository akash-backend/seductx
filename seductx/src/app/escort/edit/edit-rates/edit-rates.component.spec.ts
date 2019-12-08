import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EditRatesComponent } from './edit-rates.component';

describe('EditRatesComponent', () => {
  let component: EditRatesComponent;
  let fixture: ComponentFixture<EditRatesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EditRatesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EditRatesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
