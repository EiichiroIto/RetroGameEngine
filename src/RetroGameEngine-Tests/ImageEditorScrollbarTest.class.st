"
An ImageEditorScrollbarTest is a test class for testing the behavior of ImageEditorScrollbar
"
Class {
	#name : #ImageEditorScrollbarTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
ImageEditorScrollbarTest >> newObj [
	^ ImageEditorScrollbar new
		init: ImageEditor new;
		yourself
]

{ #category : #test }
ImageEditorScrollbarTest >> testKnobLength [
	| obj |
	obj := self newObj.
	self assert: obj knobLength isNil.
	obj knobLength: 123.
	self assert: obj knobLength equals: 123
]

{ #category : #test }
ImageEditorScrollbarTest >> testKnobPosition [
	| obj |
	obj := self newObj.
	self assert: obj knobPosition isNil.
	obj knobPosition: 1 @ 2.
	self assert: obj knobPosition equals: 1 @ 2
]

{ #category : #test }
ImageEditorScrollbarTest >> testWhenBarClicked [
	| obj block |
	obj := self newObj.
	self assert: obj whenBarClicked isNil.
	block := [ 1 + 2 ].
	obj whenBarClicked: block.
	self assert: obj whenBarClicked identicalTo: block
]

{ #category : #test }
ImageEditorScrollbarTest >> testWhenButtonClicked [
	| obj block |
	obj := self newObj.
	self assert: obj whenButtonClicked isNil.
	block := [ 1 + 2 ].
	obj whenButtonClicked: block.
	self assert: obj whenButtonClicked identicalTo: block
]
