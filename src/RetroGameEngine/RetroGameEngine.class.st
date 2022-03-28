Class {
	#name : #RetroGameEngine,
	#superclass : #Object,
	#instVars : [
		'screen',
		'inputs',
		'imageBanks',
		'tileMaps',
		'title',
		'frameCount',
		'palette',
		'random',
		'camera'
	],
	#category : #'RetroGameEngine-Core'
}

{ #category : #constants }
RetroGameEngine class >> fontExtent [
	^ self fontWidth @ self fontHeight
]

{ #category : #constants }
RetroGameEngine class >> fontHeight [
	^ 6
]

{ #category : #constants }
RetroGameEngine class >> fontWidth [
	^ 4
]

{ #category : #constants }
RetroGameEngine class >> pixelColors [
	^ {(Color fromHexString: '000000').
	(Color fromHexString: '2B335F').
	(Color fromHexString: '7E2072').
	(Color fromHexString: '19959C').
	(Color fromHexString: '8B4852').
	(Color fromHexString: '395C98').
	(Color fromHexString: 'A9C1FF').
	(Color fromHexString: 'EEEEEE').
	(Color fromHexString: 'D4186C').
	(Color fromHexString: 'D38441').
	(Color fromHexString: 'E9C35B').
	(Color fromHexString: '70C6A9').
	(Color fromHexString: '7696DE').
	(Color fromHexString: 'A3A3A3').
	(Color fromHexString: 'FF9798').
	(Color fromHexString: 'EDC7B0')}
]

{ #category : #'screen api' }
RetroGameEngine >> blt: aPoint image: anImage at: aPoint3 extent: aPoint4 transparentColor: anIntegerOrNil [
	RetroGameBitBlt new
		sourceArray: anImage array;
		sourcePoint: aPoint3 truncated;
		sourceExtent: anImage extent;
		destArray: screen array;
		destPoint: (aPoint - camera) truncated;
		destMask: screen mask;
		destExtent: screen extent;
		clipExtent: aPoint4 truncated;
		transparentColor: anIntegerOrNil;
		copyBits
]

{ #category : #'screen api' }
RetroGameEngine >> blt: aPoint imageBank: anInteger at: aPoint3 extent: aPoint4 transparentColor: anIntegerOrNil [
	| image |
	image := imageBanks at: anInteger + 1.
	self blt: aPoint image: image at: aPoint3 extent: aPoint4 transparentColor: anIntegerOrNil
]

{ #category : #'screen api' }
RetroGameEngine >> blt: aPoint tileMap: anInteger at: aPoint3 extent: aPoint4 transparentColor: anIntegerOrNil [
	| tileMapPoint tileMapExtent tileMap image pos |
	tileMapPoint := aPoint3 // 8.
	tileMapExtent := (aPoint4 abs / 8) ceiling.
	pos := aPoint3 \\ 8.
	tileMap := self tileMap: anInteger.
	image := (self imageBank: tileMap imageBank)
		buildImageOfTileMap: tileMap
		at: tileMapPoint
		extent: tileMapExtent.
	RetroGameBitBlt new
		sourceArray: image array;
		sourceExtent: image extent;
		sourcePoint: pos;
		destArray: screen array;
		destMask: screen mask;
		destExtent: screen extent;
		destPoint: (aPoint - camera) truncated;
		clipExtent: aPoint4;
		transparentColor: anIntegerOrNil;
		copyBits
]

{ #category : #accessing }
RetroGameEngine >> camera [
	^ camera
]

{ #category : #accessing }
RetroGameEngine >> camera: aPoint [
	camera := aPoint
]

{ #category : #api }
RetroGameEngine >> ceil: aNumber [
	^ aNumber ceiling
]

{ #category : #'screen api' }
RetroGameEngine >> circle: aPoint radius: anInteger color: anInteger3 [
	| points max p |
	anInteger < 1
		ifTrue: [ ^ self pixelAt: aPoint put: anInteger3 ].
	points := OrderedCollection new.
	screen quarterArcRadius: anInteger into: points.
	max := Array new: anInteger + 1 withAll: nil.
	points
		do: [ :each | 
			p := each y + 1.
			((max at: p) isNil or: [ each x > (max at: p) ])
				ifTrue: [ max at: p put: each x ] ].
	max
		withIndexDo: [ :each :index | 
			self
				hLine: aPoint truncated + (each negated @ (index - 1))
				length: each * 2 + 1
				color: anInteger3.
			self
				hLine: aPoint truncated + (each negated @ (1 - index))
				length: each * 2 + 1
				color: anInteger3 ]
]

{ #category : #'screen api' }
RetroGameEngine >> circleFrame: aPoint radius: anInteger color: anInteger3 [
	| points |
	anInteger < 1
		ifTrue: [ ^ self pixelAt: aPoint put: anInteger3 ].	points := OrderedCollection new.
	screen quarterArcRadius: anInteger into: points.
	points
		do: [ :each | 
			self pixelAt: aPoint + each put: anInteger3.
			self pixelAt: aPoint + (each x @ each y negated) put: anInteger3.
			self pixelAt: aPoint + (each x negated @ each y) put: anInteger3.
			self pixelAt: aPoint + each negated put: anInteger3 ]
]

{ #category : #'screen api' }
RetroGameEngine >> clip: aPoint extent: aPoint2 [
	screen clip: aPoint extent: aPoint2
]

{ #category : #'screen api' }
RetroGameEngine >> cls: anInteger [
	| c |
	c := palette at: anInteger + 1.
	screen cls: c
]

{ #category : #accessing }
RetroGameEngine >> colors [
	^ screen colors
]

{ #category : #accessing }
RetroGameEngine >> colors: anObject [
	screen colors: anObject
]

{ #category : #api }
RetroGameEngine >> cos: aNumber [
	^ aNumber degreesToRadians cos
]

{ #category : #api }
RetroGameEngine >> displayInfo [
	^ Array with: screen array with: screen extent with: screen colors
]

{ #category : #'screen api' }
RetroGameEngine >> ellipse: aPoint extent: aPoint2 color: anInteger [
	screen ellipse: aPoint extent: aPoint2 color: anInteger
]

{ #category : #'screen api' }
RetroGameEngine >> ellipseFrame: aPoint extent: aPoint2 color: anInteger [
	screen ellipseFrame: aPoint extent: aPoint2 color: anInteger
]

{ #category : #api }
RetroGameEngine >> extent [
	^ screen extent
]

{ #category : #api }
RetroGameEngine >> extent: aPoint [
	screen extent: aPoint
]

{ #category : #'screen api' }
RetroGameEngine >> fill: aPoint color: anInteger [
	screen fill: aPoint color: anInteger
]

{ #category : #api }
RetroGameEngine >> floor: aNumber [
	^ aNumber floor
]

{ #category : #api }
RetroGameEngine >> form [
	^ screen form
]

{ #category : #accessing }
RetroGameEngine >> frameCount [
	^ frameCount
]

{ #category : #accessing }
RetroGameEngine >> frameCount: anObject [
	frameCount := anObject
]

{ #category : #'screen api' }
RetroGameEngine >> hLine: aPoint length: anInteger color: anInteger2 [
	screen
		hLine: (aPoint - camera) truncated
		length: anInteger truncated
		color: anInteger2
]

{ #category : #api }
RetroGameEngine >> height [
	^ screen extent y
]

{ #category : #api }
RetroGameEngine >> imageBank: anInteger [
	^ imageBanks at: anInteger + 1
]

{ #category : #accessing }
RetroGameEngine >> imageBanks [
	^ imageBanks
]

{ #category : #accessing }
RetroGameEngine >> imageBanks: anObject [
	imageBanks := anObject
]

{ #category : #api }
RetroGameEngine >> incrementFrameCount [
	frameCount := frameCount + 1
]

{ #category : #api }
RetroGameEngine >> init [
	screen init.
	inputs init.
	imageBanks
		do: [ :each | 
			each
				colors: screen colors;
				init ].
	tileMaps
		do: [ :each | 
			each
				extent: screen extent;
				init ]
]

{ #category : #initialization }
RetroGameEngine >> initialize [
	frameCount := 0.
	screen := RetroGameScreen new.
	inputs := RetroGameInputs new.
	random := SharedRandom globalGenerator.
	self setupColors.
	self resetPalette.
	self setupImageBanks.
	self setupTileMaps.
	self resetCamera
]

{ #category : #accessing }
RetroGameEngine >> inputs [
	^ inputs
]

{ #category : #accessing }
RetroGameEngine >> inputs: anObject [
	inputs := anObject
]

{ #category : #'input api' }
RetroGameEngine >> isPressed: aKey [
	^ inputs isPressed: aKey
]

{ #category : #'input api' }
RetroGameEngine >> isPressing: aKey [
	^ inputs isPressing: aKey
]

{ #category : #'input api' }
RetroGameEngine >> isReleased: aKey [
	^ inputs isReleased: aKey
]

{ #category : #'input api' }
RetroGameEngine >> keyDown: anInteger [
	inputs keyDown: anInteger
]

{ #category : #'input api' }
RetroGameEngine >> keyUp: anInteger [
	inputs keyUp: anInteger
]

{ #category : #'screen api' }
RetroGameEngine >> line: aPoint to: aPoint2 color: anInteger [
	(aPoint y = aPoint2 y and: [ aPoint x = aPoint2 x ])
		ifTrue: [ ^ self pixelAt: aPoint put: anInteger ].
	aPoint y = aPoint2 y
		ifTrue: [ ^ aPoint x < aPoint2 x
				ifTrue: [ self hLine: aPoint length: aPoint2 x - aPoint x color: anInteger ]
				ifFalse: [ self hLine: aPoint2 length: aPoint x - aPoint2 x color: anInteger ] ].
	aPoint x = aPoint2 x
		ifTrue: [ ^ aPoint y < aPoint2 y
				ifTrue: [ self vLine: aPoint length: aPoint2 y - aPoint y color: anInteger ]
				ifFalse: [ self vLine: aPoint2 length: aPoint y - aPoint2 y color: anInteger ] ].
	screen
		line: (aPoint - camera) truncated
		to: (aPoint2 - camera) truncated
		color: anInteger
]

{ #category : #'input api' }
RetroGameEngine >> mousePosition [
	^ inputs mousePosition
]

{ #category : #'input api' }
RetroGameEngine >> mousePosition: aPoint [
	inputs mousePosition: aPoint
]

{ #category : #accessing }
RetroGameEngine >> palette [
	^ palette
]

{ #category : #accessing }
RetroGameEngine >> palette: anObject [
	palette := anObject
]

{ #category : #'screen api' }
RetroGameEngine >> pixelAt: aPoint [
	^ screen pixelAt: (aPoint - camera) truncated
]

{ #category : #'screen api' }
RetroGameEngine >> pixelAt: aPoint put: anInteger [
	| c |
	c := palette at: anInteger + 1.
	screen pixelAt: (aPoint - camera) truncated put: c
]

{ #category : #accessing }
RetroGameEngine >> random [
	^ random
]

{ #category : #accessing }
RetroGameEngine >> random: anObject [
	random := anObject
]

{ #category : #api }
RetroGameEngine >> randomFloatFrom: aNumber to: aNumber2 [
	^ random next * (aNumber2 - aNumber) + aNumber
]

{ #category : #api }
RetroGameEngine >> randomFrom: anInteger to: anInteger2 [
	^ (anInteger to: anInteger2) atRandom: random
]

{ #category : #'screen api' }
RetroGameEngine >> realColor: anInteger [
	^ screen realColor: anInteger
]

{ #category : #'screen api' }
RetroGameEngine >> rect: aPoint extent: aPoint2 color: anInteger [
	screen
		rect: (aPoint - camera) truncated
		extent: aPoint2 truncated
		color: anInteger
]

{ #category : #'screen api' }
RetroGameEngine >> rectFrame: aPoint extent: aPoint2 color: anInteger [
	screen
		rectFrame: (aPoint - camera) truncated
		extent: aPoint2 truncated
		color: anInteger
]

{ #category : #api }
RetroGameEngine >> resetCamera [
	camera := 0 @ 0
]

{ #category : #'screen api' }
RetroGameEngine >> resetClip [
	screen resetClip
]

{ #category : #api }
RetroGameEngine >> resetPalette [
	palette := (0 to: self class pixelColors size - 1) asArray
]

{ #category : #accessing }
RetroGameEngine >> screen [
	^ screen
]

{ #category : #accessing }
RetroGameEngine >> screen: anObject [
	screen := anObject
]

{ #category : #api }
RetroGameEngine >> setPalette: anInteger to: anInteger2 [
	palette at: anInteger + 1 put: anInteger2
]

{ #category : #api }
RetroGameEngine >> setRandomSeed: anInteger [
	random := anInteger = 0
		ifTrue: [ SharedRandom globalGenerator ]
		ifFalse: [ Random seed: anInteger ]
]

{ #category : #private }
RetroGameEngine >> setupColors [
	screen colors: self class pixelColors
]

{ #category : #private }
RetroGameEngine >> setupImageBanks [
	imageBanks := (Array new: 3)
		collect: [ :each | RetroGameImage new ]
]

{ #category : #private }
RetroGameEngine >> setupTileMaps [
	tileMaps := (Array new: 8) collect: [ :each | RetroGameTileMap new ]
]

{ #category : #api }
RetroGameEngine >> showMouse: aBoolean [
	self
]

{ #category : #api }
RetroGameEngine >> sin: aNumber [
	^ aNumber degreesToRadians sin
]

{ #category : #api }
RetroGameEngine >> sqrt: aNumber [
	^ aNumber sqrt
]

{ #category : #'screen api' }
RetroGameEngine >> text: aString at: aPoint color: anInteger [
	| pos c orgX |
	c := palette at: anInteger + 1.
	pos := (aPoint - camera) truncated.
	orgX := pos x.
	aString
		do: [ :each | 
			each = Character cr
				ifTrue: [ pos := orgX @ (pos y + screen characterExtent y + 1) ]
				ifFalse: [ screen character: each at: pos color: c.
					pos := (pos x + screen characterExtent x + 1) @ pos y ] ]
]

{ #category : #api }
RetroGameEngine >> tileMap: anInteger [
	^ tileMaps at: anInteger + 1
]

{ #category : #accessing }
RetroGameEngine >> tileMaps [
	^ tileMaps
]

{ #category : #accessing }
RetroGameEngine >> tileMaps: anObject [
	tileMaps := anObject
]

{ #category : #accessing }
RetroGameEngine >> title [
	^ title
]

{ #category : #accessing }
RetroGameEngine >> title: aString [
	title := aString
]

{ #category : #'screen api' }
RetroGameEngine >> triangle: aPoint with: aPoint2 with: aPoint3 color: anInteger [
	| list px p1 p2 p3 |
	p1 := (aPoint - camera) truncated.
	p2 := (aPoint2 - camera) truncated.
	p3 := (aPoint3 - camera) truncated.
	p1 y = p2 y
		ifTrue: [ ^ screen
				triangle: p3
				p2: p1
				x3: p2 x
				color: anInteger ].
	p2 y = p3 y
		ifTrue: [ ^ screen
				triangle: p1
				p2: p2
				x3: p3 x
				color: anInteger ].
	p1 y = p3 y
		ifTrue: [ ^ screen
				triangle: p2
				p2: p1
				x3: p3 x
				color: anInteger ].
	list := {p1.
	p2.
	p3} sort: [ :a :b | a y < b y ].
	list first x = list last x
		ifTrue: [ screen
				triangle: list first
				p2: list second
				x3: list first x
				color: anInteger.
			screen
				triangle: list last
				p2: list second
				x3: list first x
				color: anInteger.
			^ self ].
	px := ((list second y - list first y) * list third x
		- ((list second y - list third y) * list first x))
		/ (list third y - list first y).
	screen
		triangle: list first
		p2: list second
		x3: px rounded
		color: anInteger.
	screen
		triangle: list third
		p2: list second
		x3: px rounded
		color: anInteger
]

{ #category : #'screen api' }
RetroGameEngine >> triangleFrame: aPoint with: aPoint2 with: aPoint3 color: anInteger [
	self line: aPoint to: aPoint2 color: anInteger.
	self line: aPoint2 to: aPoint3 color: anInteger.
	self line: aPoint3 to: aPoint color: anInteger
]

{ #category : #'input api' }
RetroGameEngine >> updateInputs [
	inputs update
]

{ #category : #'screen api' }
RetroGameEngine >> vLine: aPoint length: anInteger color: anInteger2 [
	screen
		vLine: (aPoint - camera) truncated
		length: anInteger truncated
		color: anInteger2
]

{ #category : #api }
RetroGameEngine >> width [
	^ screen extent x
]
