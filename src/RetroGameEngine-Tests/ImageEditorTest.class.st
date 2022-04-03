"
An ImageEditorTest is a test class for testing the behavior of ImageEditor
"
Class {
	#name : #ImageEditorTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
ImageEditorTest >> newApp [
	^ ImageEditor new
		engine: RetroGameEngine new;
		yourself
]

{ #category : #test }
ImageEditorTest >> testColorNo [
	| editor |
	editor := self newApp.
	editor init.
	self assert: editor colorNo equals: 0.
	editor palette colorNo: 5.
	self assert: editor colorNo equals: 5
]

{ #category : #test }
ImageEditorTest >> testCommands [
	| editor |
	editor := self newApp.
	self should: [ editor commands ] raise: Error.
	editor init.
	self assert: (editor commands isKindOf: ImageEditorCommands)
]

{ #category : #test }
ImageEditorTest >> testCommandsIndex [
	self assert: self newApp class commandsIndex equals: 6
]

{ #category : #test }
ImageEditorTest >> testCurrentImage [
	| editor |
	editor := self newApp.
	editor init.
	self assert: editor currentImage identicalTo: editor images first.
	editor selector imageNo: 2.
	self assert: editor currentImage equals: editor images third
]

{ #category : #test }
ImageEditorTest >> testImageAt [
	| editor |
	editor := self newApp.
	editor init.
	self assert: (editor imageAt: 0) identicalTo: editor images first.
	self assert: (editor imageAt: 2) equals: editor images third
]

{ #category : #test }
ImageEditorTest >> testImageNo [
	| editor |
	editor := self newApp.
	editor init.
	self assert: editor imageNo equals: 0.
	editor selector imageNo: 5.
	self assert: editor imageNo equals: 5
]

{ #category : #test }
ImageEditorTest >> testImagePosition [
	| editor |
	editor := self newApp.
	editor init.
	self assert: editor imagePosition equals: 0 @ 0.
	editor viewer imageOffset: 2 @ 3.
	self assert: editor imagePosition equals: 2 @ 3
]

{ #category : #test }
ImageEditorTest >> testImages [
	| editor a |
	editor := self newApp.
	self assert: editor images isNil.
	a := Array with: 5.
	editor images: a.
	self assert: editor images identicalTo: a
]

{ #category : #test }
ImageEditorTest >> testInit [
	| editor |
	editor := self newApp.
	editor init.
	self assert: editor images isArray.
	self assert: editor images size equals: 3.
	self assert: editor controls isArray.
	self assert: editor controls size equals: 8
]

{ #category : #test }
ImageEditorTest >> testMethodSelectorFor [
	| app |
	app := self newApp.
	self assert: (app methodSelectorFor: 0) equals: #image0.
	self assert: (app methodSelectorFor: 1) equals: #image1.
	self assert: (app methodSelectorFor: 2) equals: #image2
]

{ #category : #test }
ImageEditorTest >> testNewCommands [
	| editor |
	editor := self newApp.
	self assert: (editor newCommands isKindOf: ImageEditorCommands)
]

{ #category : #test }
ImageEditorTest >> testNewHScrollbar [
	| editor |
	editor := self newApp.
	self assert: (editor newHScrollbar isKindOf: ImageEditorHScrollbar)
]

{ #category : #test }
ImageEditorTest >> testNewImage [
	| editor |
	editor := self newApp.
	self assert: (editor newImage isKindOf: RetroGameImage)
]

{ #category : #test }
ImageEditorTest >> testNewPainter [
	| editor |
	editor := self newApp.
	self assert: (editor newPainter isKindOf: ImageEditorPainter)
]

{ #category : #test }
ImageEditorTest >> testNewPalette [
	| editor |
	editor := self newApp.
	self assert: (editor newPalette isKindOf: ImageEditorPalette)
]

{ #category : #test }
ImageEditorTest >> testNewSelector [
	| editor |
	editor := self newApp.
	self assert: (editor newSelector isKindOf: ImageEditorSelector)
]

{ #category : #test }
ImageEditorTest >> testNewTools [
	| editor |
	editor := self newApp.
	self assert: (editor newTools isKindOf: ImageEditorTools)
]

{ #category : #test }
ImageEditorTest >> testNewVScrollbar [
	| editor |
	editor := self newApp.
	self assert: (editor newVScrollbar isKindOf: ImageEditorVScrollbar)
]

{ #category : #test }
ImageEditorTest >> testNewViewer [
	| editor |
	editor := self newApp.
	self assert: (editor newViewer isKindOf: ImageEditorViewer)
]

{ #category : #test }
ImageEditorTest >> testNumImages [
	self assert: self newApp numImages equals: 3
]

{ #category : #test }
ImageEditorTest >> testPainter [
	| editor |
	editor := self newApp.
	self should: [ editor painter ] raise: Error.
	editor init.
	self assert: (editor painter isKindOf: ImageEditorPainter)
]

{ #category : #test }
ImageEditorTest >> testPainterIndex [
	self assert: self newApp class painterIndex equals: 1
]

{ #category : #test }
ImageEditorTest >> testPalette [
	| editor |
	editor := self newApp.
	self should: [ editor palette ] raise: Error.
	editor init.
	self assert: (editor palette isKindOf: ImageEditorPalette)
]

{ #category : #test }
ImageEditorTest >> testPaletteIndex [
	self assert: self newApp class paletteIndex equals: 2
]

{ #category : #test }
ImageEditorTest >> testResetImage [
	| app |
	app := self newApp.
	app init.
	(app imageAt: 0) pixelAt: 0 @ 0 put: 1.
	(app imageAt: 1) pixelAt: 1 @ 2 put: 2.
	(app imageAt: 2) pixelAt: 3 @ 4 put: 3.
	self assert: ((app imageAt: 0) pixelAt: 0 @ 0) equals: 1.
	self assert: ((app imageAt: 1) pixelAt: 1 @ 2) equals: 2.
	self assert: ((app imageAt: 2) pixelAt: 3 @ 4) equals: 3.
	app selector imageNo: 1.
	app resetImage.
	self assert: ((app imageAt: 0) pixelAt: 0 @ 0) equals: 1.
	self assert: ((app imageAt: 1) pixelAt: 1 @ 2) equals: 0.
	self assert: ((app imageAt: 2) pixelAt: 3 @ 4) equals: 3
]

{ #category : #test }
ImageEditorTest >> testResetImages [
	| app |
	app := self newApp.
	app init.
	(app imageAt: 0) pixelAt: 0 @ 0 put: 1.
	(app imageAt: 1) pixelAt: 1 @ 2 put: 2.
	(app imageAt: 2) pixelAt: 3 @ 4 put: 3.
	self assert: ((app imageAt: 0) pixelAt: 0 @ 0) equals: 1.
	self assert: ((app imageAt: 1) pixelAt: 1 @ 2) equals: 2.
	self assert: ((app imageAt: 2) pixelAt: 3 @ 4) equals: 3.
	app resetImages.
	self assert: ((app imageAt: 0) pixelAt: 0 @ 0) equals: 0.
	self assert: ((app imageAt: 1) pixelAt: 1 @ 2) equals: 0.
	self assert: ((app imageAt: 2) pixelAt: 3 @ 4) equals: 0
]

{ #category : #test }
ImageEditorTest >> testSelectionRectangle [
	| app |
	app := self newApp.
	app init.
	self assert: app selectionRectangle isNil.
	app viewer imageOffset: 1 @ 2.
	app painter selection: ((3 @ 4) extent: (10 @ 20)).
	self assert: app selectionRectangle equals: (4 @ 6 corner: 14 @ 26)
]

{ #category : #test }
ImageEditorTest >> testSelector [
	| editor |
	editor := self newApp.
	self should: [ editor selector ] raise: Error.
	editor init.
	self assert: (editor selector isKindOf: ImageEditorSelector)
]

{ #category : #test }
ImageEditorTest >> testSelectorIndex [
	self assert: self newApp class selectorIndex equals: 5
]

{ #category : #test }
ImageEditorTest >> testToolNo [
	| editor |
	editor := self newApp.
	editor init.
	self assert: editor toolNo equals: 0.
	editor tools toolNo: 5.
	self assert: editor toolNo equals: 5
]

{ #category : #test }
ImageEditorTest >> testTools [
	| editor |
	editor := self newApp.
	self should: [ editor tools ] raise: Error.
	editor init.
	self assert: (editor tools isKindOf: ImageEditorTools)
]

{ #category : #test }
ImageEditorTest >> testToolsIndex [
	self assert: self newApp class toolsIndex equals: 3
]

{ #category : #test }
ImageEditorTest >> testViewer [
	| editor |
	editor := self newApp.
	self should: [ editor viewer ] raise: Error.
	editor init.
	self assert: (editor viewer isKindOf: ImageEditorViewer)
]

{ #category : #test }
ImageEditorTest >> testViewerHScrollbar [
	| editor |
	editor := self newApp.
	self should: [ editor viewerHScrollbar ] raise: Error.
	editor init.
	self assert: (editor viewerHScrollbar isKindOf: ImageEditorHScrollbar)
]

{ #category : #test }
ImageEditorTest >> testViewerHScrollbarIndex [
	self assert: self newApp class viewerHScrollbarIndex equals: 7
]

{ #category : #test }
ImageEditorTest >> testViewerIndex [
	self assert: self newApp class viewerIndex equals: 4
]

{ #category : #test }
ImageEditorTest >> testViewerVScrollbar [
	| editor |
	editor := self newApp.
	self should: [ editor viewerVScrollbar ] raise: Error.
	editor init.
	self assert: (editor viewerVScrollbar isKindOf: ImageEditorVScrollbar)
]

{ #category : #test }
ImageEditorTest >> testViewerVScrollbarIndex [
	self assert: self newApp class viewerVScrollbarIndex equals: 8
]
