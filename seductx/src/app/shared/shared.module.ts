import { NgModule, Directive,OnInit, EventEmitter, Output, OnDestroy, Input,ElementRef,Renderer } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DropdownDirective } from './dropdown.directive';

@NgModule({
  imports: [
  ],
  declarations: [
  DropdownDirective
  ],
  exports: [
    DropdownDirective
  ]
})

export class SharedModule { }
