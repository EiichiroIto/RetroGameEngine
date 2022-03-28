Class {
	#name : #DanmakuGenerator,
	#superclass : #DanmakuObject,
	#instVars : [
		'radius'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #api }
DanmakuGenerator >> draw [
	app engine circleFrame: position radius: radius color: 6
]

{ #category : #private }
DanmakuGenerator >> fire [
	app
		addBullet:
			((self newBullet)
				position: position;
				direction: (app player position - position) degrees;
				yourself)
]

{ #category : #api }
DanmakuGenerator >> init: anApp [
	super init: anApp.
	radius := 100
]

{ #category : #private }
DanmakuGenerator >> newBullet [
	^ DanmakuBullet new
		init: app;
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
DanmakuGenerator >> update [
	radius := radius - 5.
	radius > 0
		ifTrue: [ ^ self ].
	radius \\ 20 == 0
		ifTrue: [ self fire ].
	radius < -80
		ifTrue: [ isAlive := false ]
]
