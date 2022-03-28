"
An ImageEditorListDialogTest is a test class for testing the behavior of ImageEditorListDialog
"
Class {
	#name : #ImageEditorListDialogTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
ImageEditorListDialogTest >> newObj [
	^ ImageEditorListDialog new
		init: ImageEditor new;
		yourself
]

{ #category : #test }
ImageEditorListDialogTest >> testDefaultExtent [
	self assert: self newObj defaultExtent isPoint
]

{ #category : #test }
ImageEditorListDialogTest >> testDefaultPosition [
	self assert: self newObj defaultPosition isPoint
]

{ #category : #test }
ImageEditorListDialogTest >> testList [
	| obj a |
	obj := self newObj.
	self assert: obj list isNil.
	a := #(a b c).
	obj list: a.
	self assert: obj list identicalTo: a
]

{ #category : #test }
ImageEditorListDialogTest >> testTopIndex [
	| obj |
	obj := self newObj.
	self assert: obj topIndex equals: 1.
	obj topIndex: 123.
	self assert: obj topIndex equals: 123
]
