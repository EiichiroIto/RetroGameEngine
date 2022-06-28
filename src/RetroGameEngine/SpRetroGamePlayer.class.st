Class {
	#name : #SpRetroGamePlayer,
	#superclass : #SpPresenter,
	#instVars : [
		'playerPane',
		'app',
		'isRunning',
		'nextFrameTime'
	],
	#category : #'RetroGameEngine-DemoPlayer'
}

{ #category : #layout }
SpRetroGamePlayer class >> defaultLayout [
	^ SpBoxLayout newVertical
		add: #playerPane;
		yourself
]

{ #category : #'instance creation' }
SpRetroGamePlayer class >> on: anApp [

	| spec |
	spec := self new
		        app: anApp;
		        open;
		        init.
	spec window
		extent: anApp engine extent * 3 + 50;
		title: anApp class title.
	spec start
]

{ #category : #accessing }
SpRetroGamePlayer >> app [
	^ app
]

{ #category : #accessing }
SpRetroGamePlayer >> app: anObject [
	app := anObject
]

{ #category : #api }
SpRetroGamePlayer >> init [
	| engine |
	engine := RetroGameEngine new
		frameCount: 0;
		yourself.
	app
		engine: engine;
		whenQuitBlock: [ self quit ];
		init;
		draw
]

{ #category : #initialization }
SpRetroGamePlayer >> initialize [
	super initialize.
	isRunning := false
]

{ #category : #initialization }
SpRetroGamePlayer >> initializePresenter [
	playerPane := self newMorph
		morph: RetroGameMorph new;
		yourself.
	self setupPlayerMorph
]

{ #category : #accessing }
SpRetroGamePlayer >> isRunning [
	^ isRunning
]

{ #category : #accessing }
SpRetroGamePlayer >> isRunning: anObject [
	isRunning := anObject
]

{ #category : #private }
SpRetroGamePlayer >> loop [
	| now |
	isRunning
		ifFalse: [ ^ self ].
	now := Time millisecondClockValue.
	now < nextFrameTime
		ifTrue: [ ^ self ].
	app loop.
	app engine incrementFrameCount.
	nextFrameTime := 1000 // app fps + now.
	playerPane morph changed
]

{ #category : #accessing }
SpRetroGamePlayer >> nextFrameTime [
	^ nextFrameTime
]

{ #category : #accessing }
SpRetroGamePlayer >> nextFrameTime: anObject [
	nextFrameTime := anObject
]

{ #category : #accessing }
SpRetroGamePlayer >> playerPane [
	^ playerPane
]

{ #category : #accessing }
SpRetroGamePlayer >> playerPane: anObject [
	playerPane := anObject
]

{ #category : #private }
SpRetroGamePlayer >> quit [
	isRunning := false
]

{ #category : #private }
SpRetroGamePlayer >> setupPlayerMorph [
	playerPane morph color: Smalltalk ui theme backgroundColor.
	playerPane morph whenStepDo: [ self loop ]
]

{ #category : #api }
SpRetroGamePlayer >> start [
	isRunning := true.
	nextFrameTime := Time millisecondClockValue.
	playerPane morph
		app: app;
		startStepping.
	playerPane morph activeHand keyboardFocus: playerPane morph
]
