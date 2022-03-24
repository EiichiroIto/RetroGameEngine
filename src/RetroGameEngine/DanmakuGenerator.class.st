Class {
	#name : #DanmakuGenerator,
	#superclass : #DanmakuObject,
	#instVars : [
		'radius'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #api }
DanmakuGenerator >> draw: anApp [
	anApp engine circleFrame: position radius: radius color: 6
]

{ #category : #private }
DanmakuGenerator >> fire: anApp [
	anApp
		addBullet:
			((self newBullet: anApp)
				position: position;
				direction: (anApp player position - position) degrees;
				yourself)
]

{ #category : #api }
DanmakuGenerator >> init: anApp [
	super init: anApp.
	radius := 100
]

{ #category : #private }
DanmakuGenerator >> newBullet: anApp [
	^ DanmakuBullet new
		init: anApp;
		yourself
]

{ #category : #accessing }
DanmakuGenerator >> radius [
	^ radius
]

{ #category : #accessing }
DanmakuGenerator >> radius: anObject [
	radius := anObject
]

{ #category : #api }
DanmakuGenerator >> update: anApp [
	radius := radius - 5.
	radius > 0
		ifTrue: [ ^ self ].
	radius \\ 20 == 0
		ifTrue: [ self fire: anApp ].
	radius < -80
		ifTrue: [ isAlive := false ]
]
