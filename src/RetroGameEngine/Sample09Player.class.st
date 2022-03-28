Class {
	#name : #Sample09Player,
	#superclass : #Sample09Object,
	#category : #'RetroGameEngine-Samples'
}

{ #category : #constants }
Sample09Player class >> extent [
	^ 8 @ 8
]

{ #category : #constants }
Sample09Player class >> speed [
	^ 2
]

{ #category : #api }
Sample09Player >> draw [
	app engine blt: position imageBank: 0 at: 0 @ 0 extent: self class extent transparentColor: 0
]

{ #category : #api }
Sample09Player >> update [
	| x y |
	x := position x.
	y := position y.
	app engine
		in: [ :engine | 
			(engine isPressing: RetroGameInputs left)
				ifTrue: [ x := x - self class speed ].
			(engine isPressing: RetroGameInputs right)
				ifTrue: [ x := x + self class speed ].
			(engine isPressing: RetroGameInputs up)
				ifTrue: [ y := y - self class speed ].
			(engine isPressing: RetroGameInputs down)
				ifTrue: [ y := y + self class speed ].
			x := x max: 0.
			x := x min: engine width - self class extent x.
			y := y max: 0.
			y := y min: engine height - self class extent y ].
	position := x @ y
]
