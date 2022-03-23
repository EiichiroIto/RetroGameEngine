"
A RetroGameAppTest is a test class for testing the behavior of RetroGameApp
"
Class {
	#name : #RetroGameAppTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
RetroGameAppTest >> newApp [
	^ RetroGameApp new
]

{ #category : #private }
RetroGameAppTest >> newEngine [
	^ RetroGameEngine new
]

{ #category : #test }
RetroGameAppTest >> testEngine [
	| app e |
	app := self newApp.
	self assert: app engine isNil.
	e := self newEngine.
	app engine: e.
	self assert: app engine identicalTo: e
]

{ #category : #test }
RetroGameAppTest >> testFps [
	| game |
	game := self newApp.
	self assert: game fps equals: 30.
	game fps: 60.
	self assert: game fps equals: 60
]

{ #category : #test }
RetroGameAppTest >> testQuit [
	| app block x |
	app := self newApp.
	x := 10.
	block := [ x := 1 + 2 ].
	app whenQuitBlock: block.
	self assert: x equals: 10.
	app quit.
	self assert: x equals: 3
]

{ #category : #test }
RetroGameAppTest >> testWhenQuitBlock [
	| app block |
	app := self newApp.
	self assert: app whenQuitBlock isNil.
	block := [ 1 + 2 ].
	app whenQuitBlock: block.
	self assert: app whenQuitBlock identicalTo: block
]
