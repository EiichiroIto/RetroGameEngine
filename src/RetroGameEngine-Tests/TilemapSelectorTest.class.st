"
A TilemapSelectorTest is a test class for testing the behavior of TilemapSelector
"
Class {
	#name : #TilemapSelectorTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
TilemapSelectorTest >> newObj [
	^ TilemapSelector new
		init: TilemapEditor new;
		yourself
]

{ #category : #test }
TilemapSelectorTest >> testButtonExtent [
	self assert: self newObj buttonExtent isPoint
]

{ #category : #test }
TilemapSelectorTest >> testDefaultPosition [
	self assert: self newObj defaultPosition isPoint
]

{ #category : #test }
TilemapSelectorTest >> testExtent [
	self assert: self newObj extent isPoint
]

{ #category : #test }
TilemapSelectorTest >> testMinusButtonPosition [
	self assert: self newObj minusButtonPosition isPoint
]

{ #category : #test }
TilemapSelectorTest >> testMinusClicked [
	| obj x |
	obj := self newObj.
	x := false.
	obj whenTilemapNoChanged: [ x := true ].
	obj tilemapNo: 3.
	self deny: x.
	self assert: obj tilemapNo equals: 3.
	obj minusClicked.
	self assert: x.
	self assert: obj tilemapNo equals: 2.
	x := false.
	obj tilemapNo: 0.
	self deny: x.
	self assert: obj tilemapNo equals: 0.
	obj minusClicked.
	self deny: x.
	self assert: obj tilemapNo equals: 0
]

{ #category : #test }
TilemapSelectorTest >> testPlusButtonPosition [
	self assert: self newObj plusButtonPosition isPoint
]

{ #category : #test }
TilemapSelectorTest >> testPlusClicked [
	| obj x |
	obj := self newObj.
	x := false.
	obj whenTilemapNoChanged: [ x := true ].
	obj tilemapNo: 3.
	self deny: x.
	self assert: obj tilemapNo equals: 3.
	obj plusClicked.
	self assert: x.
	self assert: obj tilemapNo equals: 4.
	x := false.
	obj tilemapNo: 7.
	self deny: x.
	self assert: obj tilemapNo equals: 7.
	obj plusClicked.
	self deny: x.
	self assert: obj tilemapNo equals: 7
]

{ #category : #test }
TilemapSelectorTest >> testTilemapNo [
	| obj |
	obj := self newObj.
	self assert: obj tilemapNo equals: 0.
	obj tilemapNo: 1.
	self assert: obj tilemapNo equals: 1
]

{ #category : #test }
TilemapSelectorTest >> testTilemapNoChanged [
	| obj x |
	obj := self newObj.
	x := nil.
	obj tilemapNoChanged.
	self assert: x isNil.
	obj whenTilemapNoChanged: [ x := 10 ].
	obj tilemapNoChanged.
	self assert: x equals: 10
]

{ #category : #test }
TilemapSelectorTest >> testTilemapNoPosition [
	self assert: self newObj tilemapNoPosition isPoint
]

{ #category : #test }
TilemapSelectorTest >> testTilemapTextPosition [
	self assert: self newObj tilemapTextPosition isPoint
]

{ #category : #test }
TilemapSelectorTest >> testWhenTilemapNoChanged [
	| obj b |
	obj := self newObj.
	self assert: obj whenTilemapNoChanged isNil.
	b := [ 1 + 2 ].
	obj whenTilemapNoChanged: b.
	self assert: obj whenTilemapNoChanged identicalTo: b
]
