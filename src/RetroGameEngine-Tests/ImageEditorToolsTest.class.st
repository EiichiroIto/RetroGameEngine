"
An ImageEditorToolsTest is a test class for testing the behavior of ImageEditorTools
"
Class {
	#name : #ImageEditorToolsTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
ImageEditorToolsTest >> newObj [
	^ ImageEditorTools new
		init: ImageEditor new;
		yourself
]

{ #category : #test }
ImageEditorToolsTest >> testDefaultPosition [
	self assert: self newObj defaultPosition isPoint
]

{ #category : #test }
ImageEditorToolsTest >> testEllipseFrameTool [
	self assert: ImageEditorTools ellipseFrameTool equals: 4
]

{ #category : #test }
ImageEditorToolsTest >> testEllipseTool [
	self assert: ImageEditorTools ellipseTool equals: 5
]

{ #category : #test }
ImageEditorToolsTest >> testExtent [
	self assert: self newObj extent isPoint
]

{ #category : #test }
ImageEditorToolsTest >> testFillTool [
	self assert: ImageEditorTools fillTool equals: 6
]

{ #category : #test }
ImageEditorToolsTest >> testPenTool [
	self assert: ImageEditorTools penTool equals: 1
]

{ #category : #test }
ImageEditorToolsTest >> testRectFrameTool [
	self assert: ImageEditorTools rectFrameTool equals: 2
]

{ #category : #test }
ImageEditorToolsTest >> testRectTool [
	self assert: ImageEditorTools rectTool equals: 3
]

{ #category : #test }
ImageEditorToolsTest >> testSelectTool [
	self assert: ImageEditorTools selectTool equals: 0
]

{ #category : #test }
ImageEditorToolsTest >> testToolExtent [
	self assert: self newObj toolExtent isPoint
]

{ #category : #test }
ImageEditorToolsTest >> testToolNo [
	| obj |
	obj := self newObj.
	self assert: obj toolNo equals: 0.
	obj toolNo: 3.
	self assert: obj toolNo equals: 3
]

{ #category : #test }
ImageEditorToolsTest >> testToolPositionAt [
	self assert: (self newObj toolPositionAt: 0) isPoint.
	self assert: (self newObj toolPositionAt: 5) isPoint
]
