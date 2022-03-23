Class {
	#name : #RetroGameScreen,
	#superclass : #RetroGameImage,
	#instVars : [
		'mask'
	],
	#category : #'RetroGameEngine-Core'
}

{ #category : #api }
RetroGameScreen >> clip: aPoint extent: aPoint2 [
	| index |
	(self containsPoint: aPoint)
		ifFalse: [ ^ self ].
	(aPoint2 x = 0 or: [ aPoint2 y = 0 ])
		ifTrue: [ ^ self ].
	mask := Array new: array size withAll: false.
	index := self indexOf: aPoint.
	aPoint2 y
		timesRepeat: [ aPoint2 x
				timesRepeat: [ mask at: index put: true.
					index := index + 1 ].
			index := index + extent x - aPoint2 x ]
]

{ #category : #private }
RetroGameScreen >> hLineFrom: anInteger length: anInteger2 color: anInteger3 [
	mask
		ifNil: [ ^ super hLineFrom: anInteger length: anInteger2 color: anInteger3 ].
	anInteger to: anInteger + anInteger2 - 1 do: [ :index | 
		(mask at: index)
			ifTrue: [ array at: index put: anInteger3 ] ]
]

{ #category : #api }
RetroGameScreen >> init [
	super init.
	self resetClip
]

{ #category : #accessing }
RetroGameScreen >> mask [
	^ mask
]

{ #category : #accessing }
RetroGameScreen >> mask: anObject [
	mask := anObject
]

{ #category : #accessing }
RetroGameScreen >> maskString [
	| w index |
	mask ifNil: [ ^ '' ].
	w := WriteStream on: String new.
	index := 1.
	extent y
		timesRepeat: [ extent x
				timesRepeat: [ w
						nextPut:
							((mask at: index)
								ifTrue: [ $1 ]
								ifFalse: [ $0 ]).
					index := index + 1 ].
			w nextPut: Character cr ].
	^ w contents
]

{ #category : #api }
RetroGameScreen >> pixelAt: aPoint put: anInteger [
	| index |
	(self containsPoint: aPoint)
		ifFalse: [ ^ self ].
	index := self indexOf: aPoint truncated.
	(mask isNil or: [ mask at: index ])
		ifFalse: [ ^ self ].
	array at: index put: anInteger
]

{ #category : #api }
RetroGameScreen >> resetClip [
	mask := nil
]

{ #category : #private }
RetroGameScreen >> vLineFrom: anInteger length: anInteger2 width: anInteger3 color: anInteger4 [
	mask
		ifNil: [ ^ super
				vLineFrom: anInteger
				length: anInteger2
				width: anInteger3
				color: anInteger4 ].
	anInteger to: anInteger + (anInteger3 * anInteger2) - 1 by: anInteger3
	do: [ :index | 
		(mask at: index)
			ifTrue: [ array at: index put: anInteger4 ] ]
]
