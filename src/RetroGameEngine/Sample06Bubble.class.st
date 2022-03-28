Class {
	#name : #Sample06Bubble,
	#superclass : #Object,
	#instVars : [
		'app',
		'position',
		'radius',
		'velocity',
		'color'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #accessing }
Sample06Bubble >> color [
	^ color
]

{ #category : #accessing }
Sample06Bubble >> color: anObject [
	color := anObject
]

{ #category : #testing }
Sample06Bubble >> containsPoint: aPoint [
	^ (position squaredDistanceTo: aPoint) < radius squared
]

{ #category : #api }
Sample06Bubble >> draw [
	app engine
		circle: position truncated
		radius: radius truncated
		color: color
]

{ #category : #api }
Sample06Bubble >> init: anApp [
	app := anApp.
	radius := app engine randomFloatFrom: 3 to: 10.
	position := (app engine
		randomFloatFrom: radius
		to: Sample06 screenWidth - radius)
		@ (app engine randomFloatFrom: radius to: Sample06 screenHeight - radius).
	velocity := Point
		r: (app engine randomFloatFrom: 0 to: Sample06 maxBubbleSpeed)
		degrees: (app engine randomFrom: 0 to: 359).
	color := app engine randomFrom: 1 to: 15
]

{ #category : #testing }
Sample06Bubble >> intersects: aBubble [
	| totalR |
	totalR := radius + aBubble radius.
	^ (position squaredDistanceTo: aBubble position) < totalR squared
]

{ #category : #accessing }
Sample06Bubble >> position [
	^ position
]

{ #category : #accessing }
Sample06Bubble >> position: anObject [
	position := anObject
]

{ #category : #accessing }
Sample06Bubble >> radius [
	^ radius
]

{ #category : #accessing }
Sample06Bubble >> radius: anObject [
	radius := anObject
]

{ #category : #api }
Sample06Bubble >> update [
	position := position + velocity.
	((velocity x < 0 and: [ position x < radius ])
		or:
			[ velocity x > 0 and: [ position x > (Sample06 screenWidth - radius) ] ])
		ifTrue: [ velocity := velocity x negated @ velocity y ].
	((velocity y < 0 and: [ position y < radius ])
		or:
			[ velocity y > 0 and: [ position y > (Sample06 screenHeight - radius) ] ])
		ifTrue: [ velocity := velocity x @ velocity y negated ]
]

{ #category : #accessing }
Sample06Bubble >> velocity [
	^ velocity
]

{ #category : #accessing }
Sample06Bubble >> velocity: anObject [
	velocity := anObject
]
