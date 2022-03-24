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
DanmakuBullet >> draw: anApp [
	anApp engine rect: position extent: extent color: 8
]

{ #category : #api }
DanmakuBullet >> init: anApp [
	super init: anApp.
	extent := 3 @ 3
]

{ #category : #api }
DanmakuBullet >> update: anApp [
	| delta |
	delta := Point r: 5 degrees: direction.
	position := position + delta.
	(anApp engine screen containsPoint: position)
		ifFalse: [ isAlive := false ].
	(position distanceTo: anApp player position) < 3
		ifTrue: [ anApp gameOver ]
]
