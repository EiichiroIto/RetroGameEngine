"
An ImageEditorHScrollbarTest is a test class for testing the behavior of ImageEditorHScrollbar
"
Class {
	#name : #ImageEditorHScrollbarTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
ImageEditorHScrollbarTest >> newObj [
	^ ImageEditorHScrollbar new
		init: ImageEditor new;
		yourself
]

{ #category : #test }
ImageEditorHScrollbarTest >> testBarExtent [
	self assert: self newObj barExtent isPoint
]

{ #category : #test }
ImageEditorHScrollbarTest >> testBarPosition [
	self assert: self newObj barPosition isPoint
]

{ #category : #test }
ImageEditorHScrollbarTest >> testButtonExtent [
	self assert: self newObj buttonExtent isPoint
]

{ #category : #test }
ImageEditorHScrollbarTest >> testDefaultExtent [
	self assert: self newObj defaultExtent isPoint
]

{ #category : #test }
ImageEditorHScrollbarTest >> testDefaultPosition [
	self assert: self newObj defaultPosition isPoint
]

{ #category : #test }
ImageEditorHScrollbarTest >> testLeftButtonPosition [
	self assert: self newObj leftButtonPosition isPoint
]

{ #category : #test }
ImageEditorHScrollbarTest >> testRightButtonPosition [
	self assert: self newObj rightButtonPosition isPoint
]

{ #category : #test }
ImageEditorHScrollbarTest >> testUpdateBar [
	| obj |
	obj := self newObj.
	self assert: obj knobLength isNil.
	obj
		extent: 114 @ 10;
		position: -5 @ -1.
	obj updateBar: { 200. 0. 10 }.
	self assert: obj knobPosition equals: 1 @ 1.
	self assert: obj knobLength equals: 5.
	obj updateBar: { 180. 100. 20 }.
	self assert: obj knobPosition equals: 51 @ 1.
	self assert: obj knobLength equals: 11
]
