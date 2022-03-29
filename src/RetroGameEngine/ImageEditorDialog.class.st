Class {
	#name : #ImageEditorDialog,
	#superclass : #RetroGameObject,
	#instVars : [
		'pendingAction',
		'extent'
	],
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #constants }
ImageEditorDialog >> defaultExtent [
	^ 0 @ 0
]

{ #category : #api }
ImageEditorDialog >> draw [
	app engine rect: position extent: extent color: 0.
	app engine rectFrame: position extent: extent color: 7
]

{ #category : #accessing }
ImageEditorDialog >> extent [
	^ extent
]

{ #category : #accessing }
ImageEditorDialog >> extent: anObject [
	extent := anObject
]

{ #category : #api }
ImageEditorDialog >> init: anApp [
	super init: anApp.
	extent := self defaultExtent
]

{ #category : #private }
ImageEditorDialog >> messagePosition [
	^ position + 5
]

{ #category : #accessing }
ImageEditorDialog >> pendingAction [
	^ pendingAction
]

{ #category : #accessing }
ImageEditorDialog >> pendingAction: anObject [
	pendingAction := anObject
]
