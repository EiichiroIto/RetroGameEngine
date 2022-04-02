"
An ImageEditorViewerTest is a test class for testing the behavior of ImageEditorViewer
"
Class {
	#name : #ImageEditorViewerTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
ImageEditorViewerTest >> newApp [
	^ ImageEditor new
		engine: RetroGameEngine new;
		init;
		yourself
]

{ #category : #private }
ImageEditorViewerTest >> newObj [
	^ ImageEditorViewer new
		init: ImageEditor new;
		yourself
]

{ #category : #private }
ImageEditorViewerTest >> newObjWithEngine [
	^ ImageEditorViewer new
		init: self newApp;
		yourself
]

{ #category : #test }
ImageEditorViewerTest >> testCursorExtent [
	| obj |
	obj := self newObj.
	self assert: obj cursorExtent isPoint.
	obj cursorExtent: 1 @ 3.
	self assert: obj cursorExtent equals: 1 @ 3
]

{ #category : #test }
ImageEditorViewerTest >> testCursorPosition [
	| obj |
	obj := self newObj.
	self assert: obj cursorPosition equals: 0 @ 0.
	obj cursorPosition: 1 @ 2.
	self assert: obj cursorPosition equals: 1 @ 2
]

{ #category : #test }
ImageEditorViewerTest >> testDefaultPosition [
	self assert: self newObj defaultPosition isPoint
]

{ #category : #test }
ImageEditorViewerTest >> testExtent [
	self assert: self newObj extent isPoint
]

{ #category : #test }
ImageEditorViewerTest >> testHScroll [
	| obj r |
	obj := self newObjWithEngine.
	obj imageOffset: 10 @ 20.
	r := obj hScroll: -1.
	self assert: obj imageOffset equals: 9 @ 20.
	self assert: r isArray.
	self assert: r size equals: 3.
	self assert: r first equals: 256 - 64.
	self assert: r second equals: 9.
	self assert: r third equals: 64.
	obj imageOffset: 1 @ 20.
	r := obj hScroll: -2.
	self assert: obj imageOffset equals: 0 @ 20.
	self assert: r isArray.
	self assert: r size equals: 3.
	self assert: r first equals: 256 - 64.
	self assert: r second equals: 0.
	self assert: r third equals: 64.
	obj imageOffset: 190 @ 20.
	r := obj hScroll: 10.
	self assert: obj imageOffset equals: 192 @ 20.
	self assert: r isArray.
	self assert: r size equals: 3.
	self assert: r first equals: 256 - 64.
	self assert: r second equals: 192.
	self assert: r third equals: 64
]

{ #category : #test }
ImageEditorViewerTest >> testHScrollBarIn [
	| obj r |
	obj := self newObjWithEngine.
	obj imageOffset: 10 @ 20.
	r := obj hScrollBar: 0 in: 100.
	self assert: obj imageOffset equals: 0 @ 20.
	self assert: r isArray.
	self assert: r size equals: 3.
	self assert: r first equals: 256 - 64.
	self assert: r second equals: 0.
	self assert: r third equals: 64.
	r := obj hScrollBar: 100 in: 100.
	self assert: obj imageOffset equals: 192 @ 20.
	self assert: r isArray.
	self assert: r size equals: 3.
	self assert: r first equals: 256 - 64.
	self assert: r second equals: 192.
	self assert: r third equals: 64
]

{ #category : #test }
ImageEditorViewerTest >> testImageOffset [
	| obj |
	obj := self newObj.
	self assert: obj imageOffset equals: 0 @ 0.
	obj imageOffset: 1 @ 2.
	self assert: obj imageOffset equals: 1 @ 2
]

{ #category : #test }
ImageEditorViewerTest >> testImagePosition [
	| obj |
	obj := self newObj.
	obj imageOffset: 1 @ 2.
	obj cursorPosition: 3 @ 4.
	self assert: obj imagePosition equals: 4 @ 6
]

{ #category : #test }
ImageEditorViewerTest >> testVScroll [
	| obj r |
	obj := self newObjWithEngine.
	obj imageOffset: 10 @ 20.
	r := obj vScroll: -1.
	self assert: obj imageOffset equals: 10 @ 19.
	self assert: r isArray.
	self assert: r size equals: 3.
	self assert: r first equals: 256 - 96.
	self assert: r second equals: 19.
	self assert: r third equals: 96.
	obj imageOffset: 10 @ 1.
	r := obj vScroll: -2.
	self assert: obj imageOffset equals: 10 @ 0.
	self assert: r isArray.
	self assert: r size equals: 3.
	self assert: r first equals: 256 - 96.
	self assert: r second equals: 0.
	self assert: r third equals: 96.
	obj imageOffset: 20 @ 162.
	r := obj vScroll: 10.
	self assert: obj imageOffset equals: 20 @ 160.
	self assert: r isArray.
	self assert: r size equals: 3.
	self assert: r first equals: 256 - 96.
	self assert: r second equals: 160.
	self assert: r third equals: 96
]

{ #category : #test }
ImageEditorViewerTest >> testVScrollBarIn [
	| obj r |
	obj := self newObjWithEngine.
	obj imageOffset: 10 @ 20.
	r := obj vScrollBar: 0 in: 100.
	self assert: obj imageOffset equals: 10 @ 0.
	self assert: r isArray.
	self assert: r size equals: 3.
	self assert: r first equals: 256 - 96.
	self assert: r second equals: 0.
	self assert: r third equals: 96.
	r := obj vScrollBar: 100 in: 100.
	self assert: obj imageOffset equals: 10 @ 160.
	self assert: r isArray.
	self assert: r size equals: 3.
	self assert: r first equals: 256 - 96.
	self assert: r second equals: 160.
	self assert: r third equals: 96
]
