"
Ported demo from Pyxel.

All characters and backgrounds are from ""03_draw_api.py"".

"
Class {
	#name : #Sample03,
	#superclass : #RetroGameApp,
	#instVars : [
		'palTestIsEnabled',
		'clipTestIsEnabled'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #resources }
Sample03 class >> cat16x16 [
	^ (ColorForm
		extent: 16 @ 16
		depth: 8
		fromArray:
			#(1 0 65536 0 258 16777216 16908544 0 66051 16843009 33751296 256 66307 50529027 50528512 66049 16909059 50529027 50528769 66305 16974083 50529027 16974593 66049 16974595 50397955 50529025 66305 16974595 16974083 50528769 16843521 16909059 50529027 50528771 33751809 66051 50529027 50528771 33751809 259 50529027 50529027 50528769 259 50529027 50529027 50528769 259 33686274 33686274 33751296 259 16843521 16843521 16974080 258 16843265 66049 16908544 1 256 256 65536)
		offset: 0 @ 0)
		colorsFromArray:
			#(#(0.639 0.639 0.639 1.0) #(0.0 0.0 0.0 1.0) #(0.8270000000000001 0.518 0.255 1.0) #(0.93 0.78 0.6900000000000001 1.0) #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #())
]

{ #category : #resources }
Sample03 class >> tilemap0 [
	^ #('0201 0000 0200 0400 0100 0000 0003 0103 0203 0000 0002'
	    '0202 0300 0001 0101 0201 0300 0000 0100 0200 0300 0003')
]

{ #category : #resources }
Sample03 class >> tileset24x32 [
	^ (ColorForm
		extent: 40 @ 32
		depth: 8
		fromArray:
			#(0 0 0 0 0 0 0 0 257 33685504 0 0 3 67108864 0 0 1280 1280 67078 101057024 0 0 4 0 7 117440512 2048 2048 17171974 101058050 0 0 1285 84213760 1801 151453696 526848 526848 17171974 101058050 0 0 330245 84215040 1799 151453696 657930 68097 17171974 101058050 0 0 328965 84215040 1799 151453696 657921 68097 17171974 101387010 0 0 328965 84215040 1799 151453696 68097 68097 17171974 33686018 0 0 1285 84213760 7 117440512 68097 68097 33947905 16843010 131586 201458178 201458178 201458178 201458188 33686016 0 0 0 0 34341378 202113548 201460738 201458188 201458188 33688578 0 0 0 0 33688588 202116108 202116108 202116108 202116108 202113538 0 0 0 0 33688582 202114572 101059596 101452806 201722892 101452802 0 0 0 0 202116102 101058054 101058054 101058054 101058054 101452812 0 0 0 0 33688588 101058054 101058054 101058054 101058054 202113538 0 0 0 0 33688588 101058054 101058054 101058054 101058054 202113538 0 0 0 0 34343942 101058054 101058054 101058054 101058054 101452802 0 0 0 0 202114566 101058054 101058054 101058054 101058054 101452812 0 0 0 0 34343942 101058054 101058054 101058054 101058054 202116098 0 0 0 0 33688588 101058054 101058054 101058054 101058054 202113538 0 0 0 0 33688588 101058054 101058054 101058054 101058054 101452802 0 0 0 0 202116102 101058054 101058054 101058054 101058054 202116108 0 0 0 0 33688588 101058054 101058054 101058054 101058054 202113538 0 0 0 0 33688588 101058054 101058054 101058054 101058054 202113538 0 0 0 0 34343942 101058054 101058054 101058054 101058054 101452802 0 0 0 0 202116102 101058054 101058054 101058054 101058054 101452812 0 0 0 0 33688588 101058054 101058054 101058054 101058054 202113538 0 0 0 0 33688588 101058054 101058054 101058054 101058054 202116098 0 0 0 0 202116102 101058054 101058054 101058054 101058054 101450242 0 0 0 0 34343942 202114572 101452806 201721356 201722892 101452812 0 0 0 0 33688588 202116108 202116108 202116108 202116108 202113538 0 0 0 0 34341378 201458188 202113538 202113538 201460738 201460738 0 0 0 0 131586 201458178 201458178 201458178 201458178 201458176 0 0 0 0)
		offset: 0 @ 0)
		colorsFromArray:
			#(#(0.494 0.125 0.447 1.0) #(0.663 0.757 1.0 1.0) #(0.639 0.639 0.639 1.0) #(0.098 0.585 0.612 1.0) #(0.439 0.776 0.663 1.0) #(0.8310000000000001 0.094 0.423 1.0) #(0.0 0.0 0.0 1.0) #(0.914 0.764 0.357 1.0) #(0.93 0.78 0.6900000000000001 1.0) #(0.8270000000000001 0.518 0.255 1.0) #(0.934 0.934 0.934 1.0) #(0.224 0.361 0.596 1.0) #(0.169 0.2 0.372 1.0) #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #() #())
]

{ #category : #accessing }
Sample03 class >> title [
	^ '03 Draw API Demo'
]

{ #category : #accessing }
Sample03 >> clipTestIsEnabled [
	^ clipTestIsEnabled
]

{ #category : #accessing }
Sample03 >> clipTestIsEnabled: anObject [
	clipTestIsEnabled := anObject
]

{ #category : #api }
Sample03 >> draw [
	self drawTestPalette1.
	self drawTestCls: 6 @ 6.
	self drawTestClip.
	self drawTestPset: 6 @ 20.
	self drawTestLine: 106 @ 6.
	self drawTestRect: 6 @ 38.
	self drawTestRectFrame: 106 @ 38.
	self drawTestCircle: 6 @ 61.
	self drawTestCircleFrame: 106 @ 61.
	self drawTestBlt: 6 @ 88.
	self drawTestBltTilemap: 106 @ 88.
	self drawTestText: 6 @ 124.
	self drawTestPalette2: 106 @ 124
]

{ #category : #private }
Sample03 >> drawTestBlt: aPoint [
	| pos offset |
	engine
		text:
			'blt(x,y,img,u,v,
    w,h,[colkey])'
		at: aPoint
		color: 7.
	pos := aPoint x @ (aPoint y + 15).
	offset := (engine sin: engine frameCount * 5.73) * 2.
	engine
		blt: pos
		imageNo: 0
		at: 0 @ 0
		extent: 16 @ 16
		transparentColor: nil.
	engine
		blt: (pos x + offset + 19) @ pos y
		imageNo: 0
		at: 0 @ 0
		extent: 16 @ 16
		transparentColor: 13.
	engine
		blt: (pos x + 38) @ pos y
		imageNo: 0
		at: 0 @ 0
		extent: -16 @ 16
		transparentColor: 13.
	engine
		blt: (pos x + 57) @ pos y
		imageNo: 0
		at: 0 @ 0
		extent: 16 @ -16
		transparentColor: 13.
	engine
		blt: (pos x + 76) @ pos y
		imageNo: 0
		at: 0 @ 0
		extent: -16 @ -16
		transparentColor: 13
]

{ #category : #private }
Sample03 >> drawTestBltTilemap: aPoint [
	engine
		text: 'bltm(x,y,tm,u,v,
     w,h,[colkey])'
		at: aPoint
		color: 7.
	engine
		blt: aPoint + (0 @ 15)
		tilemapNo: 0
		at: 0 @ 0
		extent: 88 @ 16
		transparentColor: 2
]

{ #category : #private }
Sample03 >> drawTestCircle: aPoint [
	| p |
	engine text: 'circ(x,y,r,col)' at: aPoint color: 7.
	p := aPoint + (4 @ 15).
	0 to: 7 do:
		[ :each | engine circle: p + ((each * 8) @ 0) radius: each color: each + 8 ]
]

{ #category : #private }
Sample03 >> drawTestCircleFrame: aPoint [
	| p |
	engine text: 'circb(x,y,r,col)' at: aPoint color: 7.
	p := aPoint + (4 @ 15).
	0 to: 7 do:
		[ :each | engine circleFrame: p + ((each * 8) @ 0) radius: each color: each + 8 ]
]

{ #category : #private }
Sample03 >> drawTestClip [
	| pos extent |
	engine resetClip.
	clipTestIsEnabled
		ifFalse: [ ^ self ].
	pos := ((engine sin: engine frameCount * 1.14) * 39 + 40)
		@ ((engine sin: engine frameCount * 1.71) * 29 + 30).
	pos := pos truncated.
	extent := 120 @ 90.
	engine text: 'clip(x,y,w,h)' at: pos x @ (pos y - 8) color: 14.
	engine rectFrame: pos - 1 extent: extent + 2 color: 14.
	engine clip: pos extent: extent
]

{ #category : #private }
Sample03 >> drawTestCls: aPoint [
	engine cls: 5.
	engine text: 'cls(col)' at: aPoint color: 7
]

{ #category : #private }
Sample03 >> drawTestLine: aPoint [
	| pos col |
	engine text: 'line(x1,y1,x2,y2,col)' at: aPoint color: 7.
	pos := aPoint + (4 @ 9).
	col := 5.
	0 to: 2 do: [ :each | 
		engine
			line: pos + (0 @ (each * 8))
			to: pos + (48 @ (each * 8))
			color: col.
		col := col + 1 ].
	0 to: 3 do: [ :each | 
		engine
			line: pos + ((each * 16) @ 0)
			to: pos + ((each * 16) @ 16)
			color: col.
		col := col + 1 ].
	0 to: 3 do: [ :each | 
		engine
			line: pos + ((each * 16) @ 0)
			to: pos + (((3 - each) * 16) @ 16)
			color: col.
		col := col + 1 ]
]

{ #category : #private }
Sample03 >> drawTestPalette1 [
	palTestIsEnabled
		ifFalse: [ ^ self ].
	engine setPalette: 5 to: 2.
	engine setPalette: 12 to: 7.
	engine setPalette: 7 to: 10
]

{ #category : #private }
Sample03 >> drawTestPalette2: aPoint [
	engine text: 'pal(col1,col2)' at: aPoint color: 12.
	engine resetPalette
]

{ #category : #private }
Sample03 >> drawTestPset: aPoint [
	| pos |
	engine text: 'pset(x,y,col)' at: aPoint color: 7.
	pos := aPoint + (4 @ 10).
	0 to: 15 do:
		[ :each | engine pixelAt: (pos x + (each * 2)) @ pos y put: each ]
]

{ #category : #private }
Sample03 >> drawTestRect: aPoint [
	| p |
	engine text: 'rect(x,y,w,h,col)' at: aPoint color: 7.
	p := aPoint + (4 @ 16).
	0 to: 7 do: [ :each | 
		engine
			rect: p + ((each * 8) @ each negated)
			extent: (each + 1) @ (each + 1)
			color: each + 8 ]
]

{ #category : #private }
Sample03 >> drawTestRectFrame: aPoint [
	| p |
	engine text: 'rectb(x,y,w,h,col)' at: aPoint color: 7.
	p := aPoint + (4 @ 16).
	0 to: 7 do: [ :each | 
		engine
			rectFrame: p + ((each * 8) @ each negated)
			extent: (each + 1) @ (each + 1)
			color: each + 8 ]
]

{ #category : #private }
Sample03 >> drawTestText: aPoint [
	| s |
	engine text: 'text(x,y,s,col)' at: aPoint color: 7.
	s := 'Elapsed frame count is ' , engine frameCount asString
		,
			'
Current mouse position is (' , engine mousePosition x asString , ','
		, engine mousePosition y asString , ')'.
	engine text: s at: aPoint + (4 @ 9) color: 1.
	engine text: s at: aPoint + (4 @ 8) color: 9
]

{ #category : #api }
Sample03 >> init [
	engine
		extent: 200 @ 150;
		title: 'Draw API';
		init.
	engine showMouse: true.
	(engine imageAt: 0) importForm: self class cat16x16 at: 0 @ 0.
	(engine imageAt: 1) importForm: self class tileset24x32 at: 0 @ 0.
	(engine tilemapAt: 0)
		importStrings: self class tilemap0 at: 0 @ 0;
		imageNo: 1.
	palTestIsEnabled := false.
	clipTestIsEnabled := false
]

{ #category : #accessing }
Sample03 >> palTestIsEnabled [
	^ palTestIsEnabled
]

{ #category : #accessing }
Sample03 >> palTestIsEnabled: anObject [
	palTestIsEnabled := anObject
]

{ #category : #api }
Sample03 >> update [
	(engine isPressing: (RetroGameInputs key: $Q))
		ifTrue: [ self quit ].
	palTestIsEnabled := engine frameCount // 30 \\ 10 >= 5.
	clipTestIsEnabled := engine isPressing: RetroGameInputs space
]
