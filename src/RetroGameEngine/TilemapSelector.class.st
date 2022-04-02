Class {
	#name : #TilemapSelector,
	#superclass : #RetroGameObject,
	#instVars : [
		'tilemapNo',
		'whenTilemapNoChanged'
	],
	#category : #'RetroGameEngine-TilemapEditor'
}

{ #category : #constants }
TilemapSelector >> buttonExtent [
	^ 7 @ 7
]

{ #category : #constants }
TilemapSelector >> defaultPosition [
	^ 4 @ 150
]

{ #category : #api }
TilemapSelector >> draw [
	| e |
	e := app engine.
	e rect: position extent: self extent color: 1.
	e text: 'TILEMAP' at: self tilemapTextPosition color: 7.
	e text: tilemapNo asString at: self tilemapNoPosition color: 7.
	e rect: self minusButtonPosition extent: self buttonExtent color: 6.
	e text: '-' at: self minusButtonPosition + (2 @ 1) color: 0.
	e rect: self plusButtonPosition extent: self buttonExtent color: 6.
	e text: '+' at: self plusButtonPosition + (2 @ 1) color: 0.
]

{ #category : #accessing }
TilemapSelector >> extent [
	^ 74 @ 13
]

{ #category : #api }
TilemapSelector >> init: anApp [
	super init: anApp.
	tilemapNo := 0
]

{ #category : #private }
TilemapSelector >> minusButtonPosition [
	^ position + (42 @ 3)
]

{ #category : #private }
TilemapSelector >> minusClicked [
	tilemapNo <= 0
		ifTrue: [ ^ self ].
	tilemapNo := tilemapNo - 1.
	self tilemapNoChanged
]

{ #category : #private }
TilemapSelector >> plusButtonPosition [
	^ position + (62 @ 3)
]

{ #category : #private }
TilemapSelector >> plusClicked [
	tilemapNo >= (app numTilemaps - 1)
		ifTrue: [ ^ self ].
	tilemapNo := tilemapNo + 1.
	self tilemapNoChanged
]

{ #category : #accessing }
TilemapSelector >> tilemapNo [
	^ tilemapNo
]

{ #category : #accessing }
TilemapSelector >> tilemapNo: anObject [
	tilemapNo := anObject
]

{ #category : #private }
TilemapSelector >> tilemapNoChanged [
	whenTilemapNoChanged ifNotNil: [ whenTilemapNoChanged cull: self ]
]

{ #category : #private }
TilemapSelector >> tilemapNoPosition [
	^ position + (54 @ 4)
]

{ #category : #private }
TilemapSelector >> tilemapTextPosition [
	^ position + (6 @ 4)
]

{ #category : #api }
TilemapSelector >> update [
	(app engine isPressed: RetroGameInputs mouseLeftButton)
		ifFalse: [ ^ self ].
	((self minusButtonPosition extent: self buttonExtent)
		containsPoint: app engine mousePosition)
		ifTrue: [ self minusClicked ].
	((self plusButtonPosition extent: self buttonExtent)
		containsPoint: app engine mousePosition)
		ifTrue: [ self plusClicked ]
]

{ #category : #accessing }
TilemapSelector >> whenTilemapNoChanged [
	^ whenTilemapNoChanged
]

{ #category : #accessing }
TilemapSelector >> whenTilemapNoChanged: anObject [
	whenTilemapNoChanged := anObject
]
