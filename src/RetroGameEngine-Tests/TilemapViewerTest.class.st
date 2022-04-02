"
A TilemapViewerTest is a test class for testing the behavior of TilemapViewer
"
Class {
	#name : #TilemapViewerTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
TilemapViewerTest >> newApp [
	^ TilemapEditor new
		engine: RetroGameEngine new;
		init;
		yourself
]

{ #category : #private }
TilemapViewerTest >> newObj [
	^ TilemapViewer new
		init: TilemapEditor new;
		yourself
]

{ #category : #private }
TilemapViewerTest >> newObjWithEngine [
	^ TilemapViewer new
		init: self newApp;
		yourself
]

{ #category : #test }
TilemapViewerTest >> testDefaultPosition [
	self assert: self newObj defaultPosition isPoint
]

{ #category : #test }
TilemapViewerTest >> testExtent [
	self assert: self newObj extent isPoint
]

{ #category : #test }
TilemapViewerTest >> testHScroll [
	| obj r |
	obj := self newObjWithEngine.
	r := obj hScroll: 1.
	self assert: r isArray.
	self assert: r first equals: 240.
	self assert: r second equals: 1.
	self assert: r third equals: 16.
	r := obj hScroll: -1.
	self assert: r isArray.
	self assert: r first equals: 240.
	self assert: r second equals: 0.
	self assert: r third equals: 16
]

{ #category : #test }
TilemapViewerTest >> testHScrollBarIn [
	| obj r |
	obj := self newObjWithEngine.
	r := obj hScrollBar: 0 in: 100.
	self assert: r isArray.
	self assert: r first equals: 240.
	self assert: r second equals: 0.
	self assert: r third equals: 16.
	r := obj hScrollBar: 50 in: 100.
	self assert: r isArray.
	self assert: r first equals: 240.
	self assert: r second equals: 120.
	self assert: r third equals: 16.
	r := obj hScrollBar: 100 in: 100.
	self assert: r isArray.
	self assert: r first equals: 240.
	self assert: r second equals: 240.
	self assert: r third equals: 16
]

{ #category : #test }
TilemapViewerTest >> testTileExtent [
	self assert: self newObj tileExtent isPoint
]

{ #category : #test }
TilemapViewerTest >> testTilemapExtent [
	self assert: self newObj tilemapExtent isPoint
]

{ #category : #test }
TilemapViewerTest >> testTilemapOffset [
	| obj |
	obj := self newObj.
	self assert: obj tilemapOffset equals: 0 @ 0.
	obj tilemapOffset: 1 @ 2.
	self assert: obj tilemapOffset equals: 1 @ 2
]

{ #category : #test }
TilemapViewerTest >> testVScroll [
	| obj r |
	obj := self newObjWithEngine.
	r := obj vScroll: 1.
	self assert: r isArray.
	self assert: r first equals: 240.
	self assert: r second equals: 1.
	self assert: r third equals: 16.
	r := obj vScroll: -1.
	self assert: r isArray.
	self assert: r first equals: 240.
	self assert: r second equals: 0.
	self assert: r third equals: 16
]

{ #category : #test }
TilemapViewerTest >> testVScrollBarIn [
	| obj r |
	obj := self newObjWithEngine.
	r := obj vScrollBar: 0 in: 100.
	self assert: r isArray.
	self assert: r first equals: 240.
	self assert: r second equals: 0.
	self assert: r third equals: 16.
	r := obj vScrollBar: 50 in: 100.
	self assert: r isArray.
	self assert: r first equals: 240.
	self assert: r second equals: 120.
	self assert: r third equals: 16.
	r := obj vScrollBar: 100 in: 100.
	self assert: r isArray.
	self assert: r first equals: 240.
	self assert: r second equals: 240.
	self assert: r third equals: 16
]
