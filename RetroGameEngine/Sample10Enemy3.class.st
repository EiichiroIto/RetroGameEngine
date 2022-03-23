Class {
	#name : #Sample10Enemy3,
	#superclass : #Sample10Object,
	#instVars : [
		'timeToFire'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #api }
Sample10Enemy3 >> draw: anApp [
	anApp engine
		blt: position
		imageBank: 0
		at: (anApp engine frameCount // 8 \\ 2 * 8) @ 32
		extent: 8 @ 8
		color: anApp class transparentColor
]

{ #category : #api }
Sample10Enemy3 >> init: anApp [
	super init: anApp.
	timeToFire := 0
]

{ #category : #private }
Sample10Enemy3 >> newBullet [
	^ Sample10Bullet new
]

{ #category : #api }
Sample10Enemy3 >> update: anApp [
	| sqDist dist d |
	timeToFire := timeToFire - 1.
	timeToFire > 0
		ifTrue: [ ^ self ].
	d := anApp player position - position.
	sqDist := d dotProduct: d.
	sqDist >= (60 ** 2)
		ifTrue: [ ^ self ].
	dist := anApp engine sqrt: sqDist.
	anApp
		addEnemy:
			(self newBullet
				init: self;
				position: position;
				delta: d / dist;
				yourself).
	timeToFire := 60
]
