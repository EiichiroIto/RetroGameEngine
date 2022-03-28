Class {
	#name : #DanmakuBullet,
	#superclass : #DanmakuObject,
	#instVars : [
		'direction'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #accessing }
DanmakuBullet >> direction [
	^ direction
]

{ #category : #accessing }
DanmakuBullet >> direction: anObject [
	direction := anObject
]

{ #category : #api }
DanmakuBullet >> draw [
	app engine rect: position extent: extent color: 8
]

{ #category : #api }
DanmakuBullet >> init: anApp [
	super init: anApp.
	extent := 3 @ 3
]

{ #category : #api }
DanmakuBullet >> update [
	| delta |
	delta := Point r: 5 degrees: direction.
	position := position + delta.
	(app engine screen containsPoint: position)
		ifFalse: [ isAlive := false ].
	(position distanceTo: app player position) < 3
		ifTrue: [ app gameOver ]
]
