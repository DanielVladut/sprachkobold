import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NounEditorComponent } from './nouns/noun-editor/noun-editor.component';
import { VerbEditorComponent } from './verbs/verb-editor/verb-editor.component';
import { GenericWordEditorComponent } from './others/generic-word-editor/generic-word-editor.component';

@NgModule({
  declarations: [NounEditorComponent, VerbEditorComponent, GenericWordEditorComponent],
  imports: [
    CommonModule
  ]
})
export class VocabularyModule { }
