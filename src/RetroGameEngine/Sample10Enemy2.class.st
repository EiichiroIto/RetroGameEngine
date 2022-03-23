Class {
	#name : #Sample10Enemy2,
	#superclass : #Sample10Object,
	#instVars : [
		'direction'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #api }
Sample10Enemy2 >> draw: anApp [
	anApp engine
		blt: position
		imageBank: 0
		at: 0 @ (anApp engine frameCount // 4 \\ 2 * 8 + 16)
		extent:
			(direction > 0
				ifTrue: [ 8 ]
				ifFalse: [ -8 ]) @ 8
		color: anApp class transparentColor
]

{ #category : #api }
Sample10Enemy2 >> init: anApp [
	super init: anApp.
	direction := 1
]

{ #category : #api }
Sample10Enemy2 >> update: anApp [
	delta := direction @ (delta y + 1 min: 3).
	((anApp isWall: position + (0 @ 8))
		or: [ anApp isWall: position + (7 @ 8) ])
		ifTrue: [ (direction < 0
				and: [ (anApp isWall: position + (-1 @ 4))
						or: [ (anApp isWall: position + (-1 @ 8)) not ] ])
				ifTrue: [ direction := 1 ]
				ifFalse: [ (direction > 0
						and: [ (anApp isWall: position + (8 @ 4))
								or: [ (anApp isWall: position + (7 @ 8)) not ] ])
						ifTrue: [ direction := -1 ] ] ].
	position := anApp pushBack: position delta: delta
]
