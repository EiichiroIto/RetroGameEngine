Class {
	#name : #ImageEditorVScrollbar,
	#superclass : #ImageEditorScrollbar,
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #private }
ImageEditorVScrollbar >> barExtent [
	^ 3 @ (extent y - 10)
]

{ #category : #private }
ImageEditorVScrollbar >> barPosition [
	^ position + (1 @ 5)
]

{ #category : #constants }
ImageEditorVScrollbar >> buttonExtent [
	^ 5 @ 5
]

{ #category : #constants }
ImageEditorVScrollbar >> defaultExtent [
	^ 5 @ 50
]

{ #category : #actions }
ImageEditorVScrollbar >> downButtonClicked [
	| triple |
	triple := whenButtonClicked cull: 1.
	self updateBar: triple
]

{ #category : #private }
ImageEditorVScrollbar >> downButtonPosition [
	^ position + (0 @ (extent - self buttonExtent) y)
]

{ #category : #api }
ImageEditorVScrollbar >> draw [
	app engine
		blt: self upButtonPosition
			imageNo: 0
			at: 68 @ 0
			extent: 5 @ 5
			transparentColor: 0;
		blt: self downButtonPosition
			imageNo: 0
			at: 74 @ 0
			extent: 5 @ 5
			transparentColor: 0;
		line: self upButtonPosition + (0 @ 5)
			to: self downButtonPosition
			color: 13;
		line: self upButtonPosition + (4 @ 5)
			to: self downButtonPosition + (4 @ 0)
			color: 13;
		line: knobPosition to: knobPosition + (0 @ (knobLength - 1)) color: 7
]

{ #category : #actions }
ImageEditorVScrollbar >> upButtonClicked [
	| triple |
	triple := whenButtonClicked cull: -1.
	self updateBar: triple
]

{ #category : #private }
ImageEditorVScrollbar >> upButtonPosition [
	^ position
]

{ #category : #api }
ImageEditorVScrollbar >> update [
	| pos |
	(app engine isPressing: RetroGameInputs mouseLeftButton)
		ifFalse: [ ^ self ].
	pos := app engine mousePosition.
	((self upButtonPosition extent: self buttonExtent)
		containsPoint: pos)
		ifTrue: [ ^ self upButtonClicked ].
	((self downButtonPosition extent: self buttonExtent)
		containsPoint: pos)
		ifTrue: [ ^ self downButtonClicked ].
	((self barPosition extent: self barExtent) containsPoint: pos)
		ifTrue: [ ^ self barClickedAt: (pos - self barPosition) y in: self barExtent y ]
]

{ #category : #private }
ImageEditorVScrollbar >> updateBar: anArray [
	| len |
	len := self barExtent y.
	knobPosition := 0
		@ (anArray second * len // (anArray first + anArray third))
		+ self barPosition + 1.
	knobLength := anArray third * len // (anArray first + anArray third)
]
