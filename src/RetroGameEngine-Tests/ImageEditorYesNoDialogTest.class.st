"
An ImageEditorYesNoDialogTest is a test class for testing the behavior of ImageEditorYesNoDialog
"
Class {
	#name : #ImageEditorYesNoDialogTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
ImageEditorYesNoDialogTest >> newObj [
	^ ImageEditorYesNoDialog new
		init: ImageEditor new;
		yourself
]

{ #category : #test }
ImageEditorYesNoDialogTest >> testDefaultExtent [
	self assert: self newObj defaultExtent isPoint
]

{ #category : #test }
ImageEditorYesNoDialogTest >> testDefaultPosition [
	self assert: self newObj defaultPosition isPoint
]

{ #category : #test }
ImageEditorYesNoDialogTest >> testItemExtent [
	self assert: self newObj itemExtent isPoint
]

{ #category : #test }
ImageEditorYesNoDialogTest >> testMessage [
	| obj |
	obj := self newObj.
	self assert: obj message isNil.
	obj message: 'abc'.
	self assert: obj message equals: 'abc'
]

{ #category : #test }
ImageEditorYesNoDialogTest >> testMessageHeight [
	| obj |
	obj := self newObj.
	obj position: 0 @ 0.
	obj message: 'abc'.
	self assert: obj messageHeight equals: 14.
	obj message: 'abc
def'.
	self assert: obj messageHeight equals: 20
]

{ #category : #test }
ImageEditorYesNoDialogTest >> testMessageWidth [
	| obj |
	obj := self newObj.
	obj position: 0 @ 0.
	obj message: 'abc'.
	self assert: obj messageWidth equals: 20.
	obj message: 'abc
defg'.
	self assert: obj messageWidth equals: 24
]

{ #category : #test }
ImageEditorYesNoDialogTest >> testNoPosition [
	| obj |
	obj := self newObj.
	obj position: 0 @ 0.
	obj message: 'abc'.
	self assert: obj noPosition isPoint
]

{ #category : #test }
ImageEditorYesNoDialogTest >> testYesPosition [
	| obj |
	obj := self newObj.
	obj position: 0 @ 0.
	obj message: 'abc'.
	self assert: obj yesPosition isPoint
]
