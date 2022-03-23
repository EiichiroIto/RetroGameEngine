Class {
	#name : #Sample09Background,
	#superclass : #Object,
	#instVars : [
		'stars'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #api }
Sample09Background >> draw: anApp [
	stars
		do: [ :each | 
			anApp engine
				pixelAt: each first
				put:
					(each second > 1.8
						ifTrue: [ Sample09 starColorHigh ]
						ifFalse: [ Sample09 starColorLow ]) ]
]

{ #category : #api }
Sample09Background >> init: anApp [
	anApp engine
		in: [ :engine | 
			stars := (Array new: Sample09 numStars)
				collect: [ :each | 
					{((engine randomFrom: 0 to: engine width - 1)
						@ (engine randomFrom: 0 to: engine height - 1)).
					(engine randomFloatFrom: 1 to: 2.5)} ] ]
]

{ #category : #api }
Sample09Background >> update: anApp [
	stars := stars
		collect: [ :each | 
			| y |
			y := each first y.
			y := y + each second.
			y >= anApp engine height
				ifTrue: [ y := y - anApp engine height ].
			{(each first x @ y).
			each second} ]
]
