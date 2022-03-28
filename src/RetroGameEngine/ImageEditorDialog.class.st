Class {
	#name : #ImageEditorDialog,
	#superclass : #ImageEditorObject,
	#instVars : [
		'pendingAction'
	],
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #api }
ImageEditorDialog >> draw [
	app engine rect: position extent: extent color: 0.
	app engine rectFrame: position extent: extent color: 7
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
