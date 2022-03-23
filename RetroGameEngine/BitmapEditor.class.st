Class {
	#name : #BitmapEditor,
	#superclass : #Morph,
	#instVars : [
		'form',
		'cell',
		'colors',
		'pickedColor'
	],
	#category : #'RetroGameEngine-Morphic'
}

{ #category : #'instance creation' }
BitmapEditor class >> on: aForm [
	self new
		form: aForm;
		extent: aForm extent * 8;
		init;
		openInWorld
]

{ #category : #accessing }
BitmapEditor >> cell [
	^ cell
]

{ #category : #accessing }
BitmapEditor >> cell: anObject [
	cell := anObject
]

{ #category : #accessing }
BitmapEditor >> colors [
	^ colors
]

{ #category : #accessing }
BitmapEditor >> colors: anObject [
	colors := anObject
]

{ #category : #api }
BitmapEditor >> contents [
	| s |
	s := (WriteStream on: String new).
	form storeOn: s.
	^ s contents inspect
]

{ #category : #drawing }
BitmapEditor >> drawOn: aCanvas [
	| x y f ex |
	super drawOn: aCanvas.
	form ifNil: [ ^ self ].
	cell ifNil: [ ^ self ].
	ex := form extent * cell.
	f := form scaledToSize: ex.
	aCanvas drawImage: f at: self topLeft.
	1 to: form width - 1 do: [ :each | 
		x := each * cell x + self left.
		aCanvas
			line: x @ self top
			to: x @ (self top + ex y)
			width: 1
			color: Color gray ].
	1 to: form height - 1 do: [ :each | 
		y := each * cell y + self top.
		aCanvas
			line: self left @ y
			to: (self left + ex x) @ y
			width: 1
			color: Color gray ]
]

{ #category : #accessing }
BitmapEditor >> form [
	^ form
]

{ #category : #accessing }
BitmapEditor >> form: anObject [
	form := anObject deepCopy
]

{ #category : #'event handling' }
BitmapEditor >> handlesMouseDown: evt [
	^ true
]

{ #category : #api }
BitmapEditor >> init [
	cell := self extent // form extent.
	(cell x = 0 or: [ cell y = 0 ])
		ifTrue: [ cell := nil ].
	cell := 1 @ 1 * cell min
]

{ #category : #initialization }
BitmapEditor >> initialize [
	super initialize.
	self extent: 256 @ 256.
	self color: Smalltalk ui theme backgroundColor
]

{ #category : #'event handling' }
BitmapEditor >> mouseDown: evt [
	| p c |
	cell ifNil: [ ^ self ].
	form ifNil: [ ^ self ].
	p := (evt cursorPoint - self topLeft) // cell.
	c := form colorAt: p.
	evt yellowButtonPressed
		ifTrue: [ ^ pickedColor := c ].
	pickedColor ifNil: [ ^ self ].
	form colorAt: p put: pickedColor.
	self changed
]
