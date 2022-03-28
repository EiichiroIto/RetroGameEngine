"
A RetroGameTest is a test class for testing the behavior of RetroGame
"
Class {
	#name : #RetroGameEngineTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
RetroGameEngineTest >> newEngine [
	^ RetroGameEngine new
]

{ #category : #test }
RetroGameEngineTest >> testCamera [
	| engine |
	engine := self newEngine.
	self assert: engine camera equals: 0 @ 0.
	engine camera: 1 @ 2.
	self assert: engine camera equals: 1 @ 2
]

{ #category : #test }
RetroGameEngineTest >> testCeil [
	| engine |
	engine := self newEngine.
	self assert: (engine ceil: 1.2) equals: 2.
	self assert: (engine ceil: -1.2) equals: -1
]

{ #category : #test }
RetroGameEngineTest >> testCircleFrameRadiusColor [
	| e |
	e := self newEngine.
	e extent: 7 @ 7.
	e init.
	e circleFrame: 3 @ 3 radius: 3 color: 5.
	self
		assertCollection: e screen array
		equals: #[
 0 0 5 5 5 0 0
 0 5 0 0 0 5 0
 5 0 0 0 0 0 5
 5 0 0 0 0 0 5
 5 0 0 0 0 0 5
 0 5 0 0 0 5 0
 0 0 5 5 5 0 0
]
]

{ #category : #test }
RetroGameEngineTest >> testCircleRadiusColor [
	| e |
	e := self newEngine.
	e extent: 7 @ 7.
	e init.
	e circle: 3 @ 3 radius: 3 color: 5.
	self
		assertCollection: e screen array
		equals: #[
 0 0 5 5 5 0 0
 0 5 5 5 5 5 0
 5 5 5 5 5 5 5
 5 5 5 5 5 5 5
 5 5 5 5 5 5 5
 0 5 5 5 5 5 0
 0 0 5 5 5 0 0
]
]

{ #category : #test }
RetroGameEngineTest >> testCls [
	| game |
	game := self newEngine.
	game extent: 5 @ 6.
	game init.
	self
		assertCollection: game screen array
		equals: (ByteArray new: 30 withAll: 0).
	game cls: 5.
	self
		assertCollection: game screen array
		equals: (ByteArray new: 30 withAll: 5)
]

{ #category : #test }
RetroGameEngineTest >> testColors [
	| game |
	game := self newEngine.
	self assert: game colors isArray.
	self assert: game colors size equals: 16.
	self assert: game colors first isColor
]

{ #category : #test }
RetroGameEngineTest >> testCos [
	| engine |
	engine := self newEngine.
	self assert: (engine cos: 0) closeTo: 1.
	self assert: (engine cos: 60) closeTo: 0.5.
	self assert: (engine cos: 90) closeTo: 0
]

{ #category : #test }
RetroGameEngineTest >> testExtent [
	| game |
	game := self newEngine.
	self assert: game extent equals: 256 @ 256.
	game extent: 10 @ 20.
	self assert: game extent equals: 10 @ 20
]

{ #category : #test }
RetroGameEngineTest >> testFloor [
	| engine |
	engine := self newEngine.
	self assert: (engine floor: 1.2) equals: 1.
	self assert: (engine floor: 1.5) equals: 1.
	self assert: (engine floor: -1.2) equals: -2
]

{ #category : #test }
RetroGameEngineTest >> testForm [
	| engine f |
	engine := self newEngine.
	self assert: engine form isNil.
	engine
		extent: 10 @ 20;
		init.
	f := engine form.
	self assert: f isForm.
	self assert: f extent equals: 10 @ 20
]

{ #category : #test }
RetroGameEngineTest >> testFrameCount [
	| game |
	game := self newEngine.
	self assert: game frameCount equals: 0.
	game frameCount: 123.
	self assert: game frameCount equals: 123
]

{ #category : #test }
RetroGameEngineTest >> testHeight [
	| engine |
	engine := self newEngine.
	engine extent: 123 @ 456.
	self assert: engine height equals: 456
]

{ #category : #test }
RetroGameEngineTest >> testImageBank [
	| game |
	game := self newEngine.
	self assert: (game imageBank: 0) identicalTo: game imageBanks first.
	self assert: (game imageBank: 2) identicalTo: game imageBanks last
]

{ #category : #test }
RetroGameEngineTest >> testImageBanks [
	| game |
	game := self newEngine.
	self assert: game imageBanks isArray.
	self assert: game imageBanks size equals: 3.
	self assert: (game imageBanks first isKindOf: RetroGameImage)
]

{ #category : #test }
RetroGameEngineTest >> testIncrementFrameCount [
	| e |
	e := self newEngine.
	self assert: e frameCount equals: 0.
	e incrementFrameCount.
	self assert: e frameCount equals: 1.
	e incrementFrameCount.
	self assert: e frameCount equals: 2
]

{ #category : #test }
RetroGameEngineTest >> testInputs [
	| game |
	game := self newEngine.
	self assert: (game inputs isKindOf: RetroGameInputs)
]

{ #category : #test }
RetroGameEngineTest >> testMousePosition [
	| game |
	game := self newEngine.
	self assert: game mousePosition equals: 0 @ 0.
	game mousePosition: 1 @ 2.
	self assert: game mousePosition equals: 1 @ 2
]

{ #category : #test }
RetroGameEngineTest >> testPalette [
	| engine |
	engine := self newEngine.
	self
		assertCollection: engine palette
		equals: #(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15).
	engine palette: #(1 2 3).
	self assertCollection: engine palette equals: #(1 2 3)
]

{ #category : #test }
RetroGameEngineTest >> testRandom [
	| engine r |
	engine := self newEngine.
	self assert: engine random identicalTo: SharedRandom globalGenerator.
	r := Random new.
	engine random: r.
	self assert: engine random identicalTo: r
]

{ #category : #test }
RetroGameEngineTest >> testRandomFloatFromTo [
	| engine |
	engine := self newEngine.
	engine setRandomSeed: 1234.
	self assert: (engine randomFloatFrom: 0 to: 2) closeTo: 0.01931547933226241.
	self assert: (engine randomFloatFrom: 2 to: 3) closeTo: 2.317630568667143.
	self assert: (engine randomFloatFrom: -1 to: 1) closeTo: -0.16606482265799527
]

{ #category : #test }
RetroGameEngineTest >> testRandomFromTo [
	| engine |
	engine := self newEngine.
	engine setRandomSeed: 1234.
	self assert: (engine randomFrom: 1 to: 10) equals: 1.
	self assert: (engine randomFrom: 1 to: 10) equals: 4.
	self assert: (engine randomFrom: 1 to: 10) equals: 5
]

{ #category : #test }
RetroGameEngineTest >> testResetCamera [
	| engine |
	engine := self newEngine.
	engine camera: 1 @ 2.
	self assert: engine camera equals: 1 @ 2.
	engine resetCamera.
	self assert: engine camera equals: 0 @ 0
]

{ #category : #test }
RetroGameEngineTest >> testResetPalette [
	| engine |
	engine := self newEngine.
	self
		assertCollection: engine palette
		equals: #(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15).
	engine setPalette: 0 to: 5.
	engine setPalette: 15 to: 9.
	self
		assertCollection: engine palette
		equals: #(5 1 2 3 4 5 6 7 8 9 10 11 12 13 14 9).
	engine resetPalette.
	self
		assertCollection: engine palette
		equals: #(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
]

{ #category : #test }
RetroGameEngineTest >> testScreen [
	| game |
	game := self newEngine.
	self assert: (game screen isKindOf: RetroGameScreen)
]

{ #category : #test }
RetroGameEngineTest >> testSetPaletteTo [
	| engine |
	engine := self newEngine.
	self
		assertCollection: engine palette
		equals: #(0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15).
	engine setPalette: 0 to: 5.
	engine setPalette: 15 to: 9.
	self
		assertCollection: engine palette
		equals: #(5 1 2 3 4 5 6 7 8 9 10 11 12 13 14 9)
]

{ #category : #test }
RetroGameEngineTest >> testSetRandomSeed [
	| engine |
	engine := self newEngine.
	engine setRandomSeed: 1234.
	self assert: (engine randomFrom: 1 to: 10) equals: 1.
	self assert: (engine randomFrom: 1 to: 10) equals: 4.
	self assert: (engine randomFrom: 1 to: 10) equals: 5.
	engine setRandomSeed: 0.
	self assert: engine random identicalTo: SharedRandom globalGenerator
]

{ #category : #test }
RetroGameEngineTest >> testSetupColors [
	self testColors
]

{ #category : #test }
RetroGameEngineTest >> testSetupImageBanks [
	self testImageBanks
]

{ #category : #test }
RetroGameEngineTest >> testSetupTileMaps [
	self testTileMaps
]

{ #category : #test }
RetroGameEngineTest >> testSin [
	| engine |
	engine := self newEngine.
	self assert: (engine sin: 0) closeTo: 0.
	self assert: (engine sin: 30) closeTo: 0.5.
	self assert: (engine sin: 90) closeTo: 1
]

{ #category : #test }
RetroGameEngineTest >> testSqrt [
	| engine |
	engine := self newEngine.
	self assert: (engine sqrt: 1) closeTo: 1.
	self assert: (engine sqrt: 4) closeTo: 2.
	self assert: (engine sqrt: 9) closeTo: 3
]

{ #category : #test }
RetroGameEngineTest >> testTextAtColor [
	| e r |
	e := self newEngine.
	e extent: 7 @ 7.
	e init.
	e text: 'PH' at: 0 @ 1 color: 5.
	r := e screen array.
	self
		assertCollection: r
		equals:
			#[0 0 0 0 0 0 0 5 5 5 0 5 0 5 5 0 5 0 5 0 5 5 5 5 0 5 5 5 5 0 0 0 5 0 5 5 0 0 0 5 0 5 0 0 0 0 0 0 0]
]

{ #category : #test }
RetroGameEngineTest >> testTileMap [
	| game |
	game := self newEngine.
	self assert: (game tileMap: 0) identicalTo: game tileMaps first.
	self assert: (game tileMap: 7) identicalTo: game tileMaps last
]

{ #category : #test }
RetroGameEngineTest >> testTileMaps [
	| game |
	game := self newEngine.
	self assert: game tileMaps isArray.
	self assert: game tileMaps size equals: 8.
	self assert: (game tileMaps first isKindOf: RetroGameTileMap)
]

{ #category : #test }
RetroGameEngineTest >> testTitle [
	| game |
	game := self newEngine.
	self assert: game title isNil.
	game title: 'abc'.
	self assert: game title equals: 'abc'
]

{ #category : #test }
RetroGameEngineTest >> testTriangleFrameWithWithColor [
	| e |
	e := self newEngine.
	e extent: 6 @ 5.
	e init.
	e
		triangleFrame: 2 @ 1
		with: 0 @ 4
		with: 4 @ 2
		color: 5.
	self
		assertCollection: e screen array
		equals: #[0 0 0 0 0 0 0 0 5 0 0 0 0 5 0 5 5 0 0 5 5 5 0 0 5 5 0 0 0 0]
]

{ #category : #test }
RetroGameEngineTest >> testTriangleWithWithColor [
	| e |
	e := self newEngine.
	e extent: 6 @ 5.
	e init.
	e
		triangle: 2 @ 1
		with: 0 @ 4
		with: 4 @ 2
		color: 5.
	self
		assertCollection: e screen array
		equals: #[0 0 0 0 0 0 0 0 5 5 0 0 0 5 5 5 5 0 5 5 5 5 0 0 5 5 0 0 0 0]
]

{ #category : #test }
RetroGameEngineTest >> testWidth [
	| engine |
	engine := self newEngine.
	engine extent: 123 @ 456.
	self assert: engine width equals: 123
]
