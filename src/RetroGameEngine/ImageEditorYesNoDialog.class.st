Class {
	#name : #ImageEditorYesNoDialog,
	#superclass : #ImageEditorDialog,
	#instVars : [
		'message'
	],
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #constants }
ImageEditorYesNoDialog >> defaultExtent [
	^ 100 @ 100
]

{ #category : #constants }
ImageEditorYesNoDialog >> defaultPosition [
	^ 10 @ 10
]

{ #category : #api }
ImageEditorYesNoDialog >> draw [
	super draw.
	app engine text: message at: self messagePosition color: 7.
	app engine rect: self yesPosition extent: self itemExtent color: 6.
	app engine text: 'YES' at: self yesPosition + 1 color: 0.
	app engine rect: self noPosition extent: self itemExtent color: 6.
	app engine text: 'NO' at: self noPosition + 1 color: 0
]

{ #category : #private }
ImageEditorYesNoDialog >> itemExtent [
	^ 14 @ 7
]

{ #category : #accessing }
ImageEditorYesNoDialog >> message [
	^ message
]

{ #category : #accessing }
ImageEditorYesNoDialog >> message: anObject [
	message := anObject.
	extent := self messageWidth @ (self messageHeight + 17)
]

{ #category : #private }
ImageEditorYesNoDialog >> messageHeight [
	^ (message lines size + 1) * 6 + 2
]

{ #category : #private }
ImageEditorYesNoDialog >> messageWidth [
	^ ((message lines collect: #size) max + 2) * 4
]

{ #category : #private }
ImageEditorYesNoDialog >> noPosition [
	| x |
	x := (self messageWidth - (self itemExtent x * 4)) // 2 + (self itemExtent x * 3).
	^ self messagePosition + (x @ self messageHeight)
]

{ #category : #api }
ImageEditorYesNoDialog >> update [
	(app engine isPressed: RetroGameInputs mouseLeftButton)
		ifFalse: [ ^ self ].
	((self yesPosition extent: self itemExtent)
		containsPoint: app engine mousePosition)
		ifTrue: [ ^ pendingAction cull: true ].
	((self noPosition extent: self itemExtent)
		containsPoint: app engine mousePosition)
		ifTrue: [ ^ pendingAction cull: false ]
]

{ #category : #private }
ImageEditorYesNoDialog >> yesPosition [
	| x |
	x := (self messageWidth - (self itemExtent x * 4)) // 2.
	^ self messagePosition + (x @ self messageHeight)
]
