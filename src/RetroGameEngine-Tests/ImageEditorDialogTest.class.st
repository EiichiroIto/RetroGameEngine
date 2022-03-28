"
An ImageEditorDialogTest is a test class for testing the behavior of ImageEditorDialog
"
Class {
	#name : #ImageEditorDialogTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #'instance creation' }
ImageEditorDialogTest >> newObj [
	^ ImageEditorDialog new
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
