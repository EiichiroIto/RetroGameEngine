Class {
	#name : #ImageEditorHScrollbar,
	#superclass : #ImageEditorScrollbar,
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #private }
ImageEditorHScrollbar >> barExtent [
	^ (extent x - 10 @ 3)
]

{ #category : #private }
ImageEditorHScrollbar >> barPosition [
	^ position + (5 @ 1)
]

{ #category : #constants }
ImageEditorHScrollbar >> buttonExtent [
	^ 5 @ 5
]

{ #category : #constants }
ImageEditorHScrollbar >> defaultExtent [
	^ 50 @ 5
]

{ #category : #api }
ImageEditorHScrollbar >> draw [
	app engine
		blt: self leftButtonPosition
			imageNo: 0
			at: 56 @ 0
			extent: 5 @ 5
			transparentColor: 0;
		blt: self rightButtonPosition
			imageNo: 0
			at: 62 @ 0
			extent: 5 @ 5
			transparentColor: 0;
		line: self leftButtonPosition + (5 @ 0)
			to: self rightButtonPosition
			color: 13;
		line: self leftButtonPosition + (5 @ 4)
			to: self rightButtonPosition + (0 @ 4)
			color: 13;
		line: knobPosition to: knobPosition + (knobLength - 1 @ 0) color: 7
]

{ #category : #actions }
ImageEditorHScrollbar >> leftButtonClicked [
	| triple |
	triple := whenButtonClicked cull: -1.
	self updateBar: triple
]

{ #category : #private }
ImageEditorHScrollbar >> leftButtonPosition [
	^ position
]

{ #category : #actions }
ImageEditorHScrollbar >> rightButtonClicked [
	| triple |
	triple := whenButtonClicked cull: 1.
	self updateBar: triple
]

{ #category : #private }
ImageEditorHScrollbar >> rightButtonPosition [
	^ position + (extent x - self buttonExtent x @ 0)
]

{ #category : #api }
ImageEditorHScrollbar >> update [
	| pos |
	(app engine isPressing: RetroGameInputs mouseLeftButton)
		ifFalse: [ ^ self ].
	pos := app engine mousePosition.
	((self leftButtonPosition extent: self buttonExtent)
		containsPoint: pos)
		ifTrue: [ ^ self leftButtonClicked ].
	((self rightButtonPosition extent: self buttonExtent)
		containsPoint: pos)
		ifTrue: [ ^ self rightButtonClicked ].
	((self barPosition extent: self barExtent) containsPoint: pos)
		ifTrue: [ ^ self barClickedAt: (pos - self barPosition) x in: self barExtent x ]
]

{ #category : #private }
ImageEditorHScrollbar >> updateBar: anArray [
	| len |
	len := self barExtent x - 4.
	knobPosition := (anArray second * len
		// (anArray first + anArray third)) @ 0 + self barPosition + 1.
	knobLength := anArray third * len // anArray first
]
