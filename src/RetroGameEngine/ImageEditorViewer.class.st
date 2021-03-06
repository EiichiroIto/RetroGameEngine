Class {
	#name : #ImageEditorViewer,
	#superclass : #RetroGameObject,
	#instVars : [
		'cursorPosition',
		'imageOffset',
		'cursorExtent'
	],
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #constants }
ImageEditorViewer >> cursorExtent [
	^ cursorExtent
]

{ #category : #accessing }
ImageEditorViewer >> cursorExtent: anObject [
	cursorExtent := anObject
]

{ #category : #accessing }
ImageEditorViewer >> cursorPosition [
	^ cursorPosition
]

{ #category : #accessing }
ImageEditorViewer >> cursorPosition: anObject [
	cursorPosition := anObject
]

{ #category : #constants }
ImageEditorViewer >> defaultPosition [
	^ 120 @ 10
]

{ #category : #api }
ImageEditorViewer >> draw [
	| image ex |
	image := app currentImage.
	ex := self extent.
	app engine
		blt: position image: image at: imageOffset extent: ex transparentColor: nil;
		rectFrame: position - 1 extent: ex + 2 color: 1;
		rectFrame: position + cursorPosition - 1 extent: self cursorExtent + 2 color: 7
]

{ #category : #constants }
ImageEditorViewer >> extent [
	^ 64 @ 96
]

{ #category : #api }
ImageEditorViewer >> hScroll: anInteger [
	| x w |
	w := (app currentImage extent - self extent) x.
	x := imageOffset x + anInteger max: 0.
	x := x min: w.
	imageOffset := x @ imageOffset y.
	^ {w.
	x.
	self extent x}
]

{ #category : #api }
ImageEditorViewer >> hScrollBar: anInteger in: anInteger2 [
	| x w |
	w := (app currentImage extent - self extent) x.
	x := anInteger * w // anInteger2.
	x := x // 8 * 8.
	imageOffset := x @ imageOffset y.
	^ {w.
	x.
	self extent x}
]

{ #category : #accessing }
ImageEditorViewer >> imageOffset [
	^ imageOffset
]

{ #category : #accessing }
ImageEditorViewer >> imageOffset: aPoint [
	imageOffset := aPoint
]

{ #category : #api }
ImageEditorViewer >> imagePosition [
	^ imageOffset + cursorPosition
]

{ #category : #api }
ImageEditorViewer >> init: anApp [
	super init: anApp.
	imageOffset := 0 @ 0.
	cursorPosition := 0 @ 0.
	cursorExtent := 16 @ 16
]

{ #category : #api }
ImageEditorViewer >> update [
	| tmp |
	(app engine isPressed: RetroGameInputs mouseLeftButton)
		ifFalse: [ ^ self ].
	((position extent: self extent) containsPoint: app engine mousePosition)
		ifFalse: [ ^ self ].
	tmp := 8 @ 8.
	cursorPosition := (app engine mousePosition - position) // tmp * tmp.
	cursorPosition := cursorPosition max: 0 @ 0.
	cursorPosition := cursorPosition min: self extent - self cursorExtent
]

{ #category : #api }
ImageEditorViewer >> vScroll: anInteger [
	| y h |
	h := (app currentImage extent - self extent) y.
	y := imageOffset y + anInteger max: 0.
	y := y min: h.
	imageOffset := imageOffset x @ y.
	^ {h.
	y.
	self extent y}
]

{ #category : #api }
ImageEditorViewer >> vScrollBar: anInteger in: anInteger2 [
	| y h |
	h := (app currentImage extent - self extent) y.
	y := anInteger * h // anInteger2.
	y := y // 8 * 8.
	imageOffset := imageOffset x @ y.
	^ {h.
	y.
	self extent y}
]
