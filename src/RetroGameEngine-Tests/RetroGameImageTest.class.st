"
A RetroGameImageBankTest is a test class for testing the behavior of RetroGameImageBank
"
Class {
	#name : #RetroGameImageTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
RetroGameImageTest >> newImage [
	^ RetroGameImage new
]

{ #category : #private }
RetroGameImageTest >> newTilemap [
	^ RetroGameTilemap new
]

{ #category : #test }
RetroGameImageTest >> testAdjustXWidth [
	| screen r |
	screen := self newImage.
	screen extent: 5 @ 6.
	r := screen adjustX: 0 width: 3.
	self assertCollection: r equals: #(0 3).
	r := screen adjustX: 0 width: 5.
	self assertCollection: r equals: #(0 5).
	r := screen adjustX: 1 width: 8.
	self assertCollection: r equals: #(1 4).
	r := screen adjustX: -1 width: 3.
	self assertCollection: r equals: #(0 2).
	r := screen adjustX: -1 width: 8.
	self assertCollection: r equals: #(0 5)
]

{ #category : #test }
RetroGameImageTest >> testAdjustYHeight [
	| screen r |
	screen := self newImage.
	screen extent: 5 @ 6.
	r := screen adjustY: 0 height: 3.
	self assertCollection: r equals: #(0 3).
	r := screen adjustY: 0 height: 5.
	self assertCollection: r equals: #(0 5).
	r := screen adjustY: 1 height: 8.
	self assertCollection: r equals: #(1 5).
	r := screen adjustY: -1 height: 3.
	self assertCollection: r equals: #(0 2).
	r := screen adjustY: -1 height: 8.
	self assertCollection: r equals: #(0 6)
]

{ #category : #test }
RetroGameImageTest >> testArray [
	| im a |
	im := self newImage.
	self assert: im array isNil.
	im init.
	self assert: (im array isKindOf: ByteArray).
	a := #(1 2 3).
	im array: a.
	self assert: im array identicalTo: a
]

{ #category : #test }
RetroGameImageTest >> testArrayOf [
	| s r |
	s := self newImage.
	r := s arrayOf: $A.
	self assert: (r isKindOf: ByteArray).
	self assert: r size equals: 15.
	self assertCollection: r equals: #(0 1 0 1 0 1 1 1 1 1 0 1 1 0 1) asByteArray
]

{ #category : #test }
RetroGameImageTest >> testArrayString [
	| im |
	im := self newImage.
	im extent: 5 @ 3.
	im array: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15].
	self assert: im arrayString equals: '12345
6789A
BCDEF
'
]

{ #category : #test }
RetroGameImageTest >> testBothEndsOfHeight [
	| image r |
	image := self newImage.
	r := image
		bothEndsOf:
			{(3 @ 2).
			(3 @ 0).
			(1 @ 2).
			(4 @ 2)}
		height: 3.
	self
		assertCollection: r
		equals: #(#(3 3) #(nil nil) #(1 4))
]

{ #category : #test }
RetroGameImageTest >> testBuildImageOfTilemapAtExtent [
	| image tileMap dest |
	image := self newImage
		extent: 16 @ 16;
		array: (0 to: 255) asByteArray.
	tileMap := self newTilemap
		extent: 2 @ 2;
		array: #[ 1 1 0 0 1 0 0 1].
	dest := image buildImageOfTilemap: tileMap at: 0 @ 0 extent: 1 @ 1.
	self assert: dest extent equals: 8 @ 8.
	self assertCollection: dest array equals: 
#[136 137 138 139 140 141 142 143
 152 153 154 155 156 157 158 159
 168 169 170 171 172 173 174 175
 184 185 186 187 188 189 190 191
 200 201 202 203 204 205 206 207
 216 217 218 219 220 221 222 223
 232 233 234 235 236 237 238 239
 248 249 250 251 252 253 254 255	]

" 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47
 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63
  64  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79
  80  81  82  83  84  85  86  87  88  89  90  91  92  93  94  95
  96  97  98  99 100 101 102 103 104 105 106 107 108 109 110 111
 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
 128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143
 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159
 160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175
 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191
 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207
 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223
 224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239
 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255" 
]

{ #category : #test }
RetroGameImageTest >> testCharacterAtColor [
	| s r |
	s := self newImage.
	s extent: 5 @ 7.
	s init.
	s character: $P at: 2 @ 1 color: 5.
	r := s array.
	self
		assertCollection: r
		equals:
			#[0 0 0 0 0 0 0 5 5 5 0 0 5 0 5 0 0 5 5 5 0 0 5 0 0 0 0 5 0 0 0 0 0 0 0].
	s array: (ByteArray new: 35 withAll: 9).
	s character: $A at: 1 @ 2 color: 0.
	r := s array.
	self
		assertCollection: r
		equals:
			#[9 9 9 9 9 9 9 9 9 9 9 9 0 9 9 9 0 9 0 9 9 0 0 0 9 9 0 9 0 9 9 0 9 0 9]
]

{ #category : #test }
RetroGameImageTest >> testCharacterExtent [
	| s |
	s := self newImage.
	self assert: s characterExtent equals: 3 @ 5
]

{ #category : #test }
RetroGameImageTest >> testCharacters [
	| s arr |
	s := self newImage.
	self assert: s characters isArray.
	arr := #(1 2 3 4).
	s characters: arr.
	self assert: s characters identicalTo: arr
]

{ #category : #test }
RetroGameImageTest >> testCls [
	| s |
	s := self newImage.
	self assert: s array isNil.
	s extent: 3 @ 4.
	s init.
	self assertCollection: s array equals: (ByteArray new: 12).
	s cls: 10.
	self
		assertCollection: s array
		equals: (ByteArray new: 12 withAll: 10)
]

{ #category : #test }
RetroGameImageTest >> testColors [
	| im a |
	im := self newImage.
	self assert: im colors isNil.
	a := {Color red. Color blue}.
	im colors: a.
	self assert: im colors identicalTo: a
]

{ #category : #test }
RetroGameImageTest >> testContainsPoint [
	| image |
	image := self newImage.
	image
		extent: 10 @ 20;
		init.
	self assert: (image containsPoint: 0 @ 0).
	self assert: (image containsPoint: 9 @ 19).
	self deny: (image containsPoint: -1 @ 0).
	self deny: (image containsPoint: 0 @ -1).
	self deny: (image containsPoint: 10 @ 19)
]

{ #category : #test }
RetroGameImageTest >> testEllipseExtentColor [
	| e |
	e := self newImage.
	e extent: 16 @ 10.
	e init.
	e ellipse: 0 @ 0 extent: 11 @ 7 color: 5.
	self
		assertCollection: e array
		equals: #[
 0 0 0 5 5 5 5 5 0 0 0 0 0 0 0 0
 0 0 5 5 5 5 5 5 5 0 0 0 0 0 0 0
 5 5 5 5 5 5 5 5 5 5 5 0 0 0 0 0
 5 5 5 5 5 5 5 5 5 5 5 0 0 0 0 0
 5 5 5 5 5 5 5 5 5 5 5 0 0 0 0 0
 0 0 5 5 5 5 5 5 5 0 0 0 0 0 0 0
 0 0 0 5 5 5 5 5 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
].
	e := self newImage.
	e extent: 16 @ 10.
	e init.
	e ellipse: 0 @ 0 extent: 10 @ 7 color: 5.
	self
		assertCollection: e array
		equals: #[
 0 0 0 5 5 5 5 0 0 0 0 0 0 0 0 0
 0 0 5 5 5 5 5 5 0 0 0 0 0 0 0 0
 5 5 5 5 5 5 5 5 5 5 0 0 0 0 0 0
 5 5 5 5 5 5 5 5 5 5 0 0 0 0 0 0
 5 5 5 5 5 5 5 5 5 5 0 0 0 0 0 0
 0 0 5 5 5 5 5 5 0 0 0 0 0 0 0 0
 0 0 0 5 5 5 5 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
].
	e := self newImage.
	e extent: 16 @ 10.
	e init.
	e ellipse: 0 @ 0 extent: 10 @ 6 color: 5.
	self
		assertCollection: e array
		equals: #[
 0 0 0 5 5 5 5 0 0 0 0 0 0 0 0 0
 0 0 5 5 5 5 5 5 0 0 0 0 0 0 0 0
 5 5 5 5 5 5 5 5 5 5 0 0 0 0 0 0
 5 5 5 5 5 5 5 5 5 5 0 0 0 0 0 0
 0 0 5 5 5 5 5 5 0 0 0 0 0 0 0 0
 0 0 0 5 5 5 5 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
]
]

{ #category : #test }
RetroGameImageTest >> testEllipseFrameExtentColor [
	| e |
	e := self newImage.
	e extent: 16 @ 10.
	e init.
	e ellipseFrame: 0 @ 0 extent: 11 @ 7 color: 5.
	self
		assertCollection: e array
		equals: #[
 0 0 0 5 5 5 5 5 0 0 0 0 0 0 0 0
 0 0 5 0 0 0 0 0 5 0 0 0 0 0 0 0
 5 5 0 0 0 0 0 0 0 5 5 0 0 0 0 0
 5 0 0 0 0 0 0 0 0 0 5 0 0 0 0 0
 5 5 0 0 0 0 0 0 0 5 5 0 0 0 0 0
 0 0 5 0 0 0 0 0 5 0 0 0 0 0 0 0
 0 0 0 5 5 5 5 5 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
].
	e := self newImage.
	e extent: 16 @ 10.
	e init.
	e ellipseFrame: 0 @ 0 extent: 10 @ 7 color: 5.
	self
		assertCollection: e array
		equals: #[
 0 0 0 5 5 5 5 0 0 0 0 0 0 0 0 0
 0 0 5 0 0 0 0 5 0 0 0 0 0 0 0 0
 5 5 0 0 0 0 0 0 5 5 0 0 0 0 0 0
 5 0 0 0 0 0 0 0 0 5 0 0 0 0 0 0
 5 5 0 0 0 0 0 0 5 5 0 0 0 0 0 0
 0 0 5 0 0 0 0 5 0 0 0 0 0 0 0 0
 0 0 0 5 5 5 5 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
].
	e := self newImage.
	e extent: 16 @ 10.
	e init.
	e ellipseFrame: 0 @ 0 extent: 10 @ 6 color: 5.
	self
		assertCollection: e array
		equals: #[
 0 0 0 5 5 5 5 0 0 0 0 0 0 0 0 0
 0 0 5 0 0 0 0 5 0 0 0 0 0 0 0 0
 5 5 0 0 0 0 0 0 5 5 0 0 0 0 0 0
 5 5 0 0 0 0 0 0 5 5 0 0 0 0 0 0
 0 0 5 0 0 0 0 5 0 0 0 0 0 0 0 0
 0 0 0 5 5 5 5 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
]
]

{ #category : #test }
RetroGameImageTest >> testEllipsePointsExtent [
	| s r |
	s := self newImage.
	s extent: 16 @ 10.
	s init.
	r := s ellipsePointsExtent: 11 @ 7.
	self
		assertCollection: r asArray
		equals:
			{(0 @ 3).
			(5 @ 0).
			(10 @ 3).
			(5 @ 0).
			(0 @ 3).
			(5 @ 6).
			(10 @ 3).
			(5 @ 6).
			(0 @ 3).
			(4 @ 0).
			(10 @ 3).
			(6 @ 0).
			(0 @ 3).
			(4 @ 6).
			(10 @ 3).
			(6 @ 6).
			(0 @ 2).
			(3 @ 0).
			(10 @ 2).
			(7 @ 0).
			(0 @ 4).
			(3 @ 6).
			(10 @ 4).
			(7 @ 6).
			(1 @ 2).
			(2 @ 1).
			(9 @ 2).
			(8 @ 1).
			(1 @ 4).
			(2 @ 5).
			(9 @ 4).
			(8 @ 5)}
]

{ #category : #test }
RetroGameImageTest >> testEllipseRadiusInto [
	| s list |
	s := self newImage.
	s extent: 16 @ 10.
	s init.
	list := OrderedCollection new.
	s ellipseRadius: 5 @ 3 into: list.
	self
		assertCollection: list asArray
		equals: #(#(5 0 0 3) #(5 0 1 3) #(5 1 2 3) #(4 1 3 2))
]

{ #category : #test }
RetroGameImageTest >> testExtent [
	| im |
	im := self newImage.
	self assert: im extent equals: 256 @ 256.
	im extent: 100 @ 120.
	self assert: im extent equals: 100 @ 120
]

{ #category : #test }
RetroGameImageTest >> testFillColor [
	| image |
	image := self newImage.
	image extent: 10 @ 5.
	image
		array: #[
 0 0 1 0 1 0 0 1 0 0
 1 0 0 1 0 0 1 0 0 0
 1 1 0 0 0 1 0 1 0 0
 0 0 0 1 0 0 0 1 0 0
 0 0 1 0 1 0 1 0 0 0
] copy.
	image fill: 4 @ 2 color: 5.
	self assertCollection: image array equals: #[
 5 5 1 0 1 5 5 1 0 0
 1 5 5 1 5 5 1 0 0 0
 1 1 5 5 5 1 5 1 0 0
 5 5 5 1 5 5 5 1 0 0
 5 5 1 0 1 5 1 0 0 0
].
	image := self newImage.
	image extent: 10 @ 5.
	image
		array: #[
 0 0 1 0 1 0 0 1 0 0
 1 0 0 1 0 0 1 0 0 0
 1 1 0 0 0 1 0 1 0 0
 0 0 0 1 0 0 0 1 0 0
 0 0 1 0 1 0 1 0 0 0
] copy.
	image fill: 0 @ 0 color: 5.
	self assertCollection: image array equals: #[
 5 5 1 0 1 5 5 1 0 0
 1 5 5 1 5 5 1 0 0 0
 1 1 5 5 5 1 5 1 0 0
 5 5 5 1 5 5 5 1 0 0
 5 5 1 0 1 5 1 0 0 0
].
	image := self newImage.
	image extent: 10 @ 5.
	image
		array: #[
 0 0 1 0 1 0 0 1 0 0
 1 0 0 1 0 0 1 0 0 0
 1 1 0 0 0 1 0 1 0 0
 0 0 0 1 0 0 0 1 0 0
 0 0 1 0 1 0 1 0 0 0
] copy.
	image fill: 0 @ 4 color: 5.
	self assertCollection: image array equals: #[
 5 5 1 0 1 5 5 1 0 0
 1 5 5 1 5 5 1 0 0 0
 1 1 5 5 5 1 5 1 0 0
 5 5 5 1 5 5 5 1 0 0
 5 5 1 0 1 5 1 0 0 0
].
	image := self newImage.
	image extent: 10 @ 5.
	image
		array: #[
 0 0 1 0 1 0 0 1 0 0
 1 0 0 1 0 0 1 0 0 0
 1 1 0 0 0 1 0 1 0 0
 0 0 0 1 0 0 0 1 0 0
 0 0 1 0 1 0 1 0 0 0
] copy.
	image fill: 7 @ 1 color: 3.
	self assertCollection: image array equals: #[
 0 0 1 0 1 0 0 1 3 3
 1 0 0 1 0 0 1 3 3 3
 1 1 0 0 0 1 0 1 3 3
 0 0 0 1 0 0 0 1 3 3
 0 0 1 0 1 0 1 3 3 3
].
	image := self newImage.
	image extent: 10 @ 5.
	image
		array: #[
 0 0 1 0 1 0 0 1 0 0
 1 0 0 1 0 0 1 0 0 0
 1 1 0 0 0 1 0 1 0 0
 0 0 0 1 0 0 0 1 0 0
 0 0 1 0 1 0 1 0 0 0
] copy.
	image fill: 3 @ 4 color: 8.
	self assertCollection: image array equals: #[
 0 0 1 0 1 0 0 1 0 0
 1 0 0 1 0 0 1 0 0 0
 1 1 0 0 0 1 0 1 0 0
 0 0 0 1 0 0 0 1 0 0
 0 0 1 8 1 0 1 0 0 0
].

]

{ #category : #test }
RetroGameImageTest >> testHLineFromLengthColor [
	| s |
	s := self newImage.
	s extent: 5 @ 4.
	s init.
	s hLineFrom: 8 length: 3 color: 4.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 4 4 4 0 0 0 0 0 0 0 0 0 0]
]

{ #category : #test }
RetroGameImageTest >> testHLineLengthColor [
	| s |
	s := self newImage.
	s extent: 5 @ 4.
	s init.
	s hLine: 1 @ 2 length: 2 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 0 0 0 0 5 5 0 0 0 0 0 0 0].
	s := self newImage.
	s extent: 5 @ 4.
	s init.
	s hLine: 3 @ 2 length: 5 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 0 0 0 0 0 0 5 5 0 0 0 0 0].
	s := self newImage.
	s extent: 5 @ 4.
	s init.
	s hLine: 5 @ 2 length: 5 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0].
	s := self newImage.
	s extent: 5 @ 4.
	s init.
	s hLine: -3 @ 1 length: 7 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 5 5 5 5 0 0 0 0 0 0 0 0 0 0 0].
	s := self newImage.
	s extent: 5 @ 4.
	s init.
	s hLine: -3 @ 1 length: 3 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
]

