Class {
	#name : #ImageEditorListDialog,
	#superclass : #ImageEditorDialog,
	#instVars : [
		'list',
		'topIndex'
	],
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #constants }
ImageEditorListDialog >> cancelExtent [
	^ 26 @ 7
]

{ #category : #private }
ImageEditorListDialog >> cancelPosition [
	^ (self itemPositionAt: 12) + ((extent x - 30) // 2 @ 0)
]

{ #category : #constants }
ImageEditorListDialog >> defaultExtent [
	^ 140 @ 112
]

{ #category : #constants }
ImageEditorListDialog >> defaultPosition [
	^ 10 @ 10
]

{ #category : #api }
ImageEditorListDialog >> draw [
	super draw.
	app engine text: 'Select one' at: self messagePosition color: 7.
	self drawList.
	app engine rect: self prevPosition extent: self prevExtent color: 6.
	app engine text: 'PREV' at: self prevPosition + 1 color: 0.
	app engine rect: self cancelPosition extent: self cancelExtent color: 6.
	app engine text: 'CANCEL' at: self cancelPosition + 1 color: 0.
	app engine rect: self nextPosition extent: self nextExtent color: 6.
	app engine text: 'NEXT' at: self nextPosition + 1 color: 0
]

{ #category : #private }
ImageEditorListDialog >> drawList [
	| p index |
	1 to: self numItems do: [ :each | 
		index := each + topIndex - 1.
		index <= list size
			ifTrue: [ p := self itemPositionAt: each.
				app engine
					rect: p extent: self itemExtent color: 6;
					text: (list at: each + topIndex - 1) at: p + 1 color: 0 ] ]
]

{ #category : #api }
ImageEditorListDialog >> init: anApp [
	super init: anApp.
	topIndex := 1
]

{ #category : #constants }
ImageEditorListDialog >> itemExtent [
	^ (list collect: #size) max * 4 + 2 @ 7
]

{ #category : #private }
ImageEditorListDialog >> itemPositionAt: anInteger [
	^ position + (5 @ (anInteger * 8 + 5))
]

{ #category : #accessing }
ImageEditorListDialog >> list [
	^ list
]

{ #category : #accessing }
ImageEditorListDialog >> list: anObject [
	list := anObject
]

{ #category : #actions }
ImageEditorListDialog >> next [
	topIndex := topIndex + self numItems min: list size
]

{ #category : #constants }
ImageEditorListDialog >> nextExtent [
	^ 18 @ 7
]

{ #category : #private }
ImageEditorListDialog >> nextPosition [
	^ (self itemPositionAt: 12) + (extent x - 30 @ 0)
]

{ #category : #constants }
ImageEditorListDialog >> numItems [
	^ 10
]

{ #category : #actions }
ImageEditorListDialog >> prev [
	topIndex := (topIndex - self numItems) max: 1
]

{ #category : #constants }
ImageEditorListDialog >> prevExtent [
	^ 18 @ 7
]

{ #category : #private }
ImageEditorListDialog >> prevPosition [
	^ self itemPositionAt: 12
]

{ #category : #accessing }
ImageEditorListDialog >> topIndex [
	^ topIndex
]

{ #category : #accessing }
ImageEditorListDialog >> topIndex: anObject [
	topIndex := anObject
]

{ #category : #api }
ImageEditorListDialog >> update [
	(app engine isPressed: RetroGameInputs mouseLeftButton)
		ifFalse: [ ^ self ].
	((self cancelPosition extent: self cancelExtent)
		containsPoint: app engine mousePosition)
		ifTrue: [ ^ pendingAction cull: nil ].
	((self prevPosition extent: self prevExtent)
		containsPoint: app engine mousePosition)
		ifTrue: [ ^ self prev ].
	((self nextPosition extent: self nextExtent)
		containsPoint: app engine mousePosition)
		ifTrue: [ ^ self next ].
	self updateList
]

{ #category : #private }
ImageEditorListDialog >> updateList [
	| index |
	1 to: self numItems do: [ :each | 
		index := each + topIndex - 1.
		index <= list size
			ifTrue: [ (((self itemPositionAt: each) extent: self itemExtent)
					containsPoint: app engine mousePosition)
					ifTrue: [ ^ pendingAction cull: index ] ] ]
]
