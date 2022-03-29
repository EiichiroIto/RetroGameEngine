"
An ImageEditorDialogTest is a test class for testing the behavior of ImageEditorDialog
"
Class {
	#name : #ImageEditorDialogTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
ImageEditorDialogTest >> newObj [
	^ ImageEditorDialog new
]

{ #category : #test }
ImageEditorDialogTest >> testExtent [
	| obj |
	obj := self newObj.
	self assert: obj extent isNil.
	obj extent: 1 @ 2.
	self assert: obj extent equals: 1 @ 2
]

{ #category : #test }
ImageEditorDialogTest >> testInit [
	| obj |
	obj := self newObj.
	self assert: obj extent isNil
]

{ #category : #test }
ImageEditorDialogTest >> testMessagePosition [
	| obj |
	obj := self newObj.
	obj position: 0 @ 0.
	self assert: obj messagePosition isPoint
]

{ #category : #test }
ImageEditorDialogTest >> testPendingAction [
	| obj block |
	obj := self newObj.
	self assert: obj pendingAction isNil.
	block := [ 1 + 2 ].
	obj pendingAction: block.
	self assert: obj pendingAction identicalTo: block
]