{ #category : #test }
RetroGameImageTest >> testImportFormAt [
	| im form |
	im := self newImage.
	im extent: 16 @ 16.
	im
		colors:
			{Color black.
			Color white}.
	im init.
	form := UITheme current icons icons at: #windowMaximizeInactive.
	im importForm: form at: 0 @ 0.
	self
		assertCollection: im array
		equals:
			#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
]

{ #category : #test }
RetroGameImageTest >> testImportStringAt [
	| im |
	im := self newImage.
	im extent: 5 @ 3.
	im init.
	im
		importString:
			'123
456'
		at: 0 @ 0.
	self
		assertCollection: im array
		equals: #[1 2 3 0 0 4 5 6 0 0 0 0 0 0 0].
	im extent: 3 @ 4.
	im init.
	im
		importString:
			'12
34'
		at: 1 @ 2.
	self assertCollection: im array equals: #[0 0 0 0 0 0 0 1 2 0 3 4]
]

{ #category : #test }
RetroGameImageTest >> testIndexOf [
	| image |
	image := self newImage.
	image extent: 10 @ 10.
	self assert: (image indexOf: 0 @ 0) equals: 1.
	self assert: (image indexOf: 1 @ 0) equals: 2.
	self assert: (image indexOf: 0 @ 1) equals: 11.
	self assert: (image indexOf: 9 @ 9) equals: 100.
	image := self newImage.
	image extent: 6 @ 3.
	self assert: (image indexOf: 0 @ 0) equals: 1.
	self assert: (image indexOf: 1 @ 0) equals: 2.
	self assert: (image indexOf: 0 @ 1) equals: 7.
	self assert: (image indexOf: 5 @ 2) equals: 18
]

{ #category : #test }
RetroGameImageTest >> testInit [
	| im |
	im := self newImage.
	im extent: 5 @ 6.
	im init.
	self assert: im array size equals: 30
]

{ #category : #test }
RetroGameImageTest >> testInitialize [
	| im |
	im := self newImage.
	self assert: im extent equals: 256 @ 256
]

{ #category : #test }
RetroGameImageTest >> testLineToColor [
	| s |
	s := self newImage.
	s extent: 5 @ 4.
	s init.
	s line: 1 @ 1 to: 3 @ 3 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 5 0 0 0 0 0 5 0 0 0 0 0 5 0].
	s extent: 5 @ 4.
	s init.
	s line: 3 @ 3 to: 1 @ 1 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 5 0 0 0 0 0 5 0 0 0 0 0 5 0].
	s extent: 5 @ 4.
	s init.
	s line: 1 @ 1 to: 3 @ 2 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 5 5 0 0 0 0 0 5 0 0 0 0 0 0].
	s extent: 5 @ 4.
	s init.
	s line: 1 @ 2 to: 4 @ 1 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 0 5 5 0 5 5 0 0 0 0 0 0 0].
	s extent: 5 @ 4.
	s init.
	s line: 4 @ 1 to: 1 @ 2 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 0 5 5 0 5 5 0 0 0 0 0 0 0].
	s extent: 6 @ 4.
	s init.
	s line: 3 @ 0 to: 0 @ 3 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 5 0 0 0 0 5 0 0 0 0 5 0 0 0 0 5 0 0 0 0 0].
	s extent: 6 @ 4.
	s init.
	s line: 3 @ 0 to: 4 @ 3 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 5 0 0 0 0 0 5 0 0 0 0 0 0 5 0 0 0 0 0 5 0].
	s extent: 6 @ 3.
	s init.
	s line: 0 @ 0 to: 5 @ 2 color: 5.
	self
		assertCollection: s array
		equals: #[
 5 5 0 0 0 0
 0 0 5 5 0 0
 0 0 0 0 5 5
].

]

