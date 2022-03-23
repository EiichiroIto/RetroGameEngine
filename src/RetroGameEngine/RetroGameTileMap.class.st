Class {
	#name : #RetroGameTileMap,
	#superclass : #Object,
	#instVars : [
		'array',
		'imageBank',
		'extent'
	],
	#category : #'RetroGameEngine-Core'
}

{ #category : #accessing }
RetroGameTileMap >> array [
	^ array
]

{ #category : #accessing }
RetroGameTileMap >> array: anObject [
	array := anObject
]

{ #category : #accessing }
RetroGameTileMap >> extent [
	^ extent
]

{ #category : #accessing }
RetroGameTileMap >> extent: anObject [
	extent := anObject
]

{ #category : #accessing }
RetroGameTileMap >> imageBank [
	^ imageBank
]

{ #category : #accessing }
RetroGameTileMap >> imageBank: anObject [
	imageBank := anObject
]

{ #category : #api }
RetroGameTileMap >> importPairsFrom: aStream at: aPoint [
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
RetroGameTileMap >> importString: aString at: aPoint [
	| pos |
	pos := aPoint.
	aString
		linesDo: [ :each | 
			self importPairsFrom: (ReadStream on: each) at: pos.
			pos := pos x @ (pos y + 1) ]
]

{ #category : #api }
RetroGameTileMap >> importStrings: aCollection at: aPoint [
	| pos |
	pos := aPoint.
	aCollection
		do: [ :each | 
			self importPairsFrom: (ReadStream on: each) at: pos.
			pos := pos x @ (pos y + 1) ]
]

{ #category : #private }
RetroGameTileMap >> indexOf: aPoint [
	^ (aPoint y truncated * extent x + aPoint x truncated) * 2 + 1
]

{ #category : #api }
RetroGameTileMap >> init [
	array := ByteArray new: extent x * extent y * 2
]

{ #category : #api }
RetroGameTileMap >> pairAt: aPoint [
	| index |
	((aPoint x between: 0 and: extent x - 1)
		and: [ aPoint y between: 0 and: extent y - 1 ])
		ifFalse: [ ^ 0 @ 0 ].
	index := self indexOf: aPoint.
	^ (array at: index) @ (array at: index + 1)
]
