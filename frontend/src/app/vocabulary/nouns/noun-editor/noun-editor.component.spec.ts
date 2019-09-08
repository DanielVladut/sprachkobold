import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NounEditorComponent } from './noun-editor.component';

describe('NounEditorComponent', () => {
  let component: NounEditorComponent;
  let fixture: ComponentFixture<NounEditorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NounEditorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NounEditorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
