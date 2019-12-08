import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EscortPhotosComponent } from './escort-photos.component';

describe('EscortPhotosComponent', () => {
  let component: EscortPhotosComponent;
  let fixture: ComponentFixture<EscortPhotosComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EscortPhotosComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EscortPhotosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
