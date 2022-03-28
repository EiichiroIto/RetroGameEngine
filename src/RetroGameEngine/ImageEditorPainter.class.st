Class {
	#name : #ImageEditorPainter,
	#superclass : #ImageEditorObject,
	#instVars : [
		'dragEnd',
		'dragStart',
		'selection'
	],
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #private }
ImageEditorPainter >> clearDragging [
	dragStart := dragEnd := nil
]

{ #category : #api }
ImageEditorPainter >> clearSelection [
	selection := nil
]

{ #category : #constants }
ImageEditorPainter >> cursorExtent [
	^ 16 @ 16
]

{ #category : #constants }
ImageEditorPainter >> defaultExtent [
	^ self pixelExtent * 16
]

{ #category : #constants }
ImageEditorPainter >> defaultPosition [
	^ 4 @ 10
]

{ #category : #accessing }
ImageEditorPainter >> dragEnd [
	^ dragEnd
]

{ #category : #accessing }
ImageEditorPainter >> dragEnd: anObject [
	^ dragEnd := anObject
]

{ #category : #accessing }
ImageEditorPainter >> dragStart [
	^ dragStart
]

{ #category : #accessing }
ImageEditorPainter >> dragStart: anObject [
	^ dragStart := anObject
]

{ #category : #api }
ImageEditorPainter >> draw [
	app engine rect: position - 1 extent: extent + 2 color: 1.
	self drawPixels.
	self drawGuideline.
	self drawDragging.
	self drawSelection
]

{ #category : #private }
ImageEditorPainter >> drawDragging [
	| p1 p2 |
	self isValidDragging
		ifFalse: [ ^ self ].
	p1 := position + (dragStart * self pixelExtent).
	p2 := (dragEnd - dragStart) * self pixelExtent + self pixelExtent.
	app engine rectFrame: p1 extent: p2 color: 7
]

{ #category : #private }
ImageEditorPainter >> drawGuideline [
	| pos |
	pos := self pixelExtent * 8.
	app engine
		line: position + (0 @ pos y)
			to: position + ((extent x - 1) @ pos y)
			color: 1;
		line: position + (pos x @ 0)
			to: position + (pos x @ (extent y - 1))
			color: 1
]

{ #category : #private }
ImageEditorPainter >> drawPixels [
	| pos c |
	pos := app viewer imagePosition.
	0 to: self cursorExtent y - 1 do: [ :y | 
		0 to: self cursorExtent x - 1 do: [ :x | 
			c := app currentImage pixelAt: pos + (x @ y).
			app engine
				rect: (self pixelPositionAt: x @ y)
				extent: self pixelExtent
				color: c ] ]
]

{ #category : #private }
ImageEditorPainter >> drawSelection [
	| p1 p2 |
	selection ifNil: [ ^ self ].
	p1 := position + (selection topLeft * self pixelExtent).
	p2 := (selection bottomRight - selection topLeft) * self pixelExtent
		+ self pixelExtent.
	app engine rectFrame: p1 extent: p2 color: 13
]

{ #category : #actions }
ImageEditorPainter >> ellipse [
	dragStart = dragEnd
		ifTrue: [ ^ self ].
	app currentImage
		ellipse: dragStart + app viewer imagePosition
		extent: dragEnd - dragStart + 1
		color: app colorNo
]

{ #category : #actions }
ImageEditorPainter >> ellipseFrame [
	dragStart = dragEnd
		ifTrue: [ ^ self ].
	app currentImage
		ellipseFrame: dragStart + app viewer imagePosition
		extent: dragEnd - dragStart + 1
		color: app colorNo
]

{ #category : #actions }
ImageEditorPainter >> fill: aPoint [
	app currentImage fill: aPoint color: app colorNo
]

{ #category : #testing }
ImageEditorPainter >> isValidDragging [
	(dragStart isNil or: [ dragEnd isNil ])
		ifTrue: [ ^ false ].
	(dragStart x > dragEnd x
		or: [ dragStart y > dragEnd y ])
		ifTrue: [ ^ false ].
	^ true
]

{ #category : #constants }
ImageEditorPainter >> pixelExtent [
	^ 6 @ 6
]

{ #category : #private }
ImageEditorPainter >> pixelPointOf: aPoint [
	0 to: self cursorExtent y - 1 do: [ :y | 
		0 to: self cursorExtent x - 1 do: [ :x | 
			(((self pixelPositionAt: x @ y) extent: self pixelExtent)
				containsPoint: aPoint)
				ifTrue: [ ^ x @ y ] ] ].
	^ nil
]

{ #category : #private }
ImageEditorPainter >> pixelPositionAt: aPoint [
	^ position + (aPoint * self pixelExtent)
]

{ #category : #actions }
ImageEditorPainter >> putPixel: aPoint [
	app currentImage pixelAt: aPoint put: app colorNo
]

{ #category : #actions }
ImageEditorPainter >> rect [
	dragStart = dragEnd
		ifTrue: [ ^ self ].
	app currentImage
		rect: dragStart + app viewer imagePosition
		extent: dragEnd - dragStart + 1
		color: app colorNo
]

{ #category : #actions }
ImageEditorPainter >> rectFrame [
	dragStart = dragEnd
		ifTrue: [ ^ self ].
	app currentImage
		rectFrame: dragStart + app viewer imagePosition
		extent: dragEnd - dragStart + 1
		color: app colorNo
]

{ #category : #actions }
ImageEditorPainter >> select [
	selection := self isValidDragging
		ifTrue: [ dragStart corner: dragEnd ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
ImageEditorPainter >> selection [
	^ selection
]

{ #category : #accessing }
ImageEditorPainter >> selection: anObject [
	selection := anObject
]

{ #category : #api }
ImageEditorPainter >> update [
	| p |
	p := self pixelPointOf: app engine mousePosition.
	(app engine isPressed: RetroGameInputs mouseLeftButton)
		ifTrue: [ p ifNil: [ ^ self ].
			app toolNo = ImageEditorTools penTool
				ifTrue: [ self putPixel: p + app viewer imagePosition.
					p := nil ].
			app toolNo = ImageEditorTools fillTool
				ifTrue: [ self fill: p + app viewer imagePosition.
					p := nil ].
			^ dragStart := dragEnd := p ].
	dragStart ifNotNil: [ dragEnd := p ].
	(app engine isReleased: RetroGameInputs mouseLeftButton)
		ifFalse: [ ^ self ].
	self isValidDragging
		ifTrue: [ app toolNo = ImageEditorTools selectTool
				ifTrue: [ self select ].
			app toolNo = ImageEditorTools rectFrameTool
				ifTrue: [ self rectFrame ].
			app toolNo = ImageEditorTools rectTool
				ifTrue: [ self rect ].
			app toolNo = ImageEditorTools ellipseFrameTool
				ifTrue: [ self ellipseFrame ].
			app toolNo = ImageEditorTools ellipseTool
				ifTrue: [ self ellipse ] ].
	self clearDragging
]
