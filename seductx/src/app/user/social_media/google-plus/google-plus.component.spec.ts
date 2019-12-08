import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GooglePlusComponent } from './google-plus.component';

describe('GooglePlusComponent', () => {
  let component: GooglePlusComponent;
  let fixture: ComponentFixture<GooglePlusComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GooglePlusComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GooglePlusComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
