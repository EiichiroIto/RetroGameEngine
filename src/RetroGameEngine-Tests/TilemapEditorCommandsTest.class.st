"
A TilemapEditorCommandsTest is a test class for testing the behavior of TilemapEditorCommands
"
Class {
	#name : #TilemapEditorCommandsTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
TilemapEditorCommandsTest >> newObj [
	^ TilemapEditorCommands new
		init: TilemapEditor new;
		yourself
]

{ #category : #test }
TilemapEditorCommandsTest >> testCommandExtent [
	self assert: self newObj commandExtent isPoint
]

{ #category : #test }
TilemapEditorCommandsTest >> testCommandNoAt [
	| obj |
	obj := self newObj.
	self assert: (obj commandNoAt: 226 @ 11) equals: 1.
	self assert: (obj commandNoAt: -1 @ -1) isNil
]

{ #category : #test }
TilemapEditorCommandsTest >> testCommandPositionAt [
	| obj |
	obj := self newObj.
	self assert: (obj commandPositionAt: 1) equals: 226 @ 11
]

{ #category : #test }
TilemapEditorCommandsTest >> testCommands [
	self assert: self newObj class commands isArray.
	self assert: self newObj class commands notEmpty
]

{ #category : #test }
TilemapEditorCommandsTest >> testDefaultPosition [
	self assert: self newObj defaultPosition isPoint
]

{ #category : #test }
TilemapEditorCommandsTest >> testExtent [
	self assert: self newObj extent isPoint
]
