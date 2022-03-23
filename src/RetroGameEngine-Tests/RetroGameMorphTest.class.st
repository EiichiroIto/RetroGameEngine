"
A RetroGameMorphTest is a test class for testing the behavior of RetroGameMorph
"
Class {
	#name : #RetroGameMorphTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
RetroGameMorphTest >> newEngine [
	^ RetroGameEngine new
]

{ #category : #private }
RetroGameMorphTest >> newMorph [
	^ RetroGameMorph new
]

{ #category : #test }
RetroGameMorphTest >> testApp [
	| morph app |
	morph := self newMorph.
	app := Sample01 new.
	self assert: morph app isNil.
	morph app: app.
	self assert: morph app identicalTo: app
]

{ #category : #test }
RetroGameMorphTest >> testOffset [
	| morph |
	morph := self newMorph.
	self assert: morph offset isNil.
	morph offset: 1 @ 2.
	self assert: morph offset equals: 1 @ 2
]
