"
Ported game from Pyxel.

All characters and backgrounds are from ""09_shooter.py"".
"
Class {
	#name : #Sample09,
	#superclass : #RetroGameApp,
	#instVars : [
		'enemies',
		'bullets',
		'blasts',
		'scene',
		'score',
		'background',
		'player'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #constants }
Sample09 class >> numStars [
	^ 100
]

{ #category : #constants }
Sample09 class >> sceneGameOver [
	^ 2
]

{ #category : #constants }
Sample09 class >> scenePlay [
	^ 1
]

{ #category : #constants }
Sample09 class >> sceneTitle [
	^ 0
]

{ #category : #constants }
Sample09 class >> starColorHigh [
	^ 12
]

{ #category : #constants }
Sample09 class >> starColorLow [
	^ 5
]

{ #category : #accessing }
Sample09 class >> title [
	^ '09 Shooter Game'
]

{ #category : #api }
Sample09 >> draw [
	engine cls: 0.
	background draw.
	scene = self class sceneTitle
		ifTrue: [ self drawTitleScene ]
		ifFalse: [ scene = self class scenePlay
				ifTrue: [ self drawPlayScene ]
				ifFalse: [ scene = self class sceneGameOver
						ifTrue: [ self drawGameOverScene ] ] ].
	engine text: 'SCORE ' , score asString at: 39 @ 4 color: 7
]

{ #category : #private }
Sample09 >> drawGameOverScene [
	bullets do: #draw.
	enemies do: #draw.
	blasts do: #draw.
	engine text: 'GAME OVER' at: 43 @ 66 color: 8.
	engine text: '- PRESS ENTER -' at: 31 @ 126 color: 13
]

{ #category : #private }
Sample09 >> drawPlayScene [
	player draw.
	bullets do: #draw.
	enemies do: #draw.
	blasts do: #draw
]

{ #category : #private }
Sample09 >> drawTitleScene [
	engine
		text: 'Pharo Shooter'
		at: 35 @ 66
		color: engine frameCount \\ 16.
	engine text: '- PRESS ENTER -' at: 31 @ 126 color: 13
]

{ #category : #api }
Sample09 >> init [
	engine
		extent: 120 @ 160;
		title: 'Shooter';
		init.
	(engine imageAt: 0)
		importString:
			'00c00c00
0c7007c0
0c7007c0
c703b07c
77033077
785cc587
85c77c58
0c0880c0'
		at: 0 @ 0.
	(engine imageAt: 0)
		importString:
			'00088000
00ee1200
08e2b180
02882820
00222200
00012280
08208008
80008000'
		at: 8 @ 0.
	scene := self class sceneTitle.
	background := self newBackground.
	self reset
]

{ #category : #private }
Sample09 >> newBackground [
	^ Sample09Background new
		init: self;
		yourself.
]

{ #category : #private }
Sample09 >> newBlastAt: aPoint extent: aPoint2 [
	^ Sample09Blast new
		init: self;
		position: aPoint + (aPoint2 / 2);
		yourself
]

{ #category : #private }
Sample09 >> newBulletAt: aPoint [
	^ Sample09Bullet new
		init: self;
		position:
			aPoint
				+
					(((Sample09Player extent x - Sample09Bullet extent x) / 2)
						@ (Sample09Bullet extent y / 2) negated);
		yourself
]

{ #category : #private }
Sample09 >> newEnemy [
	^ Sample09Enemy new
		init: self;
		position: (engine randomFrom: 0 to: engine width - Sample09Enemy extent x) @ 0;
		yourself
]

{ #category : #private }
Sample09 >> newPlayer [
	^ Sample09Player new
		init: self;
		position: (engine width / 2) @ (engine height - 20);
		yourself.
]

{ #category : #private }
Sample09 >> reset [
	player := self newPlayer.
	score := 0.
	bullets := OrderedCollection new.
	enemies := OrderedCollection new.
	blasts := OrderedCollection new
]

{ #category : #api }
Sample09 >> update [
	(engine isPressing: (RetroGameInputs key: $Q))
		ifTrue: [ self quit ].
	background update.
	scene = self class sceneTitle
		ifTrue: [ self updateTitleScene ]
		ifFalse: [ scene = self class scenePlay
				ifTrue: [ self updatePlayScene ]
				ifFalse: [ scene = self class sceneGameOver
						ifTrue: [ self updateGameOverScene ] ] ]
]

{ #category : #private }
Sample09 >> updateGameOverScene [
	bullets do: #update.
	enemies do: #update.
	blasts do: #update.
	bullets := bullets select: #isAlive.
	enemies := enemies select: #isAlive.
	blasts := blasts select: #isAlive.
	(engine isPressing: RetroGameInputs return)
		ifFalse: [ ^ self ].
	scene := self class scenePlay.
	self reset
]

{ #category : #private }
Sample09 >> updatePlayScene [
	engine frameCount \\ 6 = 0
		ifTrue: [ enemies add: self newEnemy ].
	enemies
		do: [ :enemy | 
			bullets
				do: [ :bullet | 
					(enemy collideWith: bullet)
						ifTrue: [ enemy isAlive: false.
							bullet isAlive: false.
							blasts
								add: (self newBlastAt: enemy position extent: Sample09Enemy extent).
							score := score + 10 ] ] ].
	enemies
		do: [ :enemy | 
			(enemy collideWith: player)
				ifTrue: [ enemy isAlive: false.
					blasts
						add: (self newBlastAt: player position extent: Sample09Player extent).
					scene := self class sceneGameOver ] ].
	player update.
	(engine isPressed: RetroGameInputs space)
		ifTrue: [ bullets add: (self newBulletAt: player position) ].
	bullets do: #update.
	enemies do: #update.
	blasts do: #update.
	bullets := bullets select: #isAlive.
	enemies := enemies select: #isAlive.
	blasts := blasts select: #isAlive
]

{ #category : #private }
Sample09 >> updateTitleScene [
	(engine isPressing: RetroGameInputs return)
		ifFalse: [ ^ self ].
	scene := self class scenePlay
]
