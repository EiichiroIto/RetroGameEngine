"
Danmaku game sample.
Originally developed by Tsuyoshi Tsuchimoto.
"
Class {
	#name : #Danmaku,
	#superclass : #RetroGameApp,
	#instVars : [
		'level',
		'player',
		'generators',
		'bullets'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #accessing }
Danmaku class >> title [
	^ '98 Danmaku'
]

{ #category : #api }
Danmaku >> addBullet: aBullet [
	bullets add: aBullet
]

{ #category : #accessing }
Danmaku >> bullets [
	^ bullets
]

{ #category : #accessing }
Danmaku >> bullets: anObject [
	bullets := anObject
]

{ #category : #api }
Danmaku >> draw [
	engine cls: 0.
	engine text: level asString at: 10 @ 10 color: 7.
	player isAlive
		ifTrue: [ player draw: self ]
		ifFalse: [ engine text: 'Game Over' at: 50 @ 50 color: 7 ].
	generators do: [ :each | each draw: self ].
	bullets do: [ :each | each draw: self ]
]

{ #category : #private }
Danmaku >> gameOver [
	player isAlive: false
]

{ #category : #accessing }
Danmaku >> generators [
	^ generators
]

{ #category : #accessing }
Danmaku >> generators: anObject [
	generators := anObject
]

{ #category : #api }
Danmaku >> init [
	engine
		extent: 256 @ 256;
		title: 'Danmaku';
		init.
	level := 1.
	fps := 10.
	player := self newPlayer
		position: 128 @ 128;
		yourself.
	generators := OrderedCollection new.
	bullets := OrderedCollection new
]

{ #category : #accessing }
Danmaku >> level [
	^ level
]

{ #category : #accessing }
Danmaku >> level: anObject [
	level := anObject
]

{ #category : #private }
Danmaku >> makeGenerator [
	| random |
	random := ((engine randomFrom: 1 to: 100) / 100) asFloat.
	random / level < (0.01 / 30)
		ifTrue: [ generators
				add:
					(self newGenerator
						position:
							(engine randomFrom: 0 to: engine extent x - 1)
								@ (engine randomFrom: 0 to: engine extent x - 1);
						yourself) ].
	level := level + 1
]

{ #category : #private }
Danmaku >> newGenerator [
	^ DanmakuGenerator new
		init: self;
		yourself
]

{ #category : #private }
Danmaku >> newPlayer [
	^ DanmakuPlayer new
		init: self;
		yourself
]

{ #category : #accessing }
Danmaku >> player [
	^ player
]

{ #category : #accessing }
Danmaku >> player: anObject [
	player := anObject
]

{ #category : #api }
Danmaku >> update [
	player isAlive
		ifFalse: [ ^ self ].
	player update: self.
	self makeGenerator.
	generators do: [ :each | each update: self ].
	bullets do: [ :each | each update: self ].
	generators := generators select: #isAlive.
	bullets := bullets select: #isAlive
]
