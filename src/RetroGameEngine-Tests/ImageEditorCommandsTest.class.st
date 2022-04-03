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
ImageEditorCommandsTest >> testCopyCommand [
	self assert: self newObj class copyCommand equals: 8
]

{ #category : #test }
ImageEditorCommandsTest >> testCutCommand [
	self assert: self newObj class cutCommand equals: 7
]

{ #category : #test }
ImageEditorCommandsTest >> testDefaultPosition [
	self assert: self newObj defaultPosition isPoint
]

{ #category : #test }
ImageEditorCommandsTest >> testExtent [
	self assert: self newObj extent isPoint
]

{ #category : #test }
ImageEditorCommandsTest >> testLoadCommand [
	self assert: self newObj class loadCommand equals: 2
]

{ #category : #test }
ImageEditorCommandsTest >> testLoadItemCommand [
	self assert: self newObj class loadItemCommand equals: 5
]

{ #category : #test }
ImageEditorCommandsTest >> testNewCommand [
	self assert: self newObj class newCommand equals: 1
]

{ #category : #test }
ImageEditorCommandsTest >> testNewItemCommand [
	self assert: self newObj class newItemCommand equals: 4
]

{ #category : #test }
ImageEditorCommandsTest >> testPasteBuffer [
	| obj |
	obj := self newObj.
	self assert: obj pasteBuffer isNil.
	obj pasteBuffer: #(1 2).
	self assertCollection: obj pasteBuffer equals: #(1 2)
]

{ #category : #test }
ImageEditorCommandsTest >> testPasteCommand [
	self assert: self newObj class pasteCommand equals: 9
]

{ #category : #test }
ImageEditorCommandsTest >> testSaveCommand [
	self assert: self newObj class saveCommand equals: 3
]

{ #category : #test }
ImageEditorCommandsTest >> testSaveItemCommand [
	self assert: self newObj class saveItemCommand equals: 6
]
