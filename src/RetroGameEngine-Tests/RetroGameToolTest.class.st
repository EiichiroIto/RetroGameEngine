"
A RetroGameToolTest is a test class for testing the behavior of RetroGameTool
"
Class {
	#name : #RetroGameToolTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
RetroGameToolTest >> newApp [
	^ RetroGameTool new
]

{ #category : #test }
RetroGameToolTest >> testCompactArrayStringFrom [
	| app r |
	app := self newApp.
	r := app class
		compactArrayStringFrom:
			'00000000
0000000010000000
000000001000000000000000
00000000
0000000000000000'.
	self
		assertCollection: r
		equals: #('0000000000000000' '0000000010000000' '0000000010000000').
	app := self newApp.
	r := app class
		compactArrayStringFrom:
			'00000000
0000000000000000
000000000000000000000000
00000000
0000000000000000'.
	self assert: r isEmpty
]

{ #category : #test }
RetroGameToolTest >> testControls [
	| editor a |
	editor := self newApp.
	self assert: editor controls isNil.
	a := Array with: 5.
	editor controls: a.
	self assert: editor controls identicalTo: a
]

{ #category : #test }
RetroGameToolTest >> testDialog [
	| editor d |
	editor := self newApp.
	self assert: editor dialog isNil.
	d := ImageEditorYesNoDialog new.
	editor dialog: d.
	self assert: editor dialog identicalTo: d
]

{ #category : #test }
RetroGameToolTest >> testReducedCharactersOf [
	| app |
	app := self newApp.
	self assert: (app class reducedCharactersOf: '00000') equals: 0.
	self assert: (app class reducedCharactersOf: '00010') equals: 4.
	self assert: (app class reducedCharactersOf: '12000') equals: 2.
	self assert: (app class reducedCharactersOf: '0000100') equals: 5
]

{ #category : #test }
RetroGameToolTest >> testReducedLinesOf [
	| app a |
	app := self newApp.
	a := #('000000' '000100000' '0000' '0000000').
	self assert: (app class reducedLinesOf: a) equals: 2.
	a := #('000001' '000100000' '1000' '0000020').
	self assert: (app class reducedLinesOf: a) equals: 4.
	a := #('000000' '000000000' '0000' '00000000').
	self assert: (app class reducedLinesOf: a) equals: 0
]
