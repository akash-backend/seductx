import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateEscortComponent } from './create-escort.component';

describe('CreateEscortComponent', () => {
  let component: CreateEscortComponent;
  let fixture: ComponentFixture<CreateEscortComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CreateEscortComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateEscortComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
