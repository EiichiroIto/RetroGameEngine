Class {
	#name : #RetroGameInputs,
	#superclass : #Object,
	#instVars : [
		'wheel',
		'released',
		'mousePosition',
		'pressing',
		'pressed'
	],
	#category : #'RetroGameEngine-Core'
}

{ #category : #constants }
RetroGameInputs class >> down [
	^ 31
]

{ #category : #constants }
RetroGameInputs class >> escape [
	^ 27
]

{ #category : #constants }
RetroGameInputs class >> key: aCharacter [
	^ aCharacter asUppercase asciiValue
]

{ #category : #constants }
RetroGameInputs class >> left [
	^ 28
]

{ #category : #constants }
RetroGameInputs class >> mouseLeftButton [
	^ 256
]

{ #category : #constants }
RetroGameInputs class >> mouseRightButton [
	^ 257
]

{ #category : #constants }
RetroGameInputs class >> return [
	^ 13
]

{ #category : #constants }
RetroGameInputs class >> right [
	^ 29
]

{ #category : #constants }
RetroGameInputs class >> space [
	^ 32
]

{ #category : #constants }
RetroGameInputs class >> up [
	^ 30
]

{ #category : #api }
RetroGameInputs >> init [
	mousePosition := 0 @ 0.
	pressing := Set new.
	pressed := Set new.
	released := Set new.
	wheel := 0
]

{ #category : #initialization }
RetroGameInputs >> initialize [
	self init
]

{ #category : #api }
RetroGameInputs >> isPressed: aKey [
	^ pressed includes: aKey
]

{ #category : #api }
RetroGameInputs >> isPressing: aKey [
	^ pressing includes: aKey
]

{ #category : #api }
RetroGameInputs >> isReleased: aKey [
	^ released includes: aKey
]

{ #category : #api }
RetroGameInputs >> keyDown: anInteger [
	pressing add: anInteger.
	pressed add: anInteger
]

{ #category : #api }
RetroGameInputs >> keyUp: anInteger [
	released add: anInteger.
	pressing remove: anInteger ifAbsent: [  ]
]

{ #category : #accessing }
RetroGameInputs >> mousePosition [
	^ mousePosition
]

{ #category : #accessing }
RetroGameInputs >> mousePosition: anObject [
	mousePosition := anObject
]

{ #category : #accessing }
RetroGameInputs >> pressed [
	^ pressed
]

{ #category : #accessing }
RetroGameInputs >> pressed: anObject [
	pressed := anObject
]

{ #category : #accessing }
RetroGameInputs >> pressing [
	^ pressing
]

{ #category : #accessing }
RetroGameInputs >> pressing: anObject [
	pressing := anObject
]

{ #category : #accessing }
RetroGameInputs >> released [
	^ released
]

{ #category : #accessing }
RetroGameInputs >> released: anObject [
	released := anObject
]

{ #category : #api }
RetroGameInputs >> update [
	pressed := Set new.
	released := Set new
]

{ #category : #accessing }
RetroGameInputs >> wheel [
	^ wheel
]

{ #category : #accessing }
RetroGameInputs >> wheel: anObject [
	wheel := anObject
]
