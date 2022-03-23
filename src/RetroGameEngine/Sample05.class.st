"
Ported demo from Pyxel.

"
Class {
	#name : #Sample05,
	#superclass : #RetroGameApp,
	#category : #'RetroGameEngine-Samples'
}

{ #category : #accessing }
Sample05 class >> title [
	^ '05 Color Palette Demo'
]

{ #category : #api }
Sample05 >> draw [
	0 to: 15 do: [ :each | 
		self
			drawPalette: each
			at: (2 + (each \\ 4 * 64)) @ (4 + (each // 4 * 20)) ]
]

{ #category : #private }
Sample05 >> drawPalette: anInteger at: aPoint [
	| rgb hex dec |
	rgb := engine realColor: anInteger.
	hex := rgb asHexString.
	dec := (rgb red * 255) truncated asString , ','
		, (rgb green * 255) truncated asString , ','
		, (rgb blue * 255) truncated asString.
	engine rect: aPoint extent: 13 @ 13 color: anInteger.
	engine text: hex at: aPoint + (16 @ 1) color: 7.
	engine text: dec at: aPoint + (16 @ 8) color: 7.
	engine
		text: anInteger asString
		at: aPoint + ((5 - (anInteger // 10 * 2)) @ 4)
		color:
			(anInteger < 6
				ifTrue: [ 7 ]
				ifFalse: [ 0 ]).
	anInteger = 0
		ifTrue: [ engine rectFrame: aPoint extent: 13 @ 13 color: 13 ]
]

{ #category : #api }
Sample05 >> init [
	engine
		extent: 255 @ 81;
		title: 'Color Palette';
		init;
		cls: 0
]

{ #category : #api }
Sample05 >> update [
	(engine isPressing: (RetroGameInputs escape))
		ifTrue: [ self quit ]
]
