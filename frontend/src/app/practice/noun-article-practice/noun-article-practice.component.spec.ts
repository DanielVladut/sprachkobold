import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NounArticlePracticeComponent } from './noun-article-practice.component';

describe('NounArticlePracticeComponent', () => {
  let component: NounArticlePracticeComponent;
  let fixture: ComponentFixture<NounArticlePracticeComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NounArticlePracticeComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NounArticlePracticeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
