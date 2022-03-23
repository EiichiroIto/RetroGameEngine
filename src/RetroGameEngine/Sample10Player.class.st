Class {
	#name : #Sample10Player,
	#superclass : #Sample10Object,
	#instVars : [
		'direction',
		'isFalling'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #constants }
Sample10Player class >> scrollBorderX [
	^ 80
]

{ #category : #accessing }
Sample10Player >> direction [
	^ direction
]

{ #category : #accessing }
Sample10Player >> direction: anObject [
	direction := anObject
]

{ #category : #api }
Sample10Player >> draw: anApp [
	anApp engine
		blt: position
		imageBank: 0
		at:
			((isFalling
				ifTrue: [ 2 ]
				ifFalse: [ anApp engine frameCount // 3 \\ 2 ]) * 8) @ 16
		extent:
			(direction > 0
				ifTrue: [ 8 ]
				ifFalse: [ -8 ]) @ 8
		color: anApp class transparentColor
]

{ #category : #api }
Sample10Player >> init: anApp [
	super init: anApp.
	direction := 1.
	isFalling := false
]

{ #category : #accessing }
Sample10Player >> isFalling [
	^ isFalling
]

{ #category : #accessing }
Sample10Player >> isFalling: anObject [
	isFalling := anObject
]

{ #category : #api }
Sample10Player >> update: anApp [
	| lastY dx lastScrollX |
	lastY := position y.
	anApp engine
		in: [ :engine |
			dx := delta x.
			(engine isPressing: RetroGameInputs left)
				ifTrue: [ dx := -2.
					direction := -1 ].
			(engine isPressing: RetroGameInputs right)
				ifTrue: [ dx := 2.
					direction := 1 ].
			delta := dx @ (delta y + 1 min: 3).
			(engine isPressed: RetroGameInputs space)
				ifTrue: [ delta := delta x @ (delta y - 6) ].
			position := anApp pushBack: position delta: delta.
			position x < anApp scrollX
				ifTrue: [ position := anApp scrollX @ position y ].
			position y < 0
				ifTrue: [ position := position x @ 0 ].
			delta := (delta x * 0.8) asInteger @ delta y.
			isFalling := position y > lastY.
			position x > (anApp scrollX + self class scrollBorderX)
				ifTrue: [ lastScrollX := anApp scrollX.
					anApp
						scrollX: (position x - self class scrollBorderX min: 240 * 8).
					anApp spawnEnemy: lastScrollX + 128 with: anApp scrollX + 127 ] ]
]
