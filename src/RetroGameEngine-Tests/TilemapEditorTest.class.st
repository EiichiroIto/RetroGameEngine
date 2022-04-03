"
A TilemapEditorTest is a test class for testing the behavior of TilemapEditor
"
Class {
	#name : #TilemapEditorTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
TilemapEditorTest >> newApp [
	^ TilemapEditor new
		engine: RetroGameEngine new;
		yourself
]

{ #category : #test }
TilemapEditorTest >> testCommandsIndex [
	self assert: self newApp class commandsIndex equals: 9
]

{ #category : #test }
TilemapEditorTest >> testCurrentImage [
	| app |
	app := self newApp.
	self should: [ app currentImage ] raise: Error.
	app init.
	app imageSelector imageNo: 1.
	self assert: app currentImage identicalTo: app images second
]

{ #category : #test }
TilemapEditorTest >> testCurrentTile [
	| app |
	app := self newApp.
	self should: [ app currentImage ] raise: Error.
	app init.
	self assert: app currentTile equals: 0 @ 0
]

{ #category : #test }
TilemapEditorTest >> testCurrentTilemap [
	| app |
	app := self newApp.
	self should: [ app currentImage ] raise: Error.
	app init.
	app tilemapSelector tilemapNo: 1.
	self assert: app currentTilemap identicalTo: app tilemaps second
]

{ #category : #test }
TilemapEditorTest >> testImageAt [
	| app |
	app := self newApp.
	app init.
	self assert: (app imageAt: 0) identicalTo: app images first.
	self assert: (app imageAt: 1) identicalTo: app images second.
	self assert: (app imageAt: 2) identicalTo: app images third.
	self should: [ app imageAt: 3 ] raise: Error
]

{ #category : #test }
TilemapEditorTest >> testImageHScrollbar [
	| app |
	app := self newApp.
	self should: [ app imageHScrollbar ] raise: Error.
	app init.
	self assert: (app imageHScrollbar isKindOf: ImageEditorHScrollbar)
]

{ #category : #test }
TilemapEditorTest >> testImageHScrollbarIndex [
	self assert: self newApp class imageHScrollbarIndex equals: 7
]

{ #category : #test }
TilemapEditorTest >> testImageNo [
	| app |
	app := self newApp.
	self should: [ app imageNo ] raise: Error.
	app init.
	app imageSelector imageNo: 1.
	self assert: app imageNo equals: 1.
	app imageSelector imageNo: 2.
	self assert: app imageNo equals: 2
]

{ #category : #test }
TilemapEditorTest >> testImageSelector [
	| app |
	app := self newApp.
	self should: [ app imageSelector ] raise: Error.
	app init.
	self assert: (app imageSelector isKindOf: ImageEditorSelector)
]

{ #category : #test }
TilemapEditorTest >> testImageSelectorIndex [
	self assert: self newApp class imageSelectorIndex equals: 4
]

{ #category : #test }
TilemapEditorTest >> testImageVScrollbar [
	| app |
	app := self newApp.
	self should: [ app imageVScrollbar ] raise: Error.
	app init.
	self assert: (app imageVScrollbar isKindOf: ImageEditorVScrollbar)
]

{ #category : #test }
TilemapEditorTest >> testImageVScrollbarIndex [
	self assert: self newApp class imageVScrollbarIndex equals: 8
]

{ #category : #test }
TilemapEditorTest >> testImageViewer [
	| app |
	app := self newApp.
	self should: [ app imageViewer ] raise: Error.
	app init.
	self assert: (app imageViewer isKindOf: ImageEditorViewer)
]

{ #category : #test }
TilemapEditorTest >> testImageViewerIndex [
	self assert: self newApp class imageViewerIndex equals: 3
]

{ #category : #test }
TilemapEditorTest >> testImages [
	| app a |
	app := self newApp.
	self assert: app images isNil.
	a := #(1 2 3).
	app images: a.
	self assert: app images identicalTo: a
]

{ #category : #test }
TilemapEditorTest >> testMethodSelectorFor [
	| app |
	app := self newApp.
	self assert: (app methodSelectorFor: 0) equals: #tilemap0.
	self assert: (app methodSelectorFor: 1) equals: #tilemap1.
	self assert: (app methodSelectorFor: 2) equals: #tilemap2.
	self assert: (app methodSelectorFor: 3) equals: #tilemap3.
	self assert: (app methodSelectorFor: 4) equals: #tilemap4.
	self assert: (app methodSelectorFor: 5) equals: #tilemap5.
	self assert: (app methodSelectorFor: 6) equals: #tilemap6.
	self assert: (app methodSelectorFor: 7) equals: #tilemap7
]

{ #category : #test }
TilemapEditorTest >> testNewCommands [
	| app |
	app := self newApp.
	self assert: (app newCommands isKindOf: TilemapEditorCommands)
]

{ #category : #test }
TilemapEditorTest >> testNewHScrollbar [
	| app |
	app := self newApp.
	self assert: (app newHScrollbar isKindOf: ImageEditorHScrollbar)
]

{ #category : #test }
TilemapEditorTest >> testNewImage [
	| app |
	app := self newApp.
	self assert: (app newImage isKindOf: RetroGameImage)
]

{ #category : #test }
TilemapEditorTest >> testNewImageSelector [
	| app |
	app := self newApp.
	self assert: (app newImageSelector isKindOf: ImageEditorSelector)
]

{ #category : #test }
TilemapEditorTest >> testNewImageViewer [
	| app |
	app := self newApp.
	self assert: (app newImageViewer isKindOf: ImageEditorViewer)
]

{ #category : #test }
TilemapEditorTest >> testNewTilemap [
	| app |
	app := self newApp.
	self assert: (app newTilemap isKindOf: RetroGameTilemap)
]

{ #category : #test }
TilemapEditorTest >> testNewTilemapSelector [
	| app |
	app := self newApp.
	self assert: (app newTilemapSelector isKindOf: TilemapSelector)
]

{ #category : #test }
TilemapEditorTest >> testNewTilemapViewer [
	| app |
	app := self newApp.
	self assert: (app newTilemapViewer isKindOf: TilemapViewer)
]

{ #category : #test }
TilemapEditorTest >> testNewVScrollbar [
	| app |
	app := self newApp.
	self assert: (app newVScrollbar isKindOf: ImageEditorVScrollbar)
]

{ #category : #test }
TilemapEditorTest >> testNumImages [
	| app |
	app := self newApp.
	self assert: app numImages equals: 3
]

{ #category : #test }
TilemapEditorTest >> testNumTilemaps [
	| app |
	app := self newApp.
	self assert: app numTilemaps equals: 8
]

{ #category : #test }
TilemapEditorTest >> testSetImageNoOfTilemap [
	| app |
	app := self newApp.
	app init.
	app imageSelector imageNo: 1.
	app tilemapSelector tilemapNo: 2.
	self assert: (app tilemapAt: 2) imageNo equals: 0.
	app setImageNoOfTilemap.
	self assert: (app tilemapAt: 2) imageNo equals: 1
]

{ #category : #test }
TilemapEditorTest >> testTilemapAt [
	| app |
	app := self newApp.
	app init.
	self assert: (app tilemapAt: 0) identicalTo: app tilemaps first.
	self assert: (app tilemapAt: 1) identicalTo: app tilemaps second.
	self assert: (app tilemapAt: 7) identicalTo: app tilemaps last.
	self should: [ app tilemapAt: 8 ] raise: Error
]

{ #category : #test }
TilemapEditorTest >> testTilemapHScrollbar [
	| app |
	app := self newApp.
	self should: [ app tilemapHScrollbar ] raise: Error.
	app init.
	self assert: (app tilemapHScrollbar isKindOf: ImageEditorHScrollbar)
]

{ #category : #test }
TilemapEditorTest >> testTilemapHScrollbarIndex [
	self assert: self newApp class tilemapHScrollbarIndex equals: 5
]

{ #category : #test }
TilemapEditorTest >> testTilemapNo [
	| app |
	app := self newApp.
	self should: [ app tilemapNo ] raise: Error.
	app init.
	app tilemapSelector tilemapNo: 1.
	self assert: app tilemapNo equals: 1.
	app tilemapSelector tilemapNo: 2.
	self assert: app tilemapNo equals: 2
]

{ #category : #test }
TilemapEditorTest >> testTilemapSelector [
	| app |
	app := self newApp.
	self should: [ app tilemapSelector ] raise: Error.
	app init.
	self assert: (app tilemapSelector isKindOf: TilemapSelector)
]

{ #category : #test }
TilemapEditorTest >> testTilemapSelectorIndex [
	self assert: self newApp class tilemapSelectorIndex equals: 2
]

{ #category : #test }
TilemapEditorTest >> testTilemapVScrollbar [
	| app |
	app := self newApp.
	self should: [ app tilemapVScrollbar ] raise: Error.
	app init.
	self assert: (app tilemapVScrollbar isKindOf: ImageEditorVScrollbar)
]

{ #category : #test }
TilemapEditorTest >> testTilemapVScrollbarIndex [
	self assert: self newApp class tilemapVScrollbarIndex equals: 6
]

{ #category : #test }
TilemapEditorTest >> testTilemapViewer [
	| app |
	app := self newApp.
	self should: [ app tilemapViewer ] raise: Error.
	app init.
	self assert: (app tilemapViewer isKindOf: TilemapViewer)
]

{ #category : #test }
TilemapEditorTest >> testTilemapViewerIndex [
	self assert: self newApp class tilemapViewerIndex equals: 1
]

{ #category : #test }
TilemapEditorTest >> testTilemaps [
	| app a |
	app := self newApp.
	self assert: app tilemaps isNil.
	a := #(1 2 3).
	app tilemaps: a.
	self assert: app tilemaps identicalTo: a
]
