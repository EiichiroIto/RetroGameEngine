Class {
	#name : #Sample09Enemy,
	#superclass : #Sample09Object,
	#instVars : [
		'direction',
		'timerOffset'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #constants }
Sample09Enemy class >> extent [
	^ 8 @ 8
]

{ #category : #constants }
Sample09Enemy class >> speed [
	^ 1.5
]

{ #category : #testing }
Sample09Enemy >> collideWith: anObject [
	^ position x + self width > anObject position x
		and: [ anObject position x + anObject width > position x
				and: [ position y + self height > anObject position y
						and: [ anObject position y + anObject height > position y ] ] ]
]

{ #category : #accessing }
Sample09Enemy >> direction [
	^ direction
]

{ #category : #accessing }
Sample09Enemy >> direction: anObject [
	direction := anObject
]

{ #category : #api }
Sample09Enemy >> draw: anApp [
	anApp engine
		blt: position
		imageBank: 0
		at: 8 @ 0
		extent: self class extent * (direction @ 1)
		color: 0
]

{ #category : #api }
Sample09Enemy >> init: anApp [
	direction := 1.
	timerOffset := anApp engine randomFrom: 0 to: 59.
	isAlive := true
]

{ #category : #accessing }
Sample09Enemy >> timerOffset [
	^ timerOffset
]

{ #category : #accessing }
Sample09Enemy >> timerOffset: anObject [
	timerOffset := anObject
]

{ #category : #api }
Sample09Enemy >> update: anApp [
	| x y |
	x := position x.
	y := position y.
	(anApp engine frameCount + timerOffset) \\ 60 < 30
		ifTrue: [ x := x + self class speed.
			direction := 1 ]
		ifFalse: [ x := x - self class speed.
			direction := -1 ].
	y := y + self class speed.
	y > (anApp engine height - 1)
		ifTrue: [ isAlive := false ].
	position := x @ y
]
