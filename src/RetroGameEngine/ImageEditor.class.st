Class {
	#name : #ImageEditor,
	#superclass : #RetroGameTool,
	#instVars : [
		'images'
	],
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #constants }
ImageEditor class >> commandsIndex [
	^ 6
]

{ #category : #resources }
ImageEditor class >> image0 [
	^ 'D0D0D0D0DDDD0000DDDDDDD0DDDDDDD000DDD00000DDD000000DD000DDDDD0DDDDD0DDDDD0DDDDD0
00000000DDD0D000D00000D0DDDDDDD00D000D000DDDDD00000DD000DDD0D0D0DDD0DD0DD0D000D0
D00000D0DD000D00D00000D0DDDDDDD0D00000D0DDDDDDD00DDDDDD0D000D0D000D0DD0DD0DD0DD0
00000000D00000D0D00000D0DDDDDDD0D00000D0DDDDDDD00DDDDDD0DDD0D0D0DDD0D000D0DD0DD0
D00000D00D0000D0D00000D0DDDDDDD0D00000D0DDDDDDD000D0D0D0DDDDD0DDDDD0DDDDD0DDDDD0
0000000000D00D00D00000D0DDDDDDD00D000D000DDDDD0000D0D0D0000000000000000000000000
D0D0D0D0000DD000DDDDDDD0DDDDDDD000DDD00000DDD0000D0D0D00000000000000000000000000
'
]

{ #category : #constants }
ImageEditor class >> painterIndex [
	^ 1
]

{ #category : #constants }
ImageEditor class >> paletteIndex [
	^ 2
]

{ #category : #constants }
ImageEditor class >> selectorIndex [
	^ 5
]

{ #category : #accessing }
ImageEditor class >> title [
	^ 'Image Editor'
]

{ #category : #constants }
ImageEditor class >> toolsIndex [
	^ 3
]

{ #category : #constants }
ImageEditor class >> viewerHScrollbarIndex [
	^ 7
]

{ #category : #constants }
ImageEditor class >> viewerIndex [
	^ 4
]

{ #category : #constants }
ImageEditor class >> viewerVScrollbarIndex [
	^ 8
]

{ #category : #api }
ImageEditor >> colorNo [
	^ self palette colorNo
]

{ #category : #private }
ImageEditor >> commands [
	^ controls at: self class commandsIndex
]

{ #category : #api }
ImageEditor >> currentImage [
	^ self imageAt: self imageNo
]

{ #category : #api }
ImageEditor >> draw [
	super draw.
	self drawStatus
]

{ #category : #private }
ImageEditor >> drawStatus [
	| st |
	st := WriteStream on: String new.
	self viewer imagePosition
		in: [ :p | 
			st
				nextPut: $(;
				nextPutAll: p x asString;
				nextPut: $,;
				nextPutAll: p y asString;
				nextPutAll: ')-(' ].
	self viewer imagePosition + self viewer cursorExtent - 1
		in: [ :p | 
			st
				nextPutAll: p x asString;
				nextPut: $,;
				nextPutAll: p y asString;
				nextPut: $) ].
	engine text: st contents at: 4 @ 2 color: 13
]

{ #category : #api }
ImageEditor >> imageAt: anInteger [
	^ images at: anInteger + 1
]

{ #category : #api }
ImageEditor >> imageNo [
	^ self selector imageNo
]

{ #category : #api }
ImageEditor >> imagePosition [
	^ self viewer imagePosition
]

{ #category : #accessing }
ImageEditor >> images [
	^ images
]

{ #category : #accessing }
ImageEditor >> images: anObject [
	images := anObject
]

{ #category : #api }
ImageEditor >> init [
	engine
		extent: 256 @ 140;
		title: 'Image Editor';
		init.
	fps := 20.
	controls := Array new: 8.
	controls
		at: self class painterIndex put: self newPainter;
		at: self class paletteIndex put: self newPalette;
		at: self class toolsIndex put: self newTools;
		at: self class viewerIndex put: self newViewer;
		at: self class selectorIndex put: self newSelector;
		at: self class commandsIndex put: self newCommands;
		at: self class viewerHScrollbarIndex put: self newHScrollbar;
		at: self class viewerVScrollbarIndex put: self newVScrollbar.
	self setupScrollbar.
	(engine imageAt: 0) importString: self class image0 at: 0 @ 0.
	self resetImages.
	"(self imageAt: 0) importString: Sample02 imageBank0 at: 0 @ 0"
]

{ #category : #api }
ImageEditor >> loadImageClass: aClass [
	| selector |
	1 to: self numImages do: [ :each | 
		selector := ('image' , (each - 1) asString) asSymbol.
		(aClass respondsTo: selector)
			ifTrue:
				[ (images at: each) importString: (aClass perform: selector) at: 0 @ 0 ]
			ifFalse: [ images at: each put: self newImage ] ].
	self selector imageNo: 0
]

{ #category : #api }
ImageEditor >> loadImageClass: aClass selector: aSymbol [
	self currentImage importString: (aClass perform: aSymbol) at: 0 @ 0
]

{ #category : #api }
ImageEditor >> methodSelectorFor: anInteger [
	^ ('image' , anInteger asString) asSymbol
]

{ #category : #private }
ImageEditor >> newCommands [
	^ ImageEditorCommands new
		init: self;
		yourself
]

{ #category : #private }
ImageEditor >> newHScrollbar [
	^ ImageEditorHScrollbar new
		init: self;
		yourself
]

{ #category : #private }
ImageEditor >> newImage [
	^ RetroGameImage new
		extent: 256 @ 256;
		init
]

{ #category : #private }
ImageEditor >> newPainter [
	^ ImageEditorPainter new
		init: self;
		yourself
]

{ #category : #private }
ImageEditor >> newPalette [
	^ ImageEditorPalette new
		init: self;
		yourself
]

{ #category : #private }
ImageEditor >> newSelector [
	^ ImageEditorSelector new
		init: self;
		yourself
]

{ #category : #private }
ImageEditor >> newTools [
	^ ImageEditorTools new
		init: self;
		yourself
]

{ #category : #private }
ImageEditor >> newVScrollbar [
	^ ImageEditorVScrollbar new
		init: self;
		yourself
]

{ #category : #private }
ImageEditor >> newViewer [
	^ ImageEditorViewer new
		init: self;
		yourself
]

{ #category : #constants }
ImageEditor >> numImages [
	^ 3
]

{ #category : #private }
ImageEditor >> painter [
	^ controls at: self class painterIndex
]

{ #category : #private }
ImageEditor >> palette [
	^ controls at: self class paletteIndex
]

{ #category : #api }
ImageEditor >> resetImage [
	images at: self imageNo + 1 put: self newImage
]

{ #category : #api }
ImageEditor >> resetImages [
	images := (Array new: self numImages) collect: [ :each | self newImage ].
	self selector imageNo: 0
]

{ #category : #api }
ImageEditor >> saveImage: anImage class: aClass selector: aSymbol [
	| list stream |
	list := self class compactArrayStringFrom: anImage arrayString.
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
ImageEditor >> saveImageClass: aClass [
	0 to: self numImages - 1 do: [ :each | 
		self
			saveImage: (self imageAt: each)
			class: aClass
			selector: (self methodSelectorFor: each) ]
]

{ #category : #api }
ImageEditor >> selectionRectangle [
	| s |
	s := self painter selection.
	s ifNil: [ ^ nil ].
	^ s topLeft + self viewer imagePosition extent: s extent
]

{ #category : #private }
ImageEditor >> selector [
	^ controls at: self class selectorIndex
]

{ #category : #private }
ImageEditor >> setupScrollbar [
	self viewerHScrollbar
		position: self viewer position + (0 @ (self viewer extent y + 1));
		extent: self viewer extent x @ 5;
		whenButtonClicked: [ :x | self viewer hScroll: x * 8 ];
		whenBarClicked: [ :x :w | self viewer hScrollBar: x in: w ];
		updateBar: #(100 0 10).
	self viewerVScrollbar
		position: self viewer position + ((self viewer extent x + 1) @ 0);
		extent: 5 @ self viewer extent y;
		whenButtonClicked: [ :y | self viewer vScroll: y * 8 ];
		whenBarClicked: [ :y :h | self viewer vScrollBar: y in: h ];
		updateBar: #(100 0 10).
]

{ #category : #api }
ImageEditor >> toolNo [
	^ self tools toolNo
]

{ #category : #private }
ImageEditor >> tools [
	^ controls at: self class toolsIndex
]

{ #category : #private }
ImageEditor >> viewer [
	^ controls at: self class viewerIndex
]

{ #category : #private }
ImageEditor >> viewerHScrollbar [
	^ controls at: self class viewerHScrollbarIndex
]

{ #category : #private }
ImageEditor >> viewerVScrollbar [
	^ controls at: self class viewerVScrollbarIndex
]
