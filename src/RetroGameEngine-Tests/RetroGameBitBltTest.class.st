"
A RetroGameBitBltTest is a test class for testing the behavior of RetroGameBitBlt
"
Class {
	#name : #RetroGameBitBltTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
RetroGameBitBltTest >> newBitBlt [
	^ RetroGameBitBlt new
]

{ #category : #test }
RetroGameBitBltTest >> testClipExtent [
	| bitBlt |
	bitBlt := self newBitBlt.
	self assert: bitBlt clipExtent isNil.
	bitBlt clipExtent: 2 @ 3.
	self assert: bitBlt clipExtent equals: 2 @ 3
]

{ #category : #test }
RetroGameBitBltTest >> testClipRange [
	| bitBlt |
	bitBlt := self newBitBlt
		destExtent: 5 @ 6;
		destPoint: 1 @ 2;
		sourceExtent: 3 @ 3;
		sourcePoint: 1 @ 0;
		clipExtent: 2 @ 3;
		clipRange.
	self assert: bitBlt destExtent equals: 5 @ 6.
	self assert: bitBlt destPoint equals: 1 @ 2.
	self assert: bitBlt sourceExtent equals: 3 @ 3.
	self assert: bitBlt sourcePoint equals: 1 @ 0.
	self assert: bitBlt clipExtent equals: 2 @ 3.
	bitBlt := self newBitBlt
		destExtent: 5 @ 6;
		destPoint: 1 @ 2;
		sourceExtent: 10 @ 10;
		sourcePoint: -2 @ -3;
		clipExtent: 6 @ 5;
		clipRange.
	self assert: bitBlt destExtent equals: 5 @ 6.
	self assert: bitBlt destPoint equals: 1 @ 2.
	self assert: bitBlt sourceExtent equals: 10 @ 10.
	self assert: bitBlt sourcePoint equals: 0 @ 0.
	self assert: bitBlt clipExtent equals: 4 @ 2.
	bitBlt := self newBitBlt
		destExtent: 5 @ 6;
		destPoint: -1 @ -2;
		sourceExtent: 10 @ 10;
		sourcePoint: 0 @ 0;
		clipExtent: 6 @ 5;
		clipRange.
	self assert: bitBlt destExtent equals: 5 @ 6.
	self assert: bitBlt destPoint equals: 0 @ 0.
	self assert: bitBlt sourceExtent equals: 10 @ 10.
	self assert: bitBlt sourcePoint equals: 1 @ 2.
	self assert: bitBlt clipExtent equals: 5 @ 3.
	bitBlt := self newBitBlt
		destExtent: 8 @ 7;
		destPoint: 7 @ 5;
		sourceExtent: 10 @ 10;
		sourcePoint: 1 @ 1;
		clipExtent: 3 @ 3;
		clipRange.
	self assert: bitBlt destExtent equals: 8 @ 7.
	self assert: bitBlt destPoint equals: 7 @ 5.
	self assert: bitBlt sourceExtent equals: 10 @ 10.
	self assert: bitBlt sourcePoint equals: 1 @ 1.
	self assert: bitBlt clipExtent equals: 1 @ 2
]

{ #category : #test }
RetroGameBitBltTest >> testCopyBits [
	| bitBlt dest source |
	bitBlt := self newBitBlt.
	dest := #(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0).
	source := #(0 1 2 0 3 4 0 5 6).
	bitBlt
		destArray: dest;
		destExtent: 5 @ 6;
		destPoint: 1 @ 2;
		sourceArray: source;
		sourceExtent: 3 @ 3;
		sourcePoint: 1 @ 0;
		clipExtent: 2 @ 3;
		transparentColor: 5;
		copyBits.
	self
		assertCollection: dest
		equals: #(0 0 0 0 0 0 0 0 0 0 0 1 2 0 0 0 3 4 0 0 0 0 6 0 0 0 0 0 0 0).
	bitBlt := self newBitBlt.
	dest := Array new: 30 withAll: 0.
	source := #(0 1 2 0 3 4 0 5 6).
	bitBlt
		destArray: dest;
		destExtent: 5 @ 6;
		destPoint: 1 @ 2;
		sourceArray: source;
		sourceExtent: 3 @ 3;
		sourcePoint: 1 @ 0;
		clipExtent: 2 @ 3;
		copyBits.
	self
		assertCollection: dest
		equals: #(0 0 0 0 0 0 0 0 0 0 0 1 2 0 0 0 3 4 0 0 0 5 6 0 0 0 0 0 0 0).
	bitBlt := self newBitBlt.
	dest := #(1 2 3 4).
	source := #(1 2 3 4 5 6 7 8 9).
	bitBlt
		destArray: dest;
		destExtent: 2 @ 2;
		destPoint: 0 @ 0;
		sourceArray: source;
		sourceExtent: 3 @ 3;
		sourcePoint: 1 @ 1;
		clipExtent: 3 @ 3;
		copyBits.
	self assertCollection: dest equals: #(5 6 8 9).
	bitBlt := self newBitBlt.
	dest := #(1 2 3 4).
	source := #(1 2 3 4 5 6 7 8 9).
	bitBlt
		destArray: dest;
		destExtent: 2 @ 2;
		destPoint: 0 @ 0;
		sourceArray: source;
		sourceExtent: 3 @ 3;
		sourcePoint: -1 @ -1;
		clipExtent: 3 @ 3;
		copyBits.
	self assertCollection: dest equals: #(1 2 4 5).
	bitBlt := self newBitBlt.
	dest := #(1 2 3 4).
	source := #(1 2 3 4 5 6 7 8 9).
	bitBlt
		destArray: dest;
		destExtent: 2 @ 2;
		destPoint: 0 @ 0;
		sourceArray: source;
		sourceExtent: 3 @ 3;
		sourcePoint: -3 @ -3;
		clipExtent: 3 @ 3;
		copyBits.
	self assertCollection: dest equals: #(1 2 3 4).
	bitBlt := self newBitBlt.
	dest := #(1 2 3 4).
	source := #(1 2 3 4 5 6 7 8 9).
	bitBlt
		destArray: dest;
		destExtent: 2 @ 2;
		destPoint: 0 @ 0;
		sourceArray: source;
		sourceExtent: 3 @ 3;
		sourcePoint: 3 @ 3;
		clipExtent: 3 @ 3;
		copyBits.
	self assertCollection: dest equals: #(1 2 3 4).
	bitBlt := self newBitBlt.
	dest := #(1 2 3 4).
	source := #(1 2 3 4 5 6 7 8 9).
	bitBlt
		destArray: dest;
		destExtent: 2 @ 2;
		destPoint: 2 @ 2;
		sourceArray: source;
		sourceExtent: 3 @ 3;
		sourcePoint: 0 @ 0;
		clipExtent: 3 @ 3;
		copyBits.
	self assertCollection: dest equals: #(1 2 3 4).
	bitBlt := self newBitBlt.
	dest := #(1 2 3 4).
	source := #(1 2 3 4 5 6 7 8 9).
	bitBlt
		destArray: dest;
		destExtent: 2 @ 2;
		destPoint: -2 @ -2;
		sourceArray: source;
		sourceExtent: 3 @ 3;
		sourcePoint: 0 @ 0;
		clipExtent: 3 @ 3;
		copyBits.
	self assertCollection: dest equals: #(1 2 3 4)
]

{ #category : #test }
RetroGameBitBltTest >> testDestArray [
	| bitBlt a |
	bitBlt := self newBitBlt.
	self assert: bitBlt destArray isNil.
	a := #(1 2 3 4).
	bitBlt destArray: a.
	self assert: bitBlt destArray identicalTo: a
]

{ #category : #test }
RetroGameBitBltTest >> testDestExtent [
	| bitBlt |
	bitBlt := self newBitBlt.
	self assert: bitBlt destExtent isNil.
	bitBlt destExtent: 2 @ 3.
	self assert: bitBlt destExtent equals: 2 @ 3
]

{ #category : #test }
RetroGameBitBltTest >> testDestIndexOf [
	| bitBlt dest |
	bitBlt := self newBitBlt.
	dest := #(0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0).
	bitBlt
		destArray: dest;
		destExtent: 5 @ 6.
	self assert: (bitBlt destIndexOf: 0 @ 0) equals: 1.
	self assert: (bitBlt destIndexOf: 1 @ 0) equals: 2.
	self assert: (bitBlt destIndexOf: 0 @ 1) equals: 6.
	self assert: (bitBlt destIndexOf: 1 @ 1) equals: 7.
	self assert: (bitBlt destIndexOf: 0 @ 2) equals: 11.
	self assert: (bitBlt destIndexOf: 1 @ 2) equals: 12
]

{ #category : #test }
RetroGameBitBltTest >> testDestMask [
	| bitBlt a |
	bitBlt := self newBitBlt.
	self assert: bitBlt destMask isNil.
	a := {true . false . true}.
	bitBlt destMask: a.
	self assert: bitBlt destMask identicalTo: a
]

{ #category : #test }
RetroGameBitBltTest >> testDestPoint [
	| bitBlt |
	bitBlt := self newBitBlt.
	self assert: bitBlt destPoint isNil.
	bitBlt destPoint: 2 @ 3.
	self assert: bitBlt destPoint equals: 2 @ 3
]

{ #category : #test }
RetroGameBitBltTest >> testSourceArray [
	| bitBlt a |
	bitBlt := self newBitBlt.
	self assert: bitBlt sourceArray isNil.
	a := #(1 2 3 4).
	bitBlt sourceArray: a.
	self assert: bitBlt sourceArray identicalTo: a
]

{ #category : #test }
RetroGameBitBltTest >> testSourceExtent [
	| bitBlt |
	bitBlt := self newBitBlt.
	self assert: bitBlt sourceExtent isNil.
	bitBlt sourceExtent: 2 @ 3.
	self assert: bitBlt sourceExtent equals: 2 @ 3
]

{ #category : #test }
RetroGameBitBltTest >> testSourceIndexOf [
	| bitBlt source |
	bitBlt := self newBitBlt.
	source := #(1 2 3 4 5 6).
	bitBlt
		sourceArray: source;
		sourceExtent: 2 @ 3.
	self assert: (bitBlt sourceIndexOf: 0 @ 0) equals: 1.
	self assert: (bitBlt sourceIndexOf: 1 @ 0) equals: 2.
	self assert: (bitBlt sourceIndexOf: 0 @ 1) equals: 3.
	self assert: (bitBlt sourceIndexOf: 1 @ 1) equals: 4.
	self assert: (bitBlt sourceIndexOf: 0 @ 2) equals: 5.
	self assert: (bitBlt sourceIndexOf: 1 @ 2) equals: 6
]

{ #category : #test }
RetroGameBitBltTest >> testSourcePoint [
	| bitBlt |
	bitBlt := self newBitBlt.
	self assert: bitBlt sourcePoint isNil.
	bitBlt sourcePoint: 2 @ 3.
	self assert: bitBlt sourcePoint equals: 2 @ 3
]

{ #category : #test }
RetroGameBitBltTest >> testTransparentColor [
	| bitBlt |
	bitBlt := self newBitBlt.
	self assert: bitBlt transparentColor isNil.
	bitBlt transparentColor: 5.
	self assert: bitBlt transparentColor equals: 5
]
