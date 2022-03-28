"
An ImageEditorPainterTest is a test class for testing the behavior of ImageEditorPainter
"
Class {
	#name : #ImageEditorPainterTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
ImageEditorPainterTest >> newApp [
	^ ImageEditor new
]

{ #category : #private }
ImageEditorPainterTest >> newObj [
	^ ImageEditorPainter new
]

{ #category : #test }
ImageEditorPainterTest >> testClearDragging [
	| obj |
	obj := self newObj.
	obj dragStart: 1 @ 2.
	obj dragEnd: 3 @ 4.
	self assert: obj dragStart equals: 1 @ 2.
	self assert: obj dragEnd equals: 3 @ 4.
	obj clearDragging.
	self assert: obj dragStart isNil.
	self assert: obj dragEnd isNil
]

{ #category : #test }
ImageEditorPainterTest >> testClearSelection [
	| obj |
	obj := self newObj.
	obj selection: (1 @ 2 extent: 3 @ 4).
	self assert: obj selection equals: (1 @ 2 corner: 4 @ 6).
	obj clearSelection.
	self assert: obj selection isNil
]

{ #category : #test }
ImageEditorPainterTest >> testCursorExtent [
	self assert: self newObj cursorExtent isPoint
]

{ #category : #test }
ImageEditorPainterTest >> testDefaultExtent [
	self assert: self newObj defaultExtent isPoint
]

{ #category : #test }
ImageEditorPainterTest >> testDefaultPosition [
	self assert: self newObj defaultPosition isPoint
]

{ #category : #test }
ImageEditorPainterTest >> testDragEnd [
	| obj |
	obj := self newObj.
	self assert: obj dragEnd isNil.
	obj dragEnd: 1 @ 2.
	self assert: obj dragEnd equals: 1 @ 2
]

{ #category : #test }
ImageEditorPainterTest >> testDragStart [
	| obj |
	obj := self newObj.
	self assert: obj dragStart isNil.
	obj dragStart: 1 @ 2.
	self assert: obj dragStart equals: 1 @ 2
]

{ #category : #test }
ImageEditorPainterTest >> testInit [
	| obj |
	obj := self newObj.
	obj init: self newApp.
	self assert: obj position equals: obj defaultPosition.
	self assert: obj extent equals: obj defaultExtent
]

{ #category : #test }
ImageEditorPainterTest >> testIsValidDragging [
	| obj |
	obj := self newObj.
	self deny: obj isValidDragging.
	obj dragStart: 1 @ 2.
	obj dragEnd: 3 @ 4.
	self assert: obj isValidDragging.
	obj dragStart: 4 @ 2.
	obj dragEnd: 3 @ 4.
	self deny: obj isValidDragging.
	obj dragStart: 1 @ 5.
	obj dragEnd: 3 @ 4.
	self deny: obj isValidDragging
]

{ #category : #test }
ImageEditorPainterTest >> testPixelExtent [
	self assert: self newObj pixelExtent isPoint
]

{ #category : #test }
ImageEditorPainterTest >> testPixelPointOf [
	| obj r |
	obj := self newObj.
	obj position: 0 @ 0.
	r := obj pixelPointOf: 0 @ 0.
	self assert: r equals: 0 @ 0.
	r := obj pixelPointOf: 16 @ 32.
	self assert: r equals: 2 @ 5.
	r := obj pixelPointOf: 100 @ 100.
	self assert: r isNil
]

{ #category : #test }
ImageEditorPainterTest >> testPixelPositionAt [
	| obj r |
	obj := self newObj.
	obj position: 0 @ 0.
	r := obj pixelPositionAt: 0 @ 0.
	self assert: r equals: 0 @ 0.
	r := obj pixelPositionAt: 1 @ 2.
	self assert: r equals: 6 @ 12
]

{ #category : #test }
ImageEditorPainterTest >> testSelect [
	| obj |
	obj := self newObj.
	obj dragStart: 1 @ 2.
	obj dragEnd: 3 @ 4.
	self assert: obj selection isNil.
	obj select.
	self assert: obj selection topLeft equals: 1 @ 2.
	self assert: obj selection bottomRight equals: 3 @ 4
]

{ #category : #test }
ImageEditorPainterTest >> testSelection [
	| obj |
	obj := self newObj.
	self assert: obj selection isNil.
	obj selection: (1 @ 2 corner: 3 @ 4).
	self assert: obj selection topLeft equals: 1 @ 2.
	self assert: obj selection bottomRight equals: 3 @ 4
]
