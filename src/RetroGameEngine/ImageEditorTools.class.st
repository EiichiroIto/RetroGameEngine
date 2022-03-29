Class {
	#name : #ImageEditorTools,
	#superclass : #RetroGameObject,
	#instVars : [
		'toolNo'
	],
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #constants }
ImageEditorTools class >> ellipseFrameTool [
	^ 4
]

{ #category : #constants }
ImageEditorTools class >> ellipseTool [
	^ 5
]

{ #category : #constants }
ImageEditorTools class >> fillTool [
	^ 6
]

{ #category : #constants }
ImageEditorTools class >> penTool [
	^ 1
]

{ #category : #constants }
ImageEditorTools class >> rectFrameTool [
	^ 2
]

{ #category : #constants }
ImageEditorTools class >> rectTool [
	^ 3
]

{ #category : #constants }
ImageEditorTools class >> selectTool [
	^ 0
]

{ #category : #constants }
ImageEditorTools >> defaultPosition [
	^ 53 @ 116
]

{ #category : #api }
ImageEditorTools >> draw [
	| e |
	e := app engine.
	e rect: position extent: self extent color: 1.
	0 to: 6 do: [ :each | 
		e
			blt: (self toolPositionAt: each)
			imageNo: 0
			at: 8 @ 0 * each
			extent: self toolExtent
			transparentColor: 0.
		each = toolNo
			ifTrue: [ e
					rectFrame: (self toolPositionAt: each) - 1
					extent: self toolExtent + 2
					color: 2 ] ]
]

{ #category : #constants }
ImageEditorTools >> extent [
	^ 8 @ 1 * 7 + (3 @ 6)
]

{ #category : #api }
ImageEditorTools >> init: anApp [
	super init: anApp.
	toolNo := 0
]

{ #category : #constants }
ImageEditorTools >> toolExtent [
	^ 7 @ 7
]

{ #category : #accessing }
ImageEditorTools >> toolNo [
	^ toolNo
]

{ #category : #accessing }
ImageEditorTools >> toolNo: anObject [
	^ toolNo := anObject
]

{ #category : #private }
ImageEditorTools >> toolPositionAt: anInteger [
	^ position + ((anInteger * 8 + 2) @ 3)
]

{ #category : #api }
ImageEditorTools >> update [
	(app engine isPressed: RetroGameInputs mouseLeftButton)
		ifFalse: [ ^ self ].
	0 to: 6 do: [ :each | 
		(((self toolPositionAt: each) extent: self toolExtent)
			containsPoint: app engine mousePosition)
			ifTrue: [ each = 0
					ifFalse: [ app painter clearSelection ].
				^ toolNo := each ] ]
]
