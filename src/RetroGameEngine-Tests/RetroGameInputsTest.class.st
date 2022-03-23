"
A RetroGameInputsTest is a test class for testing the behavior of RetroGameInputs
"
Class {
	#name : #RetroGameInputsTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
RetroGameInputsTest >> newInputs [
	^ RetroGameInputs new
]

{ #category : #test }
RetroGameInputsTest >> testIsPressed [
	| inputs |
	inputs := self newInputs.
	self deny: (inputs isPressed: RetroGameInputs escape).
	inputs keyDown: RetroGameInputs escape.
	self assert: (inputs isPressed: RetroGameInputs escape).
	inputs keyUp: RetroGameInputs escape.
	self assert: (inputs isPressed: RetroGameInputs escape).
	inputs update.
	self deny: (inputs isPressed: RetroGameInputs escape)
]

{ #category : #test }
RetroGameInputsTest >> testIsPressing [
	| inputs |
	inputs := self newInputs.
	self deny: (inputs isPressing: RetroGameInputs escape).
	inputs keyDown: RetroGameInputs escape.
	self assert: (inputs isPressing: RetroGameInputs escape).
	inputs keyUp: RetroGameInputs escape.
	self deny: (inputs isPressing: RetroGameInputs escape)
]

{ #category : #test }
RetroGameInputsTest >> testIsReleased [
	| inputs |
	inputs := self newInputs.
	self deny: (inputs isReleased: RetroGameInputs escape).
	inputs keyDown: RetroGameInputs escape.
	self deny: (inputs isReleased: RetroGameInputs escape).
	inputs keyUp: RetroGameInputs escape.
	self assert: (inputs isReleased: RetroGameInputs escape).
	inputs keyDown: RetroGameInputs escape.
	self assert: (inputs isReleased: RetroGameInputs escape).
	inputs update.
	self deny: (inputs isReleased: RetroGameInputs escape)
]

{ #category : #test }
RetroGameInputsTest >> testKeyDown [
	| inputs |
	inputs := self newInputs.
	self assert: inputs released isEmpty.
	self assert: inputs pressed isEmpty.
	inputs keyDown: RetroGameInputs escape.
	self assert: (inputs pressed includes: RetroGameInputs escape).
	self assert: inputs released isEmpty
]

{ #category : #test }
RetroGameInputsTest >> testKeyUp [
	| inputs |
	inputs := self newInputs.
	self assert: inputs released isEmpty.
	self assert: inputs pressing isEmpty.
	inputs keyDown: RetroGameInputs escape.
	self assert: inputs released isEmpty.
	self assert: (inputs pressing includes: RetroGameInputs escape).
	inputs keyUp: RetroGameInputs escape.
	self assert: (inputs released includes: RetroGameInputs escape).
	self assert: inputs pressing isEmpty.
	inputs update.
	self assert: inputs released isEmpty.
	self assert: inputs pressing isEmpty
]

{ #category : #test }
RetroGameInputsTest >> testMousePosition [
	| inputs |
	inputs := self newInputs.
	self assert: inputs mousePosition equals: 0 @ 0.
	inputs mousePosition: 1 @ 2.
	self assert: inputs mousePosition equals: 1 @ 2
]

{ #category : #test }
RetroGameInputsTest >> testPressed [
	| inputs |
	inputs := self newInputs.
	self assert: (inputs pressed isKindOf: Set).
	self assert: inputs pressed isEmpty
]

{ #category : #test }
RetroGameInputsTest >> testPressing [
	| inputs |
	inputs := self newInputs.
	self assert: (inputs pressing isKindOf: Set).
	self assert: inputs pressing isEmpty
]

{ #category : #test }
RetroGameInputsTest >> testReleased [
	| inputs |
	inputs := self newInputs.
	self assert: (inputs released isKindOf: Set).
	self assert: inputs released isEmpty
]

{ #category : #test }
RetroGameInputsTest >> testUpdate [
	| inputs |
	inputs := self newInputs.
	self deny: (inputs isPressing: RetroGameInputs escape).
	self deny: (inputs isPressed: RetroGameInputs escape).
	self deny: (inputs isReleased: RetroGameInputs escape).
	inputs keyDown: RetroGameInputs escape.
	self assert: (inputs isPressing: RetroGameInputs escape).
	self assert: (inputs isPressed: RetroGameInputs escape).
	self deny: (inputs isReleased: RetroGameInputs escape).
	inputs keyUp: RetroGameInputs escape.
	self deny: (inputs isPressing: RetroGameInputs escape).
	self assert: (inputs isPressed: RetroGameInputs escape).
	self assert: (inputs isReleased: RetroGameInputs escape).
	inputs update.
	self deny: (inputs isPressing: RetroGameInputs escape).
	self deny: (inputs isPressed: RetroGameInputs escape).
	self deny: (inputs isReleased: RetroGameInputs escape)
]

{ #category : #test }
RetroGameInputsTest >> testWheel [
	| inputs |
	inputs := self newInputs.
	self assert: inputs wheel equals: 0.
	inputs wheel: 10.
	self assert: inputs wheel equals: 10
]
