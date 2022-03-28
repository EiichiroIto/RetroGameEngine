Class {
	#name : #Sample09Background,
	#superclass : #Object,
	#instVars : [
		'stars',
		'app'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #accessing }
Sample09Background >> app [
	^ app
]

{ #category : #accessing }
Sample09Background >> app: anObject [
	app := anObject
]

{ #category : #api }
Sample09Background >> draw [
	stars
		do: [ :each | 
			app engine
				pixelAt: each first
				put:
					(each second > 1.8
						ifTrue: [ Sample09 starColorHigh ]
						ifFalse: [ Sample09 starColorLow ]) ]
]

{ #category : #api }
Sample09Background >> init: anApp [
	app := anApp.
	app engine
		in: [ :engine | 
			stars := (Array new: Sample09 numStars)
				collect: [ :each | 
					{((engine randomFrom: 0 to: engine width - 1)
						@ (engine randomFrom: 0 to: engine height - 1)).
					(engine randomFloatFrom: 1 to: 2.5)} ] ]
]

{ #category : #accessing }
Sample09Background >> stars [
	^ stars
]

{ #category : #accessing }
Sample09Background >> stars: anObject [
	^ stars := anObject
]

{ #category : #api }
Sample09Background >> update [
	stars := stars
		collect: [ :each | 
			| y |
			y := each first y.
			y := y + each second.
			y >= app engine height
				ifTrue: [ y := y - app engine height ].
			{(each first x @ y).
			each second} ]
]
