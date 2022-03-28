Class {
	#name : #ImageEditorObject,
	#superclass : #Object,
	#instVars : [
		'app',
		'position',
		'extent'
	],
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #accessing }
ImageEditorObject >> app [
	^ app
]

{ #category : #accessing }
ImageEditorObject >> app: anObject [
	app := anObject
]

{ #category : #constants }
ImageEditorObject >> defaultExtent [
	self subclassResponsibility
]

{ #category : #constants }
ImageEditorObject >> defaultPosition [
	self subclassResponsibility
]

{ #category : #api }
ImageEditorObject >> draw [
	app engine rectFrame: position extent: extent color: 7
]

{ #category : #accessing }
ImageEditorObject >> extent [
	^ extent
]

{ #category : #accessing }
ImageEditorObject >> extent: anObject [
	extent := anObject
]

{ #category : #api }
ImageEditorObject >> init: anApp [
	app := anApp.
	position := self defaultPosition.
	extent := self defaultExtent
]

{ #category : #accessing }
ImageEditorObject >> position [
	^ position
]

{ #category : #accessing }
ImageEditorObject >> position: anObject [
	position := anObject
]

{ #category : #api }
ImageEditorObject >> update [
	
]
