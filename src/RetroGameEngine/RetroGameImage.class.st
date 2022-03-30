Class {
	#name : #RetroGameImage,
	#superclass : #Object,
	#instVars : [
		'array',
		'colors',
		'extent',
		'characters'
	],
	#classVars : [
		'DefaultCharacters'
	],
	#category : #'RetroGameEngine-Core'
}

{ #category : #accessing }
RetroGameImage class >> asciiCharacterForm [
	^ Form
		extent: 192 @ 5
		depth: 32
		fromArray:
			#(0 0 0 0 4294967295 0 4294967295 0 4294967295 4294967295 0 4294967295 0 4294967295 0 0 0 4294967295 4294967295 4294967295 4294967295 0 4294967295 0 0 0 4294967295 4294967295 0 0 4294967295 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 4294967295 0 0 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 4294967295 4294967295 4294967295 4294967295 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 0 0 4294967295 0 0 0 4294967295 0 0 4294967295 4294967295 4294967295 0 0 0 0 4294967295 0 4294967295 4294967295 0 0 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 4294967295 0 4294967295 4294967295 4294967295 4294967295 0 4294967295 4294967295 4294967295 0 4294967295 4294967295 0 0 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 4294967295 4294967295 0 4294967295 4294967295 4294967295 0 0 4294967295 4294967295 0 4294967295 0 0 0 0 0 0 0 0 0 4294967295 0 4294967295 0 4294967295 4294967295 4294967295 4294967295 0 4294967295 4294967295 4294967295 4294967295 0 4294967295 0 0 0 4294967295 0 0 4294967295 0 0 4294967295 0 0 4294967295 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 4294967295 0 4294967295 4294967295 4294967295 0 0 0 4294967295 0 0 4294967295 4294967295 0 4294967295 4294967295 0 0 4294967295 0 0 0 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 0 4294967295 0 0 4294967295 0 0 4294967295 0 4294967295 4294967295 4294967295 0 4294967295 0 0 0 4294967295 4294967295 4294967295 0 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 0 4294967295 0 0 4294967295 0 0 4294967295 0 4294967295 0 4294967295 0 0 0 4294967295 4294967295 4294967295 0 4294967295 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 0 0 4294967295 0 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 0 0 4294967295 0 4294967295 0 0 4294967295 0 0 4294967295 4294967295 0 4294967295 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 4294967295 0 4294967295 4294967295 4294967295 0 0 4294967295 0 4294967295 4294967295 0 0 0 0 0 4294967295 0 0 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 4294967295 0 4294967295 4294967295 4294967295 0 0 0 0 4294967295 0 4294967295 0 4294967295 0 4294967295 0 4294967295 4294967295 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 0 0 4294967295 0 0 0 0 0 0 0 4294967295 0 4294967295 0 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 4294967295 0 0 4294967295 0 4294967295 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 4294967295 0 0 0 4294967295 4294967295 4294967295 0 4294967295 0 0 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 0 4294967295 4294967295 4294967295 4294967295 0 4294967295 0 0 4294967295 0 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 0 4294967295 0 0 4294967295 0 0 4294967295 0 0 4294967295 0 0 4294967295 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4294967295 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 0 4294967295 0 0 4294967295 0 0 4294967295 0 0 4294967295 0 0 4294967295 0 0 0 0 4294967295 4294967295 0 0 4294967295 0 4294967295 0 4294967295 0 4294967295 0 4294967295 0 0 0 0 4294967295 0 0 4294967295 0 0 4294967295 4294967295 0 4294967295 0 4294967295 0 4294967295 0 4294967295 0 0 4294967295 0 4294967295 0 0 4294967295 0 0 4294967295 0 4294967295 4294967295 4294967295 0 4294967295 0 0 0 0 4294967295 4294967295 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 0 4294967295 0 0 4294967295 0 4294967295 4294967295 0 4294967295 0 4294967295 0 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 0 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 0 4294967295 0 4294967295 0 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 0 4294967295 0 4294967295 0 4294967295 0 0 0 4294967295 0 0 4294967295 0 0 4294967295 0 0 0 0 0 0 0 0 0 0 0 4294967295 0 0 0 0 4294967295 0 4294967295 0 4294967295 0 4294967295 0 0 4294967295 0 4294967295 0 0 0 0 0 4294967295 4294967295 0 0 4294967295 0 4294967295 0 0 0 4294967295 0 0 0 0 0 4294967295 4294967295 0 4294967295 0 0 0 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 4294967295 0 4294967295 0 4294967295 4294967295 4294967295 0 0 4294967295 0 0 0 4294967295 0 0 0 0 4294967295 0 0 0 4294967295 0 0 0 4294967295 0 0 0 4294967295 4294967295 0 4294967295 4294967295 4294967295 0 0 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 4294967295 4294967295 0 0 4294967295 4294967295 4294967295 4294967295 0 4294967295 4294967295 4294967295 4294967295 0 4294967295 0 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 0 4294967295 4294967295 0 4294967295 4294967295 4294967295 4294967295 4294967295 0 0 4294967295 4294967295 4294967295 4294967295 0 4294967295 4294967295 4294967295 0 0 4294967295 0 4294967295 4294967295 4294967295 0 4294967295 0 4294967295 0 4294967295 4294967295 0 4294967295 0 4294967295 0 4294967295 4294967295 4294967295 0 4294967295 4294967295 0 0 4294967295 4294967295 4294967295 0 0 0 0 4294967295 4294967295 4294967295)
		offset: 0 @ 0
]

{ #category : #private }
RetroGameImage class >> buildCharacters [
	| form size c list |
	form := self asciiCharacterForm.
	size := form width / self characterExtent x.
	^ (Array new: size)
		withIndexCollect: [ :each :index | 
			list := OrderedCollection new.
			0 to: self characterExtent y - 1 do: [ :y | 
				0 to: self characterExtent x - 1 do: [ :x | 
					c := form colorAt: ((index - 1) * self characterExtent x + x) @ y.
					list
						add:
							(c = Color transparent
								ifTrue: [ 0 ]
								ifFalse: [ 1 ]) ] ].
			list asArray asByteArray ]
]

{ #category : #private }
RetroGameImage class >> characterExtent [
	^ 3 @ 5
]

{ #category : #accessing }
RetroGameImage class >> characters [
	^ DefaultCharacters ifNil: [ DefaultCharacters := self buildCharacters ]
]

{ #category : #private }
RetroGameImage class >> reset [
	DefaultCharacters := nil
]

{ #category : #private }
RetroGameImage >> adjustX: aNumber width: aNumber2 [
	| x c |
	x := aNumber asInteger.
	c := aNumber2 asInteger.
	x < 0
		ifTrue: [ c := c + x.
			x := 0 ].
	c < 1
		ifTrue: [ ^ nil ].
	x + c >= extent x
		ifTrue: [ c := extent x - x ].
	c < 1
		ifTrue: [ ^ nil ].
	^ Array with: x with: c
]

{ #category : #private }
RetroGameImage >> adjustY: aNumber height: aNumber2 [
	| y c |
	y := aNumber asInteger.
	c := aNumber2 asInteger.
	y < 0
		ifTrue: [ c := c + y.
			y := 0 ].
	c < 1
		ifTrue: [ ^ nil ].
	y + c >= extent y
		ifTrue: [ c := extent y - y ].
	c < 1
		ifTrue: [ ^ nil ].
	^ Array with: y with: c
]

{ #category : #accessing }
RetroGameImage >> array [
	^ array
]

{ #category : #accessing }
RetroGameImage >> array: anObject [
	array := anObject
]

{ #category : #private }
RetroGameImage >> arrayOf: aCharacter [
	aCharacter <= Character space
		ifTrue: [ ^ characters first ].
	aCharacter isLowercase
		ifTrue: [ ^ characters at: aCharacter asUppercase asciiValue - 31 ].
	aCharacter > $_
		ifTrue: [ ^ characters first ].
	^ characters at: aCharacter asciiValue - 31
]

{ #category : #accessing }
RetroGameImage >> arrayString [
	| w index |
	array ifNil: [ ^ '' ].
	w := WriteStream on: String new.
	index := 1.
	extent y
		timesRepeat: [ extent x
				timesRepeat: [ w nextPut: (array at: index) asHexDigit.
					index := index + 1 ].
			w nextPut: Character cr ].
	^ w contents
]

{ #category : #api }
RetroGameImage >> bothEndsOf: aCollection height: anInteger [
	| list p end |
	list := (Array new: anInteger) collect: [ :each | Array new: 2 ].
	aCollection
		do: [ :each | 
			p := each y + 1.
			end := list at: p.
			(end first isNil or: [ each x < end first ])
				ifTrue: [ end at: 1 put: each x ].
			(end second isNil or: [ each x > end second ])
				ifTrue: [ end at: 2 put: each x ] ].
	^ list
]

{ #category : #api }
RetroGameImage >> buildImageOfTilemap: aTileMap at: aPoint extent: aPoint4 [
	| dest pair |
	dest := self class new
		extent: aPoint4 * 8;
		init.
	0 to: aPoint4 y - 1 do: [ :dy | 
		0 to: aPoint4 x - 1 do: [ :dx | 
			pair := aTileMap pairAt: aPoint + (dx @ dy).
			RetroGameBitBlt new
				sourceArray: array;
				sourceExtent: extent;
				sourcePoint: pair * 8;
				destArray: dest array;
				destExtent: dest extent;
				destPoint: dx @ dy * 8;
				clipExtent: 8 @ 8;
				copyBits ] ].
	^ dest
]

{ #category : #private }
RetroGameImage >> character: aCharacter at: aPoint color: anInteger [
	| arr trColor |
	trColor := 0.
	arr := self arrayOf: aCharacter.
	anInteger = 0
		ifTrue: [ trColor := 1.
			arr := arr collect: [ :each | 1 - each ] ]
		ifFalse: [ arr := arr collect: [ :each | each * anInteger ] ].
	RetroGameBitBlt new
		destArray: array;
		destMask: self mask;
		destExtent: extent;
		destPoint: aPoint;
		sourceArray: arr;
		sourceExtent: self characterExtent;
		clipExtent: self characterExtent;
		sourcePoint: 0 @ 0;
		transparentColor: trColor;
		copyBits
]

{ #category : #private }
RetroGameImage >> characterExtent [
	^ self class characterExtent
]

{ #category : #accessing }
RetroGameImage >> characters [
	^ characters
]

{ #category : #accessing }
RetroGameImage >> characters: anObject [
	characters := anObject
]

{ #category : #api }
RetroGameImage >> cls: anInteger [
	array atAllPut: anInteger
]

{ #category : #accessing }
RetroGameImage >> colors [
	^ colors
]

{ #category : #accessing }
RetroGameImage >> colors: aCollection [
	colors := aCollection
]

{ #category : #testing }
RetroGameImage >> containsPoint: aPoint [
	^ (aPoint x between: 0 and: extent x - 1)
		and: [ aPoint y between: 0 and: extent y - 1 ]
]

{ #category : #api }
RetroGameImage >> ellipse: aPoint extent: aPoint2 color: anInteger [
	| points bothEnds |
	points := self ellipsePointsExtent: aPoint2.
	bothEnds := self bothEndsOf: points height: aPoint2 y.
	bothEnds
		withIndexDo: [ :each :index | 
			self
				hLine: aPoint truncated + (each first @ (index - 1))
				length: each second - each first + 1
				color: anInteger ]
]

{ #category : #api }
RetroGameImage >> ellipseFrame: aPoint extent: aPoint2 color: anInteger [
	| points |
	points := self ellipsePointsExtent: aPoint2.
	points do: [ :each | self pixelAt: aPoint + each put: anInteger ]
]

{ #category : #private }
RetroGameImage >> ellipsePointsExtent: aPoint2 [
	| list pos offset points |
	offset := 1 - (aPoint2 \\ 2).
	pos := aPoint2 // 2.
	list := OrderedCollection new.
	self ellipseRadius: pos into: list.
	points := OrderedCollection new.
	list
		do: [ :each | 
			| x y1 y x1 |
			x := each first.
			y1 := each second.
			y := each third.
			x1 := each fourth.
			points add: pos + (x negated @ y1 negated).
			points add: pos + (y negated @ x1 negated).
			points add: pos + ((x - offset x) @ y1 negated).
			points add: pos + ((y - offset x) @ x1 negated).
			points add: pos + (x negated @ (y1 - offset y)).
			points add: pos + (y negated @ (x1 - offset y)).
			points add: pos + (x @ y1) - offset.
			points add: pos + (y @ x1) - offset ].
	^ points
]

{ #category : #private }
RetroGameImage >> ellipseRadius: aPoint2 into: aCollection [
	| x x1 y y1 r rx ry |
	rx := aPoint2 x.
	ry := aPoint2 y.
	y := 0.
	rx > ry
		ifTrue: [ x := r := rx.
			[ x >= y ]
				whileTrue: [ x1 := x * ry // rx.
					y1 := y * ry // rx.
					aCollection
						add:
							{x.
							y1.
							y.
							x1}.
					r := r - (y * 2) - 1.
					y := y + 1.
					r < 0
						ifTrue: [ r := (r + (x - 1)) * 2.
							x := x - 1 ] ] ]
		ifFalse: [ x := r := ry.
			[ x >= y ]
				whileTrue: [ x1 := x * rx // ry.
					y1 := y * rx // ry.
					aCollection
						add:
							{x1.
							y.
							y1.
							x}.
					r := r - (y * 2) - 1.
					y := y + 1.
					r < 0
						ifTrue: [ r := (r + (x - 1)) * 2.
							x := x - 1 ] ] ]
]

{ #category : #accessing }
RetroGameImage >> extent [
	^ extent
]

{ #category : #accessing }
RetroGameImage >> extent: anObject [
	extent := anObject
]

{ #category : #api }
RetroGameImage >> fill: aPoint color: anInteger [
	| list pos c |
	c := self pixelAt: aPoint.
	list := OrderedCollection new.
	list add: aPoint.
	[ list notEmpty ]
		whileTrue: [ pos := list removeFirst.
			(self pixelAt: pos) ~= anInteger
				ifTrue: [ pos := self scanLeft: pos color: c.
					self
						scanRight: pos
						color: c
						fillColor: anInteger
						into: list ] ]
]

{ #category : #api }
RetroGameImage >> form [
	| arr |
	array ifNil: [ ^ nil ].
	arr := array asArray
		collect: [ :each | (colors at: each + 1) pixelValueForDepth: 32 ].
	^ Form
		extent: extent
		depth: 32
		fromArray: arr
		offset: 0 @ 0
]

{ #category : #api }
RetroGameImage >> hLine: aPoint length: anInteger color: anInteger2 [
	| index r |
	(aPoint y between: 0 and: extent y - 1)
		ifFalse: [ ^ self ].
	r := self adjustX: aPoint x width: anInteger.
	r ifNil: [ ^ self ].
	index := self indexOf: r first @ aPoint y.
	self hLineFrom: index length: r second color: anInteger2
]

{ #category : #private }
RetroGameImage >> hLineFrom: anInteger length: anInteger2 color: anInteger3 [
	anInteger to: anInteger + anInteger2 - 1 do: [ :index | array at: index put: anInteger3 ]
]

{ #category : #api }
RetroGameImage >> importForm: aForm at: aPoint [
	| w h c i |
	w := aForm width.
	h := aForm height.
	0 to: h - 1 do: [ :y | 
		0 to: w - 1 do: [ :x | 
			c := aForm colorAt: x @ y.
			i := self nearestColorIndexOf: c.
			self pixelAt: x @ y put: i ] ]
]

{ #category : #api }
RetroGameImage >> importString: aString at: aPoint [
	| x y |
	aString isEmpty
		ifTrue: [ ^ self ].
	y := aPoint y.
	aString lines
		do: [ :each | 
			x := aPoint x.
			each
				do: [ :v | 
					self pixelAt: x @ y put: v digitValue.
					x := x + 1 ].
			y := y + 1 ]
]

{ #category : #api }
RetroGameImage >> indexOf: aPoint [
	^ aPoint y * extent x + aPoint x + 1
]

{ #category : #api }
RetroGameImage >> init [
	array := ByteArray new: extent x * extent y
]

{ #category : #initialization }
RetroGameImage >> initialize [
	extent := 256 @ 256.
	characters := self class characters
]

{ #category : #api }
RetroGameImage >> line: aPoint to: aPoint2 color: anInteger [
	| delta sign err err2 pos |
	delta := (aPoint2 - aPoint) abs.
	sign := (aPoint2 - aPoint) sign.
	err := delta x - delta y.
	pos := aPoint.
	[ self pixelAt: pos put: anInteger.
	pos = aPoint2
		ifTrue: [ ^ self ].
	err2 := 2 * err.
	err2 > delta y negated
		ifTrue: [ err := err - delta y.
			pos := (pos x + sign x) @ pos y ].
	err2 < delta x
		ifTrue: [ err := err + delta x.
			pos := pos x @ (pos y + sign y) ] ] repeat
]

{ #category : #private }
RetroGameImage >> line: aPoint to: aPoint2 into: aCollection [
	| delta sign err err2 pos pair |
	delta := (aPoint2 - aPoint) abs.
	sign := (aPoint2 - aPoint) sign.
	err := delta x - delta y.
	pos := aPoint.
	[ pair := aCollection
		at:
			(sign y > 0
				ifTrue: [ pos y - aPoint y + 1 ]
				ifFalse: [ aPoint y - pos y + 1 ]).
	(pair first isNil or: [ pos x < pair first ])
		ifTrue: [ pair at: 1 put: pos x ].
	(pair second isNil or: [ pos x > pair second ])
		ifTrue: [ pair at: 2 put: pos x ].
	pos = aPoint2
		ifTrue: [ ^ self ].
	err2 := 2 * err.
	err2 > delta y negated
		ifTrue: [ err := err - delta y.
			pos := (pos x + sign x) @ pos y ].
	err2 < delta x
		ifTrue: [ err := err + delta x.
			pos := pos x @ (pos y + sign y) ] ] repeat
]

{ #category : #api }
RetroGameImage >> loadFileNamed: aString at: aPoint [
	self importForm: (Form fromFileNamed: aString) at: aPoint
]

{ #category : #accessing }
RetroGameImage >> mask [
	^ nil
]

{ #category : #private }
RetroGameImage >> nearestColorIndexOf: aColor [
	| cs min minIndex |
	cs := colors collect: [ :each | each diff: aColor ].
	min := 1.
	minIndex := 0.
	cs
		withIndexDo: [ :each :index | 
			each < min
				ifTrue: [ min := each.
					minIndex := index - 1 ] ].
	^ minIndex
]

{ #category : #api }
RetroGameImage >> pixelAt: aPoint [
	| index |
	(self containsPoint: aPoint)
		ifFalse: [ ^ 0 ].
	index := self indexOf: aPoint truncated.
	^ array at: index
]

{ #category : #api }
RetroGameImage >> pixelAt: aPoint put: anInteger [
	| index |
	(self containsPoint: aPoint)
		ifFalse: [ ^ self ].
	index := self indexOf: aPoint.
	array at: index put: anInteger
]

{ #category : #api }
RetroGameImage >> quarterArcRadius: anInteger into: aCollection [
	| cx cy d |
	cx := 0.
	cy := anInteger truncated.
	d := 2 - (2 * anInteger).
	aCollection add: cx @ cy.
	aCollection add: cy @ cx.
	[ d > cy negated
		ifTrue: [ cy := cy - 1.
			d := d + 1 - (2 * cy) ].
	d <= cx
		ifTrue: [ cx := cx + 1.
			d := d + 1 + (2 * cx) ].
	cy = 0
		ifTrue: [ ^ self ].
	aCollection add: cx @ cy ] repeat
]

{ #category : #api }
RetroGameImage >> realColor: anInteger [
	^ colors at: anInteger + 1
]

{ #category : #api }
RetroGameImage >> rect: aPoint extent: aPoint2 color: anInteger [
	| index rx ry |
	(aPoint2 x = 0 or: [ aPoint2 y = 0 ])
		ifTrue: [ ^ self ].
	rx := self adjustX: aPoint x width: aPoint2 x.
	rx ifNil: [ ^ self ].
	ry := self adjustY: aPoint y height: aPoint2 y.
	ry ifNil: [ ^ self ].
	index := self indexOf: rx first @ ry first.
	ry second
		timesRepeat: [ self hLineFrom: index length: rx second color: anInteger.
			index := index + extent x ]
]

{ #category : #api }
RetroGameImage >> rectFrame: aPoint extent: aPoint2 color: anInteger [
	| x2 y2 |
	(aPoint2 x = 0 or: [ aPoint2 y = 0 ])
		ifTrue: [ ^ self ].
	x2 := aPoint x + aPoint2 x - 1.
	y2 := aPoint y + aPoint2 y - 1.
	self hLine: aPoint length: aPoint2 x color: anInteger.
	self hLine: aPoint x @ y2 length: aPoint2 x color: anInteger.
	self vLine: aPoint + (0 @ 1) length: aPoint2 y - 2 color: anInteger.
	self
		vLine: x2 @ (aPoint y + 1)
		length: aPoint2 y - 2
		color: anInteger
]

{ #category : #private }
RetroGameImage >> scanLeft: aPoint color: anInteger [
	| p c np |
	p := aPoint.
	[ p x > 0 ]
		whileTrue: [ np := (p x - 1) @ p y.
			c := self pixelAt: np.
			c ~= anInteger
				ifTrue: [ ^ p ].
			p := np ].
	^ 0 @ p y
]

{ #category : #private }
RetroGameImage >> scanRight: aPoint color: anInteger fillColor: anInteger3 into: aCollection [
	| pos p above below |
	above := false.
	below := false.
	pos := aPoint.
	[ pos x < extent x ]
		whileTrue: [ self pixelAt: pos put: anInteger3.
			pos y > 0
				ifTrue: [ p := pos x @ (pos y - 1).
					(self pixelAt: p) = anInteger
						ifTrue: [ above
								ifFalse: [ aCollection add: p.
									above := true ] ]
						ifFalse: [ above := false ] ].
			pos y < (extent y - 1)
				ifTrue: [ p := pos x @ (pos y + 1).
					(self pixelAt: p) = anInteger
						ifTrue: [ below
								ifFalse: [ aCollection add: p.
									below := true ] ]
						ifFalse: [ below := false ] ].
			pos x = (extent x - 1)
				ifTrue: [ ^ self ].
			p := (pos x + 1) @ pos y.
			(self pixelAt: p) ~= anInteger
				ifTrue: [ ^ self ].
			pos := p ]
]

{ #category : #api }
RetroGameImage >> triangle: aPoint p2: aPoint2 x3: anInteger color: anInteger4 [
	| points y sign |
	points := (Array new: (aPoint2 y - aPoint y) abs + 1)
		collect: [ :each | Array new: 2 ].
	self line: aPoint to: aPoint2 into: points.
	self line: aPoint to: anInteger @ aPoint2 y into: points.
	y := aPoint y.
	sign := (aPoint2 y - aPoint y) sign.
	points
		do: [ :each | 
			self
				hLine: each first @ y
				length: each second - each first + 1
				color: anInteger4.
			y := y + sign ]
]

{ #category : #api }
RetroGameImage >> vLine: aPoint length: anInteger color: anInteger2 [
	| index r |
	(aPoint x between: 0 and: extent x - 1)
		ifFalse: [ ^ self ].
	r := self adjustY: aPoint y height: anInteger.
	r ifNil: [ ^ self ].
	index := self indexOf: aPoint x @ r first.
	self vLineFrom: index length: r second width: extent x color: anInteger2
]

{ #category : #private }
RetroGameImage >> vLineFrom: anInteger length: anInteger2 width: anInteger3 color: anInteger4 [
	anInteger to: anInteger + (anInteger3 * anInteger2) - 1 by: anInteger3
	do: [ :index | array at: index put: anInteger4 ]
]
