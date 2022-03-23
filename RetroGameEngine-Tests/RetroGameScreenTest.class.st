"
A RetroGameScreenTest is a test class for testing the behavior of RetroGameScreen
"
Class {
	#name : #RetroGameScreenTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
RetroGameScreenTest >> newScreen [
	^ RetroGameScreen new
]

{ #category : #test }
RetroGameScreenTest >> testArray [
	| s a |
	s := self newScreen.
	self assert: s array isNil.
	a := #(1 2 3 4 5).
	s array: a.
	self assert: s array identicalTo: a
]

{ #category : #test }
RetroGameScreenTest >> testClipExtent [
	| screen |
	screen := self newScreen.
	screen
		extent: 2 @ 3;
		init.
	screen pixelAt: 0 @ 0 put: 1.
	screen pixelAt: 1 @ 0 put: 2.
	screen pixelAt: 0 @ 1 put: 3.
	screen pixelAt: 1 @ 1 put: 4.
	screen pixelAt: 0 @ 2 put: 5.
	screen pixelAt: 1 @ 2 put: 6.
	self assertCollection: screen array equals: #[1 2 3 4 5 6].
	screen clip: 0 @ 1 extent: 2 @ 2.
	screen pixelAt: 0 @ 0 put: 10.
	screen pixelAt: 1 @ 0 put: 20.
	screen pixelAt: 0 @ 1 put: 30.
	screen pixelAt: 1 @ 1 put: 40.
	screen pixelAt: 0 @ 2 put: 50.
	screen pixelAt: 1 @ 2 put: 60.
	self assertCollection: screen array equals: #[1 2 30 40 50 60]
]

{ #category : #test }
RetroGameScreenTest >> testExtent [
	| s |
	s := self newScreen.
	self assert: s extent equals: 256 @ 256.
	s extent: 123 @ 345.
	self assert: s extent equals: 123 @ 345
]

{ #category : #test }
RetroGameScreenTest >> testHLineFromLengthColor [
	| s |
	s := self newScreen.
	s extent: 5 @ 4.
	s init.
	s hLineFrom: 8 length: 3 color: 4.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 4 4 4 0 0 0 0 0 0 0 0 0 0].
	s := self newScreen.
	s extent: 5 @ 4.
	s init.
	s mask: (Array new: 20 withAll: true).
	s mask at: 9 put: false.
	s hLineFrom: 8 length: 3 color: 4.
	self
		assertCollection: s array
		equals: #[0 0 0 0 0 0 0 4 0 4 0 0 0 0 0 0 0 0 0 0]
]

{ #category : #test }
RetroGameScreenTest >> testInit [
	| s |
	s := self newScreen.
	self assert: s array isNil.
	s extent: 3 @ 4.
	s init.
	self assert: s array size equals: 12.
	self assertCollection: s array equals: (ByteArray new: 12).
	self assert: s mask isNil
]

{ #category : #test }
RetroGameScreenTest >> testMask [
	| screen a |
	screen := self newScreen.
	self assert: screen mask isNil.
	a := {true . false . true}.
	screen mask: a.
	self assert: screen mask identicalTo: a
]

{ #category : #test }
RetroGameScreenTest >> testPixelAtPut [
	| s |
	s := self newScreen.
	s extent: 3 @ 4.
	s init.
	s pixelAt: -1 @ 0 put: 99.
	s pixelAt: 0 @ 0 put: 1.
	s pixelAt: 1 @ 0 put: 2.
	s pixelAt: 2 @ 0 put: 3.
	s pixelAt: 0 @ 1 put: 4.
	s pixelAt: 1 @ 1 put: 5.
	s pixelAt: 2 @ 1 put: 6.
	s pixelAt: 0 @ 2 put: 7.
	s pixelAt: 1 @ 2 put: 8.
	s pixelAt: 2 @ 2 put: 9.
	s pixelAt: 0 @ 3 put: 10.
	s pixelAt: 1 @ 3 put: 11.
	s pixelAt: 2 @ 3 put: 12.
	s pixelAt: 2 @ 4 put: 99.
	self assertCollection: s array equals: #[1 2 3 4 5 6 7 8 9 10 11 12].
	s := self newScreen.
	s extent: 3 @ 4.
	s init.
	s mask: (Array new: 12 withAll: true).
	s mask at: 5 put: false.
	s pixelAt: 0 @ 0 put: 1.
	s pixelAt: 1 @ 0 put: 2.
	s pixelAt: 2 @ 0 put: 3.
	s pixelAt: 0 @ 1 put: 4.
	s pixelAt: 1 @ 1 put: 5.
	s pixelAt: 2 @ 1 put: 6.
	s pixelAt: 0 @ 2 put: 7.
	s pixelAt: 1 @ 2 put: 8.
	s pixelAt: 2 @ 2 put: 9.
	s pixelAt: 0 @ 3 put: 10.
	s pixelAt: 1 @ 3 put: 11.
	s pixelAt: 2 @ 3 put: 12.
	self assertCollection: s array equals: #[1 2 3 4 0 6 7 8 9 10 11 12]
]

{ #category : #test }
RetroGameScreenTest >> testResetClip [
	| s |
	s := self newScreen.
	self assert: s array isNil.
	s extent: 3 @ 4.
	s init.
	s mask: #(1 2 3).
	s resetClip.
	self assert: s mask isNil
]

{ #category : #test }
RetroGameScreenTest >> testVLineFromLengthWidthColor [
	| s |
	s := self newScreen.
	s extent: 5 @ 4.
	s init.
	s
		vLineFrom: 3
		length: 3
		width: 5
		color: 6.
	self
		assertCollection: s array
		equals: #[0 0 6 0 0 0 0 6 0 0 0 0 6 0 0 0 0 0 0 0].
	s := self newScreen.
	s extent: 5 @ 4.
	s init.
	s mask: (Array new: 20 withAll: true).
	s mask at: 8 put: false.
	s
		vLineFrom: 3
		length: 3
		width: 5
		color: 6.
	self
		assertCollection: s array
		equals: #[0 0 6 0 0 0 0 0 0 0 0 0 6 0 0 0 0 0 0 0]
]
