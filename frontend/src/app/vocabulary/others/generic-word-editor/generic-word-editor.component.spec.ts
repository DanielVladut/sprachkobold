import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GenericWordEditorComponent } from './generic-word-editor.component';

describe('GenericWordEditorComponent', () => {
  let component: GenericWordEditorComponent;
  let fixture: ComponentFixture<GenericWordEditorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GenericWordEditorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GenericWordEditorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
