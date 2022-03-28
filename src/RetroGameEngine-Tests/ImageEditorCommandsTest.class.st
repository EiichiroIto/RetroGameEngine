"
An ImageEditorCommandsTest is a test class for testing the behavior of ImageEditorCommands
"
Class {
	#name : #ImageEditorCommandsTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
ImageEditorCommandsTest >> newObj [
	^ ImageEditorCommands new
		init: ImageEditor new;
		yourself
]

{ #category : #test }
ImageEditorCommandsTest >> testCommandExtent [
	self assert: self newObj commandExtent isPoint
]

{ #category : #test }
ImageEditorCommandsTest >> testCommandNoAt [
	| obj |
	obj := self newObj.
	self assert: (obj commandNoAt: -1 @ -1) isNil.
	self assert: (obj commandNoAt: obj position + 1) equals: 1
]

{ #category : #test }
ImageEditorCommandsTest >> testCommandPositionAt [
	| obj |
	obj := self newObj.
	self assert: (obj commandPositionAt: 1) isPoint.
	self assert: (obj commandPositionAt: 2) isPoint
]

{ #category : #test }
ImageEditorCommandsTest >> testCommands [
	self assert: self newObj class commands isArray.
	self assert: self newObj class commands size equals: 9
]

{ #category : #test }
ImageEditorCommandsTest >> testDefaultExtent [
	self assert: self newObj defaultExtent isPoint
]

{ #category : #test }
ImageEditorCommandsTest >> testDefaultPosition [
	self assert: self newObj defaultPosition isPoint
]

{ #category : #test }
ImageEditorCommandsTest >> testPasteBuffer [
	| obj |
	obj := self newObj.
	self assert: obj pasteBuffer isNil.
	obj pasteBuffer: #(1 2).
	self assertCollection: obj pasteBuffer equals: #(1 2)
]
