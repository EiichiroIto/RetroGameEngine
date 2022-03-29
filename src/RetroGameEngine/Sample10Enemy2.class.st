Class {
	#name : #Sample10Enemy2,
	#superclass : #Sample10Object,
	#instVars : [
		'direction'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #api }
Sample10Enemy2 >> draw [
	app engine
		blt: position
		imageNo: 0
		at: 0 @ (app engine frameCount // 4 \\ 2 * 8 + 16)
		extent:
			(direction > 0
				ifTrue: [ 8 ]
				ifFalse: [ -8 ]) @ 8
		transparentColor: app class transparentColor
]

{ #category : #api }
Sample10Enemy2 >> init: anApp [
	super init: anApp.
	direction := 1
]

{ #category : #api }
Sample10Enemy2 >> update [
	delta := direction @ (delta y + 1 min: 3).
	((app isWall: position + (0 @ 8))
		or: [ app isWall: position + (7 @ 8) ])
		ifTrue: [ (direction < 0
				and: [ (app isWall: position + (-1 @ 4))
						or: [ (app isWall: position + (-1 @ 8)) not ] ])
				ifTrue: [ direction := 1 ]
				ifFalse: [ (direction > 0
						and: [ (app isWall: position + (8 @ 4))
								or: [ (app isWall: position + (7 @ 8)) not ] ])
						ifTrue: [ direction := -1 ] ] ].
	position := app pushBack: position delta: delta
]
