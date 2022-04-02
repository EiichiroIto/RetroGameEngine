Class {
	#name : #TilemapEditor,
	#superclass : #RetroGameTool,
	#instVars : [
		'images',
		'tilemaps'
	],
	#category : #'RetroGameEngine-TilemapEditor'
}

{ #category : #constants }
TilemapEditor class >> commandsIndex [
	 ^ 9
]

{ #category : #constants }
TilemapEditor class >> imageHScrollbarIndex [
	 ^ 7
]

{ #category : #constants }
TilemapEditor class >> imageSelectorIndex [
	 ^ 4
]

{ #category : #constants }
TilemapEditor class >> imageVScrollbarIndex [
	 ^ 8
]

{ #category : #constants }
TilemapEditor class >> imageViewerIndex [
	 ^ 3
]

{ #category : #constants }
TilemapEditor class >> tilemapHScrollbarIndex [
	 ^ 5
]

{ #category : #constants }
TilemapEditor class >> tilemapSelectorIndex [
	 ^ 2
]

{ #category : #constants }
TilemapEditor class >> tilemapVScrollbarIndex [
	 ^ 6
]

{ #category : #constants }
TilemapEditor class >> tilemapViewerIndex [
	 ^ 1
]

{ #category : #accessing }
TilemapEditor class >> title [
	^ 'Tilemap Editor'
]

{ #category : #api }
TilemapEditor >> currentImage [
	^ self imageAt: self imageNo
]

{ #category : #api }
TilemapEditor >> currentTile [
	^ self imageViewer imagePosition // self tilemapViewer tileExtent
]

{ #category : #api }
TilemapEditor >> currentTilemap [
	^ self tilemapAt: self tilemapNo
]

{ #category : #api }
TilemapEditor >> imageAt: anInteger [
	^ images at: anInteger + 1
]

{ #category : #private }
TilemapEditor >> imageHScrollbar [
	^ controls at: self class imageHScrollbarIndex
]

{ #category : #api }
TilemapEditor >> imageNo [
	^ self imageSelector imageNo
]

{ #category : #private }
TilemapEditor >> imageSelector [
	^ controls at: self class imageSelectorIndex
]

{ #category : #private }
TilemapEditor >> imageVScrollbar [
	^ controls at: self class imageVScrollbarIndex
]

{ #category : #private }
TilemapEditor >> imageViewer [
	^ controls at: self class imageViewerIndex
]

{ #category : #accessing }
TilemapEditor >> images [
	^ images
]

{ #category : #accessing }
TilemapEditor >> images: anObject [
	images := anObject
]

{ #category : #api }
TilemapEditor >> init [
	engine
		extent: 256 @ 170;
		title: self class title;
		init.
	fps := 20.
	controls := Array new: 9.
	controls
		at: self class tilemapViewerIndex put: self newTilemapViewer;
		at: self class tilemapSelectorIndex put: self newTilemapSelector;
		at: self class imageViewerIndex put: self newImageViewer;
		at: self class imageSelectorIndex put: self newImageSelector;
		at: self class tilemapHScrollbarIndex put: self newHScrollbar;
		at: self class tilemapVScrollbarIndex put: self newVScrollbar;
		at: self class imageHScrollbarIndex put: self newHScrollbar;
		at: self class imageVScrollbarIndex put: self newVScrollbar;
		at: self class commandsIndex put: self newCommands.
	self setupScrollbar.
	(engine imageAt: 0) importString: ImageEditor image0 at: 0 @ 0.
	self resetAll.
	"(self imageAt: 0) importString: Sample10 image0 at: 0 @ 0.
	(self tilemapAt: 0) importString: Sample10 tilemap0 at: 0 @ 0"
]

{ #category : #api }
TilemapEditor >> loadClass: aClass [
	| selector |
	1 to: self numImages do: [ :each | 
		images at: each put: self newImage.
		selector := ('image' , (each - 1) asString) asSymbol.
		(aClass respondsTo: selector)
			ifTrue:
				[ (images at: each) importString: (aClass perform: selector) at: 0 @ 0 ] ].
	1 to: self numTilemaps do: [ :each | 
		tilemaps at: each put: self newTilemap.
		selector := ('tilemap' , (each - 1) asString) asSymbol.
		(aClass respondsTo: selector)
			ifTrue: [ (tilemaps at: each)
					importString: (aClass perform: selector)
					at: 0 @ 0 ] ].
	self tilemapSelector tilemapNo: 0
]

{ #category : #api }
TilemapEditor >> loadImageClass: aClass selector: aSymbol [
	self currentImage importString: (aClass perform: aSymbol) at: 0 @ 0
]

{ #category : #api }
TilemapEditor >> loadTilemapClass: aClass selector: aSymbol [
	self currentTilemap importString: (aClass perform: aSymbol) at: 0 @ 0
]

{ #category : #api }
TilemapEditor >> methodSelectorFor: anInteger [
	^ ('tilemap' , anInteger asString) asSymbol
]

{ #category : #private }
TilemapEditor >> newCommands [
	^ TilemapEditorCommands new
		init: self;
		yourself
]

{ #category : #private }
TilemapEditor >> newHScrollbar [
	^ ImageEditorHScrollbar new
		init: self;
		yourself
]

{ #category : #private }
TilemapEditor >> newImage [
	^ RetroGameImage new
		extent: 256 @ 256;
		init
]

{ #category : #private }
TilemapEditor >> newImageSelector [
	^ ImageEditorSelector new
		init: self;
		position: 150 @ 150;
		whenImageNoChanged: [ self setImageNoOfTilemap ];
		yourself
]

{ #category : #private }
TilemapEditor >> newImageViewer [
	^ ImageEditorViewer new
		init: self;
		position: 150 @ 10;
		cursorExtent: 8 @ 8;
		yourself
]

{ #category : #private }
TilemapEditor >> newTilemap [
	^ RetroGameTilemap new
		extent: 256 @ 256;
		init;
		imageNo: 0;
		yourself
]

{ #category : #private }
TilemapEditor >> newTilemapSelector [
	^ TilemapSelector new
		init: self;
		yourself
]

{ #category : #private }
TilemapEditor >> newTilemapViewer [
	^ TilemapViewer new
		init: self;
		yourself
]

{ #category : #private }
TilemapEditor >> newVScrollbar [
	^ ImageEditorVScrollbar new
		init: self;
		yourself
]

{ #category : #api }
TilemapEditor >> numImages [
	^ 3
]

{ #category : #api }
TilemapEditor >> numTilemaps [
	^ 8
]

{ #category : #api }
TilemapEditor >> resetAll [
	images := (Array new: self numImages) collect: [ :each | self newImage ].
	tilemaps := (Array new: self numTilemaps) collect: [ :each | self newTilemap ].
	self imageSelector imageNo: 0.
	self tilemapSelector tilemapNo: 0
]

{ #category : #api }
TilemapEditor >> resetTilemap [
	tilemaps at: self tilemapNo + 1 put: self newTilemap
]

{ #category : #api }
TilemapEditor >> saveTilemap: aTilemap class: aClass selector: aSymbol [
	| list stream |
	list := self class compactArrayStringFrom: aTilemap arrayString.
	list isEmpty
		ifTrue: [ ^ self ].
	stream := WriteStream on: String new.
	stream
		nextPutAll: aSymbol;
		nextPutAll: String cr;
		nextPutAll: '	^ '''.
	list
		do: [ :each | 
			stream
				nextPutAll: each;
				nextPutAll: String cr ].
	stream nextPutAll: ''''.
	aClass class compile: stream contents classified: 'resources'
]

{ #category : #api }
TilemapEditor >> saveTilemapClass: aClass [
	0 to: self numTilemaps - 1 do: [ :each | 
		self
			saveTilemap: (self tilemapAt: each)
			class: aClass
			selector: (self methodSelectorFor: each) ]
]

{ #category : #private }
TilemapEditor >> setImageNoOfTilemap [
	self currentTilemap imageNo: self imageNo
]

{ #category : #private }
TilemapEditor >> setupScrollbar [
	self tilemapViewer
		in: [ :viewer | 
			self tilemapHScrollbar
				position: viewer position + (0 @ (viewer extent y + 1));
				extent: viewer extent x @ 5;
				whenButtonClicked: [ :x | viewer hScroll: x * 8 ];
				whenBarClicked: [ :x :w | viewer hScrollBar: x in: w ];
				updateBar: #(100 0 10).
			self tilemapVScrollbar
				position: viewer position + ((viewer extent x + 1) @ 0);
				extent: 5 @ viewer extent y;
				whenButtonClicked: [ :y | viewer vScroll: y * 8 ];
				whenBarClicked: [ :y :h | viewer vScrollBar: y in: h ];
				updateBar: #(100 0 10) ].
	self imageViewer
		in: [ :viewer | 
			self imageHScrollbar
				position: viewer position + (0 @ (viewer extent y + 1));
				extent: viewer extent x @ 5;
				whenButtonClicked: [ :x | viewer hScroll: x * 8 ];
				whenBarClicked: [ :x :w | viewer hScrollBar: x in: w ];
				updateBar: #(100 0 10).
			self imageVScrollbar
				position: viewer position + ((viewer extent x + 1) @ 0);
				extent: 5 @ viewer extent y;
				whenButtonClicked: [ :y | viewer vScroll: y * 8 ];
				whenBarClicked: [ :y :h | viewer vScrollBar: y in: h ];
				updateBar: #(100 0 10) ]
]

{ #category : #api }
TilemapEditor >> tilemapAt: anInteger [
	^ tilemaps at: anInteger + 1
]

{ #category : #private }
TilemapEditor >> tilemapHScrollbar [
	^ controls at: self class tilemapHScrollbarIndex
]

{ #category : #api }
TilemapEditor >> tilemapNo [
	^ self tilemapSelector tilemapNo
]

{ #category : #private }
TilemapEditor >> tilemapSelector [
	^ controls at: self class tilemapSelectorIndex
]

{ #category : #private }
TilemapEditor >> tilemapVScrollbar [
	^ controls at: self class tilemapVScrollbarIndex
]

{ #category : #private }
TilemapEditor >> tilemapViewer [
	^ controls at: self class tilemapViewerIndex
]

{ #category : #accessing }
TilemapEditor >> tilemaps [
	^ tilemaps
]

{ #category : #accessing }
TilemapEditor >> tilemaps: anObject [
	tilemaps := anObject
]
