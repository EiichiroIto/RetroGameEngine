"
A SpRetroDemoPlayerTest is a test class for testing the behavior of SpRetroDemoPlayer
"
Class {
	#name : #SpRetroDemoPlayerTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
SpRetroDemoPlayerTest >> newPlayer [
	^ SpRetroDemoPlayer new
]

{ #category : #test }
SpRetroDemoPlayerTest >> testIsRunning [
	| morph |
	morph := self newPlayer.
	self deny: morph isRunning.
	morph isRunning: true.
	self assert: morph isRunning.
	morph isRunning: false.
	self deny: morph isRunning
]

{ #category : #test }
SpRetroDemoPlayerTest >> testNextFrameTime [
	| morph |
	morph := self newPlayer.
	self assert: morph nextFrameTime isNil.
	morph nextFrameTime: 123.
	self assert: morph nextFrameTime equals: 123
]
