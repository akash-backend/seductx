import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EscortListComponent } from './escort-list.component';

describe('EscortListComponent', () => {
  let component: EscortListComponent;
  let fixture: ComponentFixture<EscortListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EscortListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EscortListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
