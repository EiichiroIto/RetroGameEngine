"
Ported game from Pyxel.

"
Class {
	#name : #Sample06,
	#superclass : #RetroGameApp,
	#instVars : [
		'isExploded',
		'bubbles'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #constants }
Sample06 class >> maxBubbleSpeed [
	^ 1.8
]

{ #category : #constants }
Sample06 class >> numExplodeBubbles [
	^ 11

]

{ #category : #constants }
Sample06 class >> numInitialBubbles [
	^ 50
]

{ #category : #constants }
Sample06 class >> screenHeight [
	^ 256
]

{ #category : #constants }
Sample06 class >> screenWidth [
	^ 256
]

{ #category : #accessing }
Sample06 class >> title [
	^ '06 Bubbles Game'
]

{ #category : #private }
Sample06 >> checkBubble: aBubble collisionAt: anInteger [
	anInteger - 1 to: 1 by: -1 do: [ :index2 | 
		| bj bubble totalR |
		bj := bubbles at: index2.
		(bj ~= aBubble and: [ aBubble intersects: bj ])
			ifTrue: [ totalR := aBubble radius + bj radius.
				bubble := self newBubble
					radius: (engine sqrt: aBubble radius squared + bj radius squared);
					position:
						(aBubble position * aBubble radius + (bj position * bj radius))
							/ totalR;
					velocity:
						(aBubble velocity * aBubble radius + (bj velocity * bj radius))
							/ totalR.
				bubbles at: index2 put: bubble.
				^ true ] ].
	^ false
]

{ #category : #private }
Sample06 >> checkBubbleClicked [
	bubbles copy
		do: [ :each | 
			| newRadius |
			(each containsPoint: engine mousePosition)
				ifTrue: [ isExploded := true.
					newRadius := engine
						sqrt: each radius * each radius / self class numExplodeBubbles.
					0 to: self class numExplodeBubbles do: [ :j | 
						| angle bubble r cos sin |
						r := newRadius + each radius.
						angle := 360 * j / self class numExplodeBubbles.
						cos := engine cos: angle.
						sin := engine sin: angle.
						bubble := self newBubble
							position: each position + ((r * cos) @ (r * sin));
							radius: newRadius;
							velocity: cos @ sin * self class maxBubbleSpeed.
						bubbles add: bubble ].
					bubbles remove: each.
					^ self ] ]
]

{ #category : #private }
Sample06 >> checkBubblesCollision [
	bubbles copy
		reverseWithIndexDo: [ :each :index | 
			each update.
			(self checkBubble: each collisionAt: index)
				ifTrue: [ bubbles remove: each ifAbsent: [  ] ] ]
]

{ #category : #api }
Sample06 >> draw [
	engine cls: 0.
	bubbles do: #draw.
	(isExploded not and: [ engine frameCount \\ 20 < 10 ])
		ifTrue: [ engine
				text: 'CLICK ON BUBBLE'
				at: 96 @ 50
				color: engine frameCount \\ 15 + 1 ]
]

{ #category : #api }
Sample06 >> init [
	engine
		extent: self class screenWidth @ self class screenHeight;
		title: 'Bubbles';
		init.
	engine showMouse: true.
	isExploded := false.
	bubbles := ((Array new: self class numInitialBubbles)
		collect: [ :each | self newBubble ]) asOrderedCollection
]

{ #category : #private }
Sample06 >> newBubble [
	^ Sample06Bubble new
		init: self;
		yourself
]

{ #category : #api }
Sample06 >> update [
	(engine isPressing: (RetroGameInputs key: $Q))
		ifTrue: [ self quit ].
	(engine isPressing: RetroGameInputs mouseLeftButton)
		ifTrue: [ self checkBubbleClicked ].
	self checkBubblesCollision
]