{ #category : #test }
RetroGameImageTest >> testLineToInto [
	| s a |
	s := self newImage.
	s extent: 5 @ 4.
	s init.
	a := (Array new: 3) collect: [ :each | Array new: 2 ].
	s line: 1 @ 1 to: 3 @ 3 into: a.
	self
		assertCollection: a
		equals: #((1 1) (2 2) (3 3)).
	s extent: 5 @ 4.
	s init.
	a := (Array new: 3) collect: [ :each | Array new: 2 ].
	s line: 3 @ 3 to: 1 @ 1 into: a.
	self
		assertCollection: a
		equals: #((3 3) (2 2) (1 1)).
	s extent: 5 @ 4.
	s init.
	a := (Array new: 2) collect: [ :each | Array new: 2 ].
	s line: 1 @ 1 to: 3 @ 2 into: a.
	self
		assertCollection: a
		equals: #((1 2) (3 3)).
	s extent: 5 @ 4.
	s init.
	a := (Array new: 2) collect: [ :each | Array new: 2 ].
	s line: 1 @ 2 to: 4 @ 1 into: a.
	self
		assertCollection: a
		equals: #((1 2) (3 4)).
	s extent: 5 @ 4.
	s init.
	a := (Array new: 2) collect: [ :each | Array new: 2 ].
	s line: 4 @ 1 to: 1 @ 2 into: a.
	self
		assertCollection: a
		equals: #((3 4) (1 2)).
	s extent: 6 @ 4.
	s init.
	a := (Array new: 4) collect: [ :each | Array new: 2 ].
	s line: 3 @ 0 to: 0 @ 3 into: a.
	self
		assertCollection: a
		equals: #((3 3) (2 2) (1 1) (0 0)).
	s extent: 6 @ 4.
	s init.
	a := (Array new: 4) collect: [ :each | Array new: 2 ].
	s line: 3 @ 0 to: 4 @ 3 into: a.
	self
		assertCollection: a
		equals: #((3 3) (3 3) (4 4) (4 4)).
	s extent: 6 @ 3.
	s init.
	a := (Array new: 3) collect: [ :each | Array new: 2 ].
	s line: 0 @ 0 to: 5 @ 2 into: a.
	self
		assertCollection: a
		equals: #((0 1) (2 3) (4 5)).

]

{ #category : #test }
RetroGameImageTest >> testNearestColorIndexOf [
	| im r |
	im := self newImage.
	im colors: { Color white. Color red. Color blue. Color black }.
	r := im nearestColorIndexOf: Color white.
	self assert: r equals: 0.
	r := im nearestColorIndexOf: Color red.
	self assert: r equals: 1.
	r := im nearestColorIndexOf: Color blue.
	self assert: r equals: 2.
	r := im nearestColorIndexOf: Color black.
	self assert: r equals: 3.
	r := im nearestColorIndexOf: Color lightGray.
	self assert: r equals: 0.
	r := im nearestColorIndexOf: Color orange.
	self assert: r equals: 1.
	r := im nearestColorIndexOf: Color purple.
	self assert: r equals: 2.
	r := im nearestColorIndexOf: Color darkGray.
	self assert: r equals: 3
]

{ #category : #test }
RetroGameImageTest >> testPixelAt [
	| im |
	im := self newImage.
	im extent: 5 @ 3.
	im array: #[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15].
	self assert: (im pixelAt: 0 @ 0) equals: 1.
	self assert: (im pixelAt: 3 @ 2) equals: 14.
	self assert: (im pixelAt: -1 @ -1) equals: 0.
	self assert: (im pixelAt: 5 @ 3) equals: 0.
	im := self newImage.
	im extent: 3 @ 4.
	im init.
	im array: #[1 2 3 4 5 6 7 8 9 10 11 12].
	self assert: (im pixelAt: -1 @ -1) equals: 0.
	self assert: (im pixelAt: 0 @ 0) equals: 1.
	self assert: (im pixelAt: 1 @ 0) equals: 2.
	self assert: (im pixelAt: 2 @ 0) equals: 3.
	self assert: (im pixelAt: 0 @ 1) equals: 4.
	self assert: (im pixelAt: 1 @ 1) equals: 5.
	self assert: (im pixelAt: 2 @ 1) equals: 6.
	self assert: (im pixelAt: 0 @ 2) equals: 7.
	self assert: (im pixelAt: 1 @ 2) equals: 8.
	self assert: (im pixelAt: 2 @ 2) equals: 9.
	self assert: (im pixelAt: 0 @ 3) equals: 10.
	self assert: (im pixelAt: 1 @ 3) equals: 11.
	self assert: (im pixelAt: 2 @ 3) equals: 12.
	self assert: (im pixelAt: 3 @ 4) equals: 0
]

{ #category : #test }
RetroGameImageTest >> testPixelAtPut [
	| im |
	im := self newImage.
	im extent: 5 @ 3.
	im init.
	im pixelAt: 0 @ 0 put: 1.
	im pixelAt: 3 @ 2 put: 2.
	im pixelAt: -1 @ -1 put: 123.
	im pixelAt: 5 @ 3 put: 123.
	self
		assertCollection: im array
		equals: #[1 0 0 0 0 0 0 0 0 0 0 0 0 2 0]
]

{ #category : #test }
RetroGameImageTest >> testQuarterArcRadiusInto [
	| s a |
	s := self newImage.
	s extent: 7 @ 7.
	s init.
	a := OrderedCollection new.
	s quarterArcRadius: 3 into: a.
	self
		assertCollection: a asArray
		equals:
			{(0 @ 3).
			(3 @ 0).
			(1 @ 3).
			(2 @ 2).
			(3 @ 1)}
	"
 1 3 0 0
 0 0 4 0
 0 0 0 5
 C 0 0 2
"
]

{ #category : #test }
RetroGameImageTest >> testRealColor [
	| image |
	image := self newImage.
	image colors: RetroGameEngine pixelColors.
	self assert: (image realColor: 0) equals: Color black.
	self
		assert: (image realColor: 15)
		equals: (Color fromHexString: 'EDC7B0')
]

{ #category : #test }
RetroGameImageTest >> testRectExtentColor [
	| s |
	s := self newImage.
	s extent: 6 @ 5.
	s init.
	s rect: 2 @ 1 extent: 3 @ 4 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 0 5 5 5 0 0 0 5 5 5 0 0 0 5 5 5 0 0 0 5 5 5 0]
]

{ #category : #test }
RetroGameImageTest >> testRectFrameExtentColor [
	| s |
	s := self newImage.
	s extent: 6 @ 5.
	s init.
	s rectFrame: 2 @ 1 extent: 3 @ 4 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 0 5 5 5 0 0 0 5 0 5 0 0 0 5 0 5 0 0 0 5 5 5 0]
]

{ #category : #test }
RetroGameImageTest >> testScanLeftColor [
	| image p |
	image := self newImage.
	image extent: 5 @ 3.
	image array: #[
 0 1 0 0 0
 0 0 0 0 0
 1 0 0 0 0].
	p := image scanLeft: 0 @ 0 color: 0.
	self assert: p equals: 0 @ 0.
	p := image scanLeft: 2 @ 0 color: 0.
	self assert: p equals: 2 @ 0.
	p := image scanLeft: 4 @ 0 color: 0.
	self assert: p equals: 2 @ 0.
	p := image scanLeft: 4 @ 1 color: 0.
	self assert: p equals: 0 @ 1.
	p := image scanLeft: 4 @ 2 color: 0.
	self assert: p equals: 1 @ 2
]

{ #category : #test }
RetroGameImageTest >> testScanRightColorFillColorInto [
	| image list |
	image := self newImage.
	image extent: 10 @ 3.
	image
		array: #[
 0 0 1 0 1 0 0 0 0 0
 1 0 0 0 0 0 1 0 0 0
 1 1 0 0 0 1 0 0 0 0] copy.
	list := OrderedCollection new.
	image
		scanRight: 1 @ 1
		color: 0
		fillColor: 2
		into: list.
	self
		assertCollection: list asArray
		equals:
			{(1 @ 0).
			(2 @ 2).
			(3 @ 0).
			(5 @ 0)}.
	self
		assertCollection: image array
		equals: #[
 0 0 1 0 1 0 0 0 0 0
 1 2 2 2 2 2 1 0 0 0
 1 1 0 0 0 1 0 0 0 0]
]

{ #category : #test }
RetroGameImageTest >> testSetupCharacters [
	| s arr |
	s := self newImage.
	arr := s characters.
	self assert: arr isArray.
	self
		assert: arr size
		equals: RetroGameScreen asciiCharacterForm width // s characterExtent x.
	self
		assert: arr first size
		equals: s characterExtent x * s characterExtent y
]

{ #category : #test }
RetroGameImageTest >> testTriangleP2X3Color [
	| s |
	s := self newImage.
	s extent: 6 @ 4.
	s init.
	s triangle: 3 @ 0 p2: 0 @ 3 x3: 4 color: 5.
	self
		assertCollection: s array
		equals: #[
 0 0 0 5 0 0
 0 0 5 5 0 0
 0 5 5 5 5 0
 5 5 5 5 5 0].
	s extent: 6 @ 4.
	s init.
	s triangle: 0 @ 0 p2: 0 @ 3 x3: 5 color: 5.
	self
		assertCollection: s array
		equals: #[
 5 0 0 0 0 0
 5 5 5 0 0 0
 5 5 5 5 5 0
 5 5 5 5 5 5
].
	s extent: 6 @ 3.
	s init.
	s triangle: 0 @ 0 p2: 0 @ 2 x3: 5 color: 5.
	self
		assertCollection: s array
		equals: #[
 5 5 0 0 0 0
 5 5 5 5 0 0
 5 5 5 5 5 5
].
	s extent: 6 @ 4.
	s init.
	s triangle: 5 @ 0 p2: 1 @ 2 x3: 5 color: 5.
	self
		assertCollection: s array
		equals: #[
 0 0 0 0 5 5
 0 0 5 5 5 5
 0 5 5 5 5 5
 0 0 0 0 0 0
].
	s extent: 6 @ 4.
	s init.
	s triangle: 2 @ 3 p2: 0 @ 1 x3: 4 color: 5.
	self
		assertCollection: s array
		equals: #[
 0 0 0 0 0 0
 5 5 5 5 5 0
 0 5 5 5 0 0
 0 0 5 0 0 0
].

]

{ #category : #test }
RetroGameImageTest >> testVLineFromLengthWidthColor [
	| s |
	s := self newImage.
	s extent: 5 @ 4.
	s init.
	s
		vLineFrom: 3
		length: 3
		width: 5
		color: 6.
	self
		assertCollection: s array
		equals: #[0 0 6 0 0 0 0 6 0 0 0 0 6 0 0 0 0 0 0 0]
]

{ #category : #test }
RetroGameImageTest >> testVLineLengthColor [
	| s |
	s := self newImage.
	s extent: 5 @ 4.
	s init.
	s vLine: 1 @ 2 length: 2 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 0 0 0 0 5 0 0 0 0 5 0 0 0].
	s := self newImage.
	s extent: 5 @ 4.
	s init.
	s vLine: 2 @ 1 length: 6 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 5 0 0 0 0 5 0 0 0 0 5 0 0].
	s := self newImage.
	s extent: 5 @ 4.
	s init.
	s vLine: 2 @ 4 length: 6 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0].
	s := self newImage.
	s extent: 5 @ 4.
	s init.
	s vLine: 2 @ -1 length: 3 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 5 0 0 0 0 5 0 0 0 0 0 0 0 0 0 0 0 0].
	s := self newImage.
	s extent: 5 @ 4.
	s init.
	s vLine: 2 @ -3 length: 3 color: 5.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
]
