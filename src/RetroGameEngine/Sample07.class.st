"
Ported game from Pyxel.

Below is the original description.

---
Snake implemented with pyxel.

This is the game of snake in pyxel version!

Try and collect the tasty apples without running
into the side or yourself.

Controls are the arrow keys ← ↑ → ↓

Q: Quit the game
R: Restart the game

Created by Marcus Croucher in 2018.
---
"
Class {
	#name : #Sample07,
	#superclass : #RetroGameApp,
	#instVars : [
		'direction',
		'snake',
		'death',
		'score',
		'apple',
		'poppedPoint'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #constants }
Sample07 class >> appleColor [
	^ 8
]

{ #category : #constants }
Sample07 class >> backgroundColor [
	^ 3
]

{ #category : #constants }
Sample07 class >> bodyColor [
	^ 11
]

{ #category : #constants }
Sample07 class >> deathColor [
	^ 8
]

{ #category : #constants }
Sample07 class >> deathHeight [
	^ 5
]

{ #category : #constants }
Sample07 class >> deathTexts [
	^ #('GAME OVER' '(Q)UIT' '(R)ESTART')
]

{ #category : #constants }
Sample07 class >> down [
	^ 0 @ 1
]

{ #category : #constants }
Sample07 class >> extent [
	^ self width @ self height
]

{ #category : #constants }
Sample07 class >> headColor [
	^ 7
]

{ #category : #constants }
Sample07 class >> height [
	^ 50
]

{ #category : #constants }
Sample07 class >> left [
	^ -1 @ 0
]

{ #category : #constants }
Sample07 class >> right [
	^ 1 @ 0
]

{ #category : #constants }
Sample07 class >> scoreBackgroundColor [
	^ 5
]

{ #category : #constants }
Sample07 class >> scoreColor [
	^ 6
]

{ #category : #constants }
Sample07 class >> scoreHeight [
	^ RetroGameEngine fontHeight
]

{ #category : #constants }
Sample07 class >> start [
	^ 5 @ (5 + self scoreHeight)
]

{ #category : #constants }
Sample07 class >> textDeathColor [
	^ 0
]

{ #category : #accessing }
Sample07 class >> title [
	^ '07 Snake Game'
]

{ #category : #constants }
Sample07 class >> up [
	^ 0 @ -1
]

{ #category : #constants }
Sample07 class >> width [
	^ 40
]

{ #category : #private }
Sample07 >> centerText: aString width: anInteger [
	| textWidth |
	textWidth := aString size * RetroGameEngine fontWidth.
	^ (anInteger - textWidth) // 2
]

{ #category : #private }
Sample07 >> checkApple [
	snake first = apple
		ifFalse: [ ^ self ].
	score := score + 1.
	snake addLast: poppedPoint.
	self generateApple
]

{ #category : #private }
Sample07 >> checkDeath [
	| head |
	head := snake first.
	((head x between: 0 and: self class width - 1)
		and: [ (head y between: self class scoreHeight and: self class height - 1)
				and: [ snake size = snake asSet size ] ])
		ifTrue: [ ^ self ].
	self deathEvent
]

{ #category : #private }
Sample07 >> deathEvent [
	death := true
]

{ #category : #api }
Sample07 >> draw [
	death
		ifTrue: [ self drawDeath ]
		ifFalse: [ engine cls: self class backgroundColor.
			self drawSnake.
			self drawScore.
			engine pixelAt: apple put: self class appleColor ]
]

{ #category : #private }
Sample07 >> drawDeath [
	| displayText yOffset textX |
	engine cls: self class deathColor.
	displayText := self class deathTexts asOrderedCollection.
	displayText insert: score asString before: 2.
	displayText
		withIndexDo: [ :each :index | 
			yOffset := (RetroGameEngine fontHeight + 2) * (index - 1).
			textX := self centerText: each width: self class width.
			engine
				text: each
				at: textX @ (self class deathHeight + yOffset)
				color: self class textDeathColor ]
]

{ #category : #private }
Sample07 >> drawScore [
	engine
		rect: 0 @ 0
		extent: self class width @ self class scoreHeight
		color: self class scoreBackgroundColor.
	engine text: score asString at: 1 @ 1 color: self class scoreColor
]

{ #category : #private }
Sample07 >> drawSnake [
	| color |
	snake
		withIndexDo: [ :each :index | 
			color := index = 1
				ifTrue: [ self class headColor ]
				ifFalse: [ self class bodyColor ].
			engine pixelAt: each put: color ]
]

{ #category : #private }
Sample07 >> generateApple [
	| snakePixels |
	snakePixels := snake asSet.
	apple := snake first.
	[ snakePixels includes: apple ]
		whileTrue: [ apple := (engine randomFrom: 0 to: self class width - 1)
				@
					(engine
						randomFrom: self class scoreHeight + 1
						to: self class height - 1) ]
]

{ #category : #api }
Sample07 >> init [
	self fps: 20.
	engine
		extent: self class extent;
		title: 'Snake!';
		init.
	self reset
]

{ #category : #private }
Sample07 >> reset [
	direction := self class right.
	snake := LinkedList new.
	snake addLast: self class start.
	death := false.
	score := 0.
	self generateApple
]

{ #category : #api }
Sample07 >> update [
	death
		ifFalse: [ self updateDirection.
			self updateSnake.
			self checkDeath.
			self checkApple ].
	(engine isPressing: (RetroGameInputs key: $Q))
		ifTrue: [ self quit ].
	(engine isPressing: (RetroGameInputs key: $R))
		ifTrue: [ self reset ]
]

{ #category : #private }
Sample07 >> updateDirection [
	(engine isPressing: RetroGameInputs up)
		ifTrue: [ direction ~= self class down
				ifTrue: [ direction := self class up ].
			^ self ].
	(engine isPressing: RetroGameInputs down)
		ifTrue: [ direction ~= self class up
				ifTrue: [ direction := self class down ].
			^ self ].
	(engine isPressing: RetroGameInputs left)
		ifTrue: [ direction ~= self class right
				ifTrue: [ direction := self class left ].
			^ self ].
	(engine isPressing: RetroGameInputs right)
		ifFalse: [ ^ self ].
	direction = self class left
		ifTrue: [ ^ self ].
	direction := self class right
]

{ #category : #private }
Sample07 >> updateSnake [
	| oldHead newHead |
	oldHead := snake first.
	newHead := oldHead + direction.
	snake addFirst: newHead.
	poppedPoint := snake removeLast
]
