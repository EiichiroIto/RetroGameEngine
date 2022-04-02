Class {
	#name : #RetroGameTilemap,
	#superclass : #Object,
	#instVars : [
		'array',
		'extent',
		'imageNo'
	],
	#category : #'RetroGameEngine-Core'
}

{ #category : #accessing }
RetroGameTilemap >> array [
	^ array
]

{ #category : #accessing }
RetroGameTilemap >> array: anObject [
	array := anObject
]

{ #category : #converting }
RetroGameTilemap >> arrayString [
	| w index v |
	array ifNil: [ ^ '' ].
	w := WriteStream on: String new.
	index := 1.
	extent y
		timesRepeat: [ extent x * 2
				timesRepeat: [ v := array at: index.
					w nextPut: (v // 16) asHexDigit.
					w nextPut: (v \\ 16) asHexDigit.
					index := index + 1 ].
			w nextPut: Character cr ].
	^ w contents
]

{ #category : #accessing }
RetroGameTilemap >> extent [
	^ extent
]

{ #category : #accessing }
RetroGameTilemap >> extent: anObject [
	extent := anObject
]

{ #category : #accessing }
RetroGameTilemap >> imageNo [
	^ imageNo
]

{ #category : #accessing }
RetroGameTilemap >> imageNo: anObject [
	imageNo := anObject
]

{ #category : #api }
RetroGameTilemap >> importPairsFrom: aStream at: aPoint [
	| index x y |
	index := self indexOf: aPoint.
	[ aStream atEnd ]
		whileFalse: [ x := aStream next: 2.
			y := aStream next: 2.
			array at: index put: x first digitValue * 16 + x second digitValue.
			index := index + 1.
			array at: index put: y first digitValue * 16 + y second digitValue.
			index := index + 1.
			aStream peek = Character space
				ifTrue: [ aStream next ] ]
]

{ #category : #api }
RetroGameTilemap >> importString: aString at: aPoint [
	| pos |
	pos := aPoint.
	aString
		linesDo: [ :each | 
			self importPairsFrom: (ReadStream on: each) at: pos.
			pos := pos x @ (pos y + 1) ]
]

{ #category : #api }
RetroGameTilemap >> importStrings: aCollection at: aPoint [
	| pos |
	pos := aPoint.
	aCollection
		do: [ :each | 
			self importPairsFrom: (ReadStream on: each) at: pos.
			pos := pos x @ (pos y + 1) ]
]

{ #category : #private }
RetroGameTilemap >> indexOf: aPoint [
	^ (aPoint y truncated * extent x + aPoint x truncated) * 2 + 1
]

{ #category : #api }
RetroGameTilemap >> init [
	array := ByteArray new: extent x * extent y * 2
]

{ #category : #api }
RetroGameTilemap >> tileAt: aPoint [
	| index |
	((aPoint x between: 0 and: extent x - 1)
		and: [ aPoint y between: 0 and: extent y - 1 ])
		ifFalse: [ ^ 0 @ 0 ].
	index := self indexOf: aPoint.
	^ (array at: index) @ (array at: index + 1)
]

{ #category : #api }
RetroGameTilemap >> tileAt: aPoint put: aPoint2 [
	| index |
	((aPoint x between: 0 and: extent x - 1)
		and: [ aPoint y between: 0 and: extent y - 1 ])
		ifFalse: [ ^ self ].
	index := self indexOf: aPoint.
	array
		at: index put: aPoint2 x;
		at: index + 1 put: aPoint2 y
]
