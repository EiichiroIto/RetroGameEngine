"
A RetroGameTileMapTest is a test class for testing the behavior of RetroGameTileMap
"
Class {
	#name : #RetroGameTilemapTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
RetroGameTilemapTest >> newTilemap [
	^ RetroGameTilemap new
]

{ #category : #test }
RetroGameTilemapTest >> testArray [
	| tileMap a |
	tileMap := self newTilemap.
	self assert: tileMap array isNil.
	a := Array new: 12.
	tileMap array: a.
	self assert: tileMap array identicalTo: a
]

{ #category : #test }
RetroGameTilemapTest >> testArrayString [
	| tileMap |
	tileMap := self newTilemap.
	tileMap
		extent: 11 @ 2;
		init.
	tileMap
		importStrings:
			#('0201 0000 0200 0400 0100 0000 0003 0103 0203 0000 0002'
			  '0202 0300 0001 0101 0201 0300 0000 0100 0200 0300 0003')
		at: 0 @ 0.
	self assert: tileMap arrayString equals: '02010000020004000100000000030103020300000002
02020300000101010201030000000100020003000003
'
]

{ #category : #test }
RetroGameTilemapTest >> testExtent [
	| tileMap |
	tileMap := self newTilemap.
	self assert: tileMap extent isNil.
	tileMap extent: 1 @ 2.
	self assert: tileMap extent equals: 1 @ 2
]

{ #category : #test }
RetroGameTilemapTest >> testImageNo [
	| tileMap |
	tileMap := self newTilemap.
	self assert: tileMap imageNo isNil.
	tileMap imageNo: 1.
	self assert: tileMap imageNo equals: 1.
	tileMap imageNo: 2.
	self assert: tileMap imageNo equals: 2
]

{ #category : #test }
RetroGameTilemapTest >> testImportPairsFromAt [
	| tileMap s |
	tileMap := self newTilemap.
	tileMap extent: 10 @ 10; init.
	s := ReadStream on: '1234'.
	tileMap importPairsFrom: s at: 0 @ 0.
	self assert: (tileMap array at: 1) equals: 16r12.
	self assert: (tileMap array at: 2) equals: 16r34.
	tileMap extent: 10 @ 10; init.
	s := ReadStream on: '1234 5678'.
	tileMap importPairsFrom: s at: 0 @ 1.
	self assert: (tileMap array at: 21) equals: 16r12.
	self assert: (tileMap array at: 22) equals: 16r34.
	self assert: (tileMap array at: 23) equals: 16r56.
	self assert: (tileMap array at: 24) equals: 16r78
]

{ #category : #test }
RetroGameTilemapTest >> testImportStringAt [
	| tileMap |
	tileMap := self newTilemap.
	tileMap
		extent: 256 @ 256;
		init.
	tileMap
		importString: '0000000000000000000000000000000000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000050405000500050005000500050005000500050005000500050005000500050005000500070400000000000000000000000000000502060207020000000000000000050405000500050005000500050005000500050005000500050005000500050005000704000000000000000000000000000000000000000000000000050405000500050005000500050005000500050005000500070706050605060506050605070500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002010000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000101000000000000000000000000000000000101000000000000000000000000000000000000000000000000000000000101000000000000000000000000000000000000050405000500050007040000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000001010000000000000000000000000502
0000000000000000000000000000000000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000050506050605060506050605060506050605060705000500050005000500050005000500070400000000000000000000020100000502060207020000000000000000050405000500050005000600050005000500050005000500050006000500050005000704000000000000000000000000000000000000000000000000050506050605060705000500050006000500050005000500070400000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000401050104010501000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000001000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000100010000000000000000000000000000000100010000000000000000000000000000000000000000000000000001000100010001000000000000000000000000000000050406000500050007040000000000000000000000000000000000000000000007000000000000000700070007000000070007000700000007000700070000000700000000000502'
		at: 0 @ 0
]

{ #category : #test }
RetroGameTilemapTest >> testImportStringsAt [
	| tileMap |
	tileMap := self newTilemap.
	tileMap
		extent: 11 @ 2;
		init.
	tileMap
		importStrings:
			#('0201 0000 0200 0400 0100 0000 0003 0103 0203 0000 0002'
			  '0202 0300 0001 0101 0201 0300 0000 0100 0200 0300 0003')
		at: 0 @ 0.
	self
		assertCollection: tileMap array
		equals:
			#[2 1 0 0 2 0 4 0 1 0 0 0 0 3 1 3 2 3 0 0 0 2
				2 2 3 0 0 1 1 1 2 1 3 0 0 0 1 0 2 0 3 0 0 3]
]

{ #category : #test }
RetroGameTilemapTest >> testIndexOf [
	| tileMap |
	tileMap := self newTilemap.
	tileMap extent: 10 @ 10.
	self assert: (tileMap indexOf: 0 @ 0) equals: 1.
	self assert: (tileMap indexOf: 1 @ 0) equals: 3.
	self assert: (tileMap indexOf: 0 @ 1) equals: 21.
	self assert: (tileMap indexOf: 9 @ 9) equals: 199
]

{ #category : #test }
RetroGameTilemapTest >> testInit [
	| tileMap |
	tileMap := self newTilemap.
	tileMap
		extent: 10 @ 10;
		init.
	self assert: (tileMap array isKindOf: ByteArray).
	self assert: tileMap array size equals: 200
]

{ #category : #test }
RetroGameTilemapTest >> testTileAt [
	| tileMap |
	tileMap := self newTilemap.
	tileMap
		extent: 11 @ 2;
		init.
	tileMap
		importStrings:
			#('0201 0000 0200 0400 0100 0000 0003 0103 0203 0000 0002'
			  '0202 0300 0001 0101 0201 0300 0000 0100 0200 0300 0003')
		at: 0 @ 0.
	self assertCollection: (tileMap tileAt: 0 @ 0) equals: 2 @ 1.
	self assertCollection: (tileMap tileAt: 10 @ 0) equals: 0 @ 2.
	self assertCollection: (tileMap tileAt: 0 @ 1) equals: 2 @ 2.
	self assertCollection: (tileMap tileAt: 10 @ 1) equals: 0 @ 3.
	self assertCollection: (tileMap tileAt: -1 @ -1) equals: 0 @ 0.
	self assertCollection: (tileMap tileAt: 1000 @ 1000) equals: 0 @ 0
]

{ #category : #test }
RetroGameTilemapTest >> testTileAtPut [
	| tileMap |
	tileMap := self newTilemap.
	tileMap
		extent: 6 @ 2;
		init.
	tileMap tileAt: 0 @ 0 put: 2 @ 1.
	tileMap tileAt: 5 @ 0 put: 0 @ 2.
	tileMap tileAt: 0 @ 1 put: 2 @ 2.
	tileMap tileAt: 5 @ 1 put: 0 @ 3.
	tileMap tileAt: -1 @ -1 put: 0 @ 0.
	tileMap tileAt: 1000 @ 1000 put: 0 @ 0.
	self assert: tileMap arrayString equals: '020100000000000000000002
020200000000000000000003
'
]
