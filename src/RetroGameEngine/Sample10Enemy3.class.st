Class {
	#name : #Sample10Enemy3,
	#superclass : #Sample10Object,
	#instVars : [
		'timeToFire'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #api }
Sample10Enemy3 >> draw [
	app engine
		blt: position
		imageBank: 0
		at: (app engine frameCount // 8 \\ 2 * 8) @ 32
		extent: 8 @ 8
		transparentColor: app class transparentColor
]

{ #category : #api }
Sample10Enemy3 >> init: anApp [
	super init: anApp.
	timeToFire := 0
]

{ #category : #private }
Sample10Enemy3 >> newBullet [
	^ Sample10Bullet new
		init: app;
		yourself
]

{ #category : #api }
Sample10Enemy3 >> update [
	| sqDist dist d |
	timeToFire := timeToFire - 1.
	timeToFire > 0
		ifTrue: [ ^ self ].
	d := app player position - position.
	sqDist := d dotProduct: d.
	sqDist >= (60 ** 2)
		ifTrue: [ ^ self ].
	dist := app engine sqrt: sqDist.
	app
		addEnemy:
			(self newBullet
				position: position;
				delta: d / dist;
				yourself).
	timeToFire := 60
]
