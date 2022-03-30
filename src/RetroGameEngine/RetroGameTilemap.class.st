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
RetroGameTilemap >> pairAt: aPoint [
	| index |
	((aPoint x between: 0 and: extent x - 1)
		and: [ aPoint y between: 0 and: extent y - 1 ])
		ifFalse: [ ^ 0 @ 0 ].
	index := self indexOf: aPoint.
	^ (array at: index) @ (array at: index + 1)
]
