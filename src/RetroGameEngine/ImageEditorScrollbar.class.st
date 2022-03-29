Class {
	#name : #ImageEditorScrollbar,
	#superclass : #RetroGameObject,
	#instVars : [
		'whenBarClicked',
		'whenButtonClicked',
		'knobLength',
		'knobPosition',
		'extent'
	],
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #actions }
ImageEditorScrollbar >> barClickedAt: anInteger in: anInteger2 [
	| triple |
	triple := whenBarClicked cull: anInteger cull: anInteger2.
	self updateBar: triple
]

{ #category : #constants }
ImageEditorScrollbar >> defaultExtent [
	^ 0 @ 0
]

{ #category : #accessing }
ImageEditorScrollbar >> extent [
	^ extent
]

{ #category : #accessing }
ImageEditorScrollbar >> extent: anObject [
	extent := anObject
]

{ #category : #api }
ImageEditorScrollbar >> init: anApp [
	super init: anApp.
	extent := self defaultExtent
]

{ #category : #accessing }
ImageEditorScrollbar >> knobLength [
	^ knobLength
]

{ #category : #accessing }
ImageEditorScrollbar >> knobLength: anObject [
	knobLength := anObject
]

{ #category : #accessing }
ImageEditorScrollbar >> knobPosition [
	^ knobPosition
]

{ #category : #accessing }
ImageEditorScrollbar >> knobPosition: anObject [
	knobPosition := anObject
]

{ #category : #private }
ImageEditorScrollbar >> updateBar: anArray [
	
]

{ #category : #accessing }
ImageEditorScrollbar >> whenBarClicked [
	^ whenBarClicked
]

{ #category : #accessing }
ImageEditorScrollbar >> whenBarClicked: anObject [
	whenBarClicked := anObject
]

{ #category : #accessing }
ImageEditorScrollbar >> whenButtonClicked [
	^ whenButtonClicked
]

{ #category : #accessing }
ImageEditorScrollbar >> whenButtonClicked: anObject [
	whenButtonClicked := anObject
]
