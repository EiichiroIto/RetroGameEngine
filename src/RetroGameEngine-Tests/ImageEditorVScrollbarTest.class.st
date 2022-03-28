"
An ImageEditorVScrollbarTest is a test class for testing the behavior of ImageEditorVScrollbar
"
Class {
	#name : #ImageEditorVScrollbarTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
ImageEditorVScrollbarTest >> newObj [
	^ ImageEditorVScrollbar new
		init: ImageEditor new;
		yourself
]

{ #category : #test }
ImageEditorVScrollbarTest >> testBarExtent [
	| obj |
	obj := self newObj.
	obj extent: 64 @ 96.
	self assert: obj barExtent equals: 3 @ 86
]

{ #category : #test }
ImageEditorVScrollbarTest >> testBarPosition [
	| obj |
	obj := self newObj.
	obj position: 185 @ 10.
	self assert: obj barPosition equals: 186 @ 15
]

{ #category : #test }
ImageEditorVScrollbarTest >> testButtonExtent [
	self assert: self newObj buttonExtent isPoint
]

{ #category : #test }
ImageEditorVScrollbarTest >> testDefaultExtent [
	self assert: self newObj defaultExtent isPoint
]

{ #category : #test }
ImageEditorVScrollbarTest >> testDownButtonPosition [
	| obj |
	obj := self newObj.
	obj position: 185 @ 10;
		extent: 5 @ 96.
	self assert: obj downButtonPosition equals: 185 @ 101
]

{ #category : #test }
ImageEditorVScrollbarTest >> testUpButtonPosition [
	| obj |
	obj := self newObj.
	obj position: 185 @ 10;
		extent: 64 @ 96.
	self assert: obj upButtonPosition equals: 185 @ 10
]

{ #category : #test }
ImageEditorVScrollbarTest >> testUpdateBar [
	| obj |
	obj := self newObj.
	obj position: 185 @ 10;
		extent: 5 @ 96.
	obj updateBar: #(160 120 96).
	"len = 82"
	self assert: obj knobPosition equals: 187 @ 56.
	self assert: obj knobLength equals: 32.
	obj updateBar: #(160 160 96).
	"len = 82"
	self assert: obj knobPosition equals: 187 @ 69.
	self assert: obj knobLength equals: 32
]
