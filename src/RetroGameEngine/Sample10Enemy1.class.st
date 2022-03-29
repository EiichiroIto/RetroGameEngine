Class {
	#name : #Sample10Enemy1,
	#superclass : #Sample10Object,
	#instVars : [
		'direction'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #api }
Sample10Enemy1 >> draw [
	app engine
		blt: position
		imageNo: 0
		at: (app engine frameCount // 4 \\ 2 * 8) @ 24
		extent:
			(direction > 0
				ifTrue: [ 8 ]
				ifFalse: [ -8 ]) @ 8
		transparentColor: app class transparentColor
]

{ #category : #api }
Sample10Enemy1 >> init: anApp [
	super init: anApp.
	direction := -1
]

{ #category : #api }
Sample10Enemy1 >> update [
	delta := direction @ (delta y + 1 min: 3).
	(direction < 0 and: [ app isWall: position + (-1 @ 4) ])
		ifTrue: [ direction := 1 ]
		ifFalse: [ (direction > 0 and: [ app isWall: position + (8 @ 4) ])
				ifTrue: [ direction := -1 ] ].
	position := app pushBack: position delta: delta
]
