Class {
	#name : #ImageEditorSelector,
	#superclass : #RetroGameObject,
	#instVars : [
		'imageNo'
	],
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #constants }
ImageEditorSelector >> buttonExtent [
	^ 7 @ 7
]

{ #category : #constants }
ImageEditorSelector >> defaultPosition [
	^ 120 @ 116
]

{ #category : #api }
ImageEditorSelector >> draw [
	| e |
	e := app engine.
	e rect: position extent: self extent color: 1.
	e text: 'IMAGE' at: self imageTextPosition color: 7.
	e text: imageNo asString at: self imageNoPosition color: 7.
	e rect: self minusButtonPosition extent: self buttonExtent color: 6.
	e text: '-' at: self minusButtonPosition + (2 @ 1) color: 0.
	e rect: self plusButtonPosition extent: self buttonExtent color: 6.
	e text: '+' at: self plusButtonPosition + (2 @ 1) color: 0.
]

{ #category : #constants }
ImageEditorSelector >> extent [
	^ 64 @ 13
]

{ #category : #accessing }
ImageEditorSelector >> imageNo [
	^ imageNo
]

{ #category : #accessing }
ImageEditorSelector >> imageNo: anObject [
	imageNo := anObject
]

{ #category : #private }
ImageEditorSelector >> imageNoPosition [
	^ position + (44 @ 4)
]

{ #category : #private }
ImageEditorSelector >> imageTextPosition [
	^ position + (6 @ 4)
]

{ #category : #api }
ImageEditorSelector >> init: anApp [
	super init: anApp.
	imageNo := 0
]

{ #category : #private }
ImageEditorSelector >> minusButtonPosition [
	^ position + (32 @ 3)
]

{ #category : #private }
ImageEditorSelector >> minusClicked [
	imageNo <= 0
		ifTrue: [ ^ self ].
	imageNo := imageNo - 1
]

{ #category : #private }
ImageEditorSelector >> plusButtonPosition [
	^ position + (52 @ 3)
]

{ #category : #private }
ImageEditorSelector >> plusClicked [
	imageNo >= (app numImages - 1)
		ifTrue: [ ^ self ].
	imageNo := imageNo + 1
]

{ #category : #api }
ImageEditorSelector >> update [
	(app engine isPressed: RetroGameInputs mouseLeftButton)
		ifFalse: [ ^ self ].
	((self minusButtonPosition extent: self buttonExtent)
		containsPoint: app engine mousePosition)
		ifTrue: [ self minusClicked ].
	((self plusButtonPosition extent: self buttonExtent)
		containsPoint: app engine mousePosition)
		ifTrue: [ self plusClicked ]
]
