"
An ImageEditorPaletteTest is a test class for testing the behavior of ImageEditorPalette
"
Class {
	#name : #ImageEditorPaletteTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
ImageEditorPaletteTest >> newObj [
	^ ImageEditorPalette new
		init: ImageEditor new;
		yourself
]

{ #category : #test }
ImageEditorPaletteTest >> testColorExtent [
	self assert: self newObj colorExtent isPoint
]

{ #category : #test }
ImageEditorPaletteTest >> testColorNo [
	| obj |
	obj := self newObj.
	self assert: obj colorNo equals: 0.
	obj colorNo: 1.
	self assert: obj colorNo equals: 1
]

{ #category : #test }
ImageEditorPaletteTest >> testColorPositionAt [
	self assert: (self newObj colorPositionAt: 0) isPoint.
	self assert: (self newObj colorPositionAt: 5) isPoint
]

{ #category : #test }
ImageEditorPaletteTest >> testDefaultPosition [
	self assert: self newObj defaultPosition isPoint
]

{ #category : #test }
ImageEditorPaletteTest >> testExtent [
	self assert: self newObj extent isPoint
]
