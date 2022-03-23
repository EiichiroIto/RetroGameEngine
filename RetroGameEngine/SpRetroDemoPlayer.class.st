Class {
	#name : #SpRetroDemoPlayer,
	#superclass : #SpPresenter,
	#instVars : [
		'menu',
		'playerPane',
		'startButton',
		'stopButton',
		'app',
		'isRunning',
		'nextFrameTime'
	],
	#category : #'RetroGameEngine-Spec2'
}

{ #category : #specs }
SpRetroDemoPlayer class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #menu withConstraints: [ :c | c height: self toolbarHeight ];
		add: #playerPane;
		add:
			(SpBoxLayout newHorizontal
				add: #startButton;
				add: #stopButton;
				yourself)
			withConstraints: [ :c | c height: self buttonHeight ];
		yourself
]

{ #category : #example }
SpRetroDemoPlayer class >> example [
	| spec |
	spec := self new.
	spec openWithSpec.
	spec window
		extent: 600 @ 480;
		title: 'RetroGame Demo Player'
]

{ #category : #accessing }
SpRetroDemoPlayer >> app [
	^ app
]

{ #category : #accessing }
SpRetroDemoPlayer >> app: anObject [
	app := anObject
]

{ #category : #private }
SpRetroDemoPlayer >> fileMenu [
	| m |
	m := self newMenu.
	(RetroGameApp subclasses sort: [ :a :b | a title < b title ])
		do: [ :each | 
			m
				addItem: [ :item | 
					item
						name: each title;
						action: [ self loadApp: each name ] ] ].
	^ m
]

{ #category : #actions }
SpRetroDemoPlayer >> init [
	app ifNil: [ ^ self ].
	app engine frameCount: 0.
	app init.
	isRunning := true.
	nextFrameTime := Time millisecondClockValue.
	playerPane morph startStepping.
	playerPane morph activeHand keyboardFocus: playerPane morph
]

{ #category : #initialization }
SpRetroDemoPlayer >> initialize [
	super initialize.
	isRunning := false
]

{ #category : #initialization }
SpRetroDemoPlayer >> initializePresenter [
	menu := self newMenuBar.
	playerPane := self newMorph
		morph: RetroGameMorph new;
		yourself.
	startButton := self newButton
		label: 'Start';
		action: [ self init ];
		yourself.
	stopButton := self newButton
		label: 'Pause/Restart';
		action: [ self pause ];
		yourself.
	self
		setupMenuBar;
		setupPlayerMorph
]

{ #category : #accessing }
SpRetroDemoPlayer >> isRunning [
	^ isRunning
]

{ #category : #accessing }
SpRetroDemoPlayer >> isRunning: anObject [
	isRunning := anObject
]

{ #category : #private }
SpRetroDemoPlayer >> loadApp: aSymbol [
	| engine |
	isRunning := false.
	app := (Smalltalk at: aSymbol) new.
	engine := RetroGameEngine new.
	app engine: engine.
	app
		whenQuitBlock: [ self quit ];
		init;
		draw.
	playerPane morph
		app: app;
		changed
]

{ #category : #actions }
SpRetroDemoPlayer >> loop [
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
SpRetroDemoPlayer >> menu [
	^ menu
]

{ #category : #accessing }
SpRetroDemoPlayer >> menu: anObject [
	menu := anObject
]

{ #category : #accessing }
SpRetroDemoPlayer >> nextFrameTime [
	^ nextFrameTime
]

{ #category : #accessing }
SpRetroDemoPlayer >> nextFrameTime: anObject [
	nextFrameTime := anObject
]

{ #category : #actions }
SpRetroDemoPlayer >> pause [
	app ifNil: [ ^ self ].
	isRunning := isRunning not.
	isRunning
		ifFalse: [ ^ self ].
	nextFrameTime := Time millisecondClockValue.
	playerPane morph startStepping
]

{ #category : #accessing }
SpRetroDemoPlayer >> playerPane [
	^ playerPane
]

{ #category : #accessing }
SpRetroDemoPlayer >> playerPane: anObject [
	playerPane := anObject
]

{ #category : #actions }
SpRetroDemoPlayer >> quit [
	isRunning := false
]

{ #category : #private }
SpRetroDemoPlayer >> setupMenuBar [
	menu
		addItem: [ :item | 
			item
				name: 'File';
				subMenu: self fileMenu ]
]

{ #category : #private }
SpRetroDemoPlayer >> setupPlayerMorph [
	playerPane morph whenStepDo: [ self loop ]
]

{ #category : #accessing }
SpRetroDemoPlayer >> startButton [
	^ startButton
]

{ #category : #accessing }
SpRetroDemoPlayer >> startButton: anObject [
	startButton := anObject
]

{ #category : #accessing }
SpRetroDemoPlayer >> stopButton [
	^ stopButton
]

{ #category : #accessing }
SpRetroDemoPlayer >> stopButton: anObject [
	stopButton := anObject
]
