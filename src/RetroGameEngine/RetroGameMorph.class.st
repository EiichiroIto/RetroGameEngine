Class {
	#name : #RetroGameMorph,
	#superclass : #Morph,
	#instVars : [
		'app',
		'offset',
		'magnify',
		'whenStepDo'
	],
	#category : #'RetroGameEngine-Morphic'
}

{ #category : #accessing }
RetroGameMorph >> app [
	^ app
]

{ #category : #accessing }
RetroGameMorph >> app: anObject [
	app := anObject
]

{ #category : #drawing }
RetroGameMorph >> drawOn: aCanvas [
	| info |
	super drawOn: aCanvas.
	app ifNil: [ ^ aCanvas drawString: 'app nil' at: self topLeft ].
	info := app engine displayInfo.
	info first
		ifNil: [ ^ aCanvas drawString: 'screen nil' at: self topLeft ].
	magnify := (self extent // info second) min.
	magnify = 0
		ifTrue: [ ^ aCanvas drawString: 'too small extent' at: self topLeft ].
	offset := (self extent - (info second * magnify)) // 2.
	self drawScreen: info on: aCanvas
]

{ #category : #drawing }
RetroGameMorph >> drawScreen: anArray on: aCanvas [
	| array extent colors x0 x y c cell rect |
	array := anArray first.
	extent := anArray second.
	colors := anArray third.
	x := x0 := self left + offset x.
	y := self top + offset y.
	cell := 1 @ 1 * magnify.
	1 to: array size do: [ :index | 
		c := array at: index.
		rect := Rectangle origin: x @ y extent: cell.
		aCanvas fillRectangle: rect color: (colors at: c + 1).
		x := x + magnify.
		index \\ extent x = 0
			ifTrue: [ x := x0.
				y := y + magnify ] ]
]

{ #category : #'event handling' }
RetroGameMorph >> handlesKeyDown: evt [
	^ true
]

{ #category : #'event handling' }
RetroGameMorph >> handlesKeyUp: evt [
	^ true
]

{ #category : #'event handling' }
RetroGameMorph >> handlesMouseDown: evt [
	^ true
]

{ #category : #'event handling' }
RetroGameMorph >> handlesMouseMove: evt [
	^ true
]

{ #category : #'event handling' }
RetroGameMorph >> keyDown: evt [
	"Transcript
		show: evt;
		show: evt keyValue;
		cr."
	app ifNil: [ ^ self ].
	app engine keyDown: (self keyValueFrom: evt)
]

{ #category : #'event handling' }
RetroGameMorph >> keyUp: evt [
	"Transcript
		show: evt;
		show: evt keyValue;
		cr."
	app ifNil: [ ^ self ].
	app engine keyUp: (self keyValueFrom: evt)
]

{ #category : #private }
RetroGameMorph >> keyValueFrom: anEvent [
	| c |
	c := anEvent keyCharacter.
	c isLetter
		ifTrue: [ c isLowercase
				ifTrue: [ c := c asUppercase ].
			c := c asciiValue ]
		ifFalse: [ c := anEvent keyValue ].
	^ c
]

{ #category : #accessing }
RetroGameMorph >> magnify [
	^ magnify
]

{ #category : #accessing }
RetroGameMorph >> magnify: anObject [
	magnify := anObject
]

{ #category : #'event handling' }
RetroGameMorph >> mouseDown: evt [
	evt hand keyboardFocus: self.
	app ifNil: [ ^ self ].
	app engine
		keyDown:
			(evt yellowButtonPressed
				ifTrue: [ RetroGameInputs mouseRightButton ]
				ifFalse: [ RetroGameInputs mouseLeftButton ])
]

{ #category : #'event handling' }
RetroGameMorph >> mouseMove: evt [
	| pos |
	app ifNil: [ ^ self ].
	offset ifNil: [ ^ self ].
	magnify ifNil: [ ^ self ].
	pos := evt cursorPoint - self topLeft - offset.
	pos := pos / magnify.
	app engine mousePosition: pos truncated
]

{ #category : #'event handling' }
RetroGameMorph >> mouseUp: evt [
	app ifNil: [ ^ self ].
	app engine
		keyUp:
			(evt yellowButtonPressed
				ifTrue: [ RetroGameInputs mouseRightButton ]
				ifFalse: [ RetroGameInputs mouseLeftButton ])
]

{ #category : #accessing }
RetroGameMorph >> offset [
	^ offset
]

{ #category : #accessing }
RetroGameMorph >> offset: anObject [
	offset := anObject
]

{ #category : #'stepping and presenter' }
RetroGameMorph >> step [
	whenStepDo ifNotNil: [ whenStepDo cull: self ]
]

{ #category : #'stepping and presenter' }
RetroGameMorph >> stepTime [
	^ 10
]

{ #category : #'stepping and presenter' }
RetroGameMorph >> wantsSteps [
	^ true
]

{ #category : #accessing }
RetroGameMorph >> whenStepDo [
	^ whenStepDo
]

{ #category : #accessing }
RetroGameMorph >> whenStepDo: anObject [
	whenStepDo := anObject
]
