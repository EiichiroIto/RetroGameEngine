Class {
	#name : #ImageEditorPalette,
	#superclass : #RetroGameObject,
	#instVars : [
		'colorNo'
	],
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #constants }
ImageEditorPalette >> colorExtent [
	^ 5 @ 5
]

{ #category : #accessing }
ImageEditorPalette >> colorNo [
	^ colorNo
]

{ #category : #accessing }
ImageEditorPalette >> colorNo: anObject [
	^ colorNo := anObject
]

{ #category : #private }
ImageEditorPalette >> colorPositionAt: anInteger [
	^ position
		+ ((anInteger \\ 8 * 6 + 1) @ (anInteger // 8 * 6 + 1))
]

{ #category : #constants }
ImageEditorPalette >> defaultPosition [
	^ 4 @ 116
]

{ #category : #api }
ImageEditorPalette >> draw [
	| e p |
	e := app engine.
	e rect: position extent: self extent color: 1.
	0 to: 15 do: [ :each | 
		p := self colorPositionAt: each.
		e rect: p extent: self colorExtent color: each.
		each = colorNo
			ifTrue: [ e rectFrame: p - 1 extent: self colorExtent + 2 color: 7 ] ]
]

{ #category : #constants }
ImageEditorPalette >> extent [
	^ 8 @ 2 * 6 + (1 @ 1)
]

{ #category : #api }
ImageEditorPalette >> init: anApp [
	super init: anApp.
	colorNo := 0
]

{ #category : #api }
ImageEditorPalette >> update [
	(app engine isPressed: RetroGameInputs mouseLeftButton)
		ifFalse: [ ^ self ].
	0 to: 15 do: [ :each | 
		(((self colorPositionAt: each) extent: self colorExtent)
			containsPoint: app engine mousePosition)
			ifTrue: [ ^ colorNo := each ] ]
]
