Class {
	#name : #TilemapViewer,
	#superclass : #RetroGameObject,
	#instVars : [
		'tilemapOffset'
	],
	#category : #'RetroGameEngine-TilemapEditor'
}

{ #category : #constants }
TilemapViewer >> defaultPosition [
	^ 4 @ 10
]

{ #category : #api }
TilemapViewer >> draw [
	| src dst tilemap image pair |
	image := app currentImage.
	tilemap := app currentTilemap.
	0 to: self tilemapExtent y - 1 do: [ :y | 
		0 to: self tilemapExtent x - 1 do: [ :x | 
			pair := tilemap tileAt: x @ y + tilemapOffset.
			src := pair * self tileExtent.
			dst := x @ y * self tileExtent + position.
			app engine
				blt: dst
				image: image
				at: src
				extent: self tileExtent
				transparentColor: 0 ] ]
]

{ #category : #accessing }
TilemapViewer >> extent [
	^ self tilemapExtent * self tileExtent
]

{ #category : #api }
TilemapViewer >> hScroll: anInteger [
	| x w |
	w := (app currentImage extent - self tilemapExtent) x.
	x := tilemapOffset x + anInteger max: 0.
	x := x min: w.
	tilemapOffset := x @ tilemapOffset y.
	^ {w.
	x.
	self tilemapExtent x}
]

{ #category : #api }
TilemapViewer >> hScrollBar: anInteger in: anInteger2 [
	| x w |
	w := (app currentImage extent - self tilemapExtent) x.
	x := anInteger * w // anInteger2.
	x := x // 8 * 8.
	tilemapOffset := x @ tilemapOffset y.
	^ {w.
	x.
	self tilemapExtent x}
]

{ #category : #api }
TilemapViewer >> init: anApp [
	super init: anApp.
	tilemapOffset := 0 @ 0
]

{ #category : #constants }
TilemapViewer >> tileExtent [
	^ 8 @ 8
]

{ #category : #constants }
TilemapViewer >> tilemapExtent [
	^ 16 @ 16
]

{ #category : #accessing }
TilemapViewer >> tilemapOffset [
	^ tilemapOffset
]

{ #category : #accessing }
TilemapViewer >> tilemapOffset: anObject [
	tilemapOffset := anObject
]

{ #category : #api }
TilemapViewer >> update [
	| pos |
	(app engine isPressed: RetroGameInputs mouseLeftButton)
		ifFalse: [ ^ self ].
	((position extent: self extent)
		containsPoint: app engine mousePosition)
		ifFalse: [ ^ self ].
	pos := (app engine mousePosition - position) // self tileExtent
		+ tilemapOffset.
	app currentTilemap tileAt: pos put: app currentTile
]

{ #category : #api }
TilemapViewer >> vScroll: anInteger [
	| y h |
	h := (app currentTilemap extent - self tilemapExtent) y.
	y := tilemapOffset y + anInteger max: 0.
	y := y min: h.
	tilemapOffset := tilemapOffset x @ y.
	^ {h.
	y.
	self tilemapExtent y}
]

{ #category : #api }
TilemapViewer >> vScrollBar: anInteger in: anInteger2 [
	| y h |
	h := (app currentImage extent - self tilemapExtent) y.
	y := anInteger * h // anInteger2.
	y := y // 8 * 8.
	tilemapOffset := tilemapOffset x @ y.
	^ {h.
	y.
	self tilemapExtent y}
]
