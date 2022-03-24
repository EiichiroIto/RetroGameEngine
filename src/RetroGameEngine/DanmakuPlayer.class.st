Class {
	#name : #DanmakuPlayer,
	#superclass : #DanmakuObject,
	#category : #'RetroGameEngine-Samples'
}

{ #category : #api }
DanmakuPlayer >> draw: anApp [
	anApp engine rect: position + (1 @ 1) extent: extent color: 5
]

{ #category : #api }
DanmakuPlayer >> init: anApp [
	super init: anApp.
	extent := 3 @ 3
]

{ #category : #api }
DanmakuPlayer >> update: anApp [
	| step |
	step := 3.
	anApp engine
		in: [ :engine | 
			((engine isPressing: RetroGameInputs left) and: [ position x >= step ])
				ifTrue: [ position := (position x - step) @ position y ].
			((engine isPressing: RetroGameInputs right)
				and: [ position x < (engine extent x - 1 - step) ])
				ifTrue: [ position := (position x + step) @ position y ].
			((engine isPressing: RetroGameInputs up) and: [ position y >= step ])
				ifTrue: [ position := position x @ (position y - step) ].
			((engine isPressing: RetroGameInputs down)
				and: [ position y < (engine extent y - 1 - step) ])
				ifTrue: [ position := position x @ (position y + step) ] ]
]
