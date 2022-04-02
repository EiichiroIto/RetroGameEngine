Class {
	#name : #RetroGameTool,
	#superclass : #RetroGameApp,
	#instVars : [
		'controls',
		'dialog'
	],
	#category : #'RetroGameEngine-Core'
}

{ #category : #utilities }
RetroGameTool class >> compactArrayStringFrom: aString [
	| list count size tmp |
	list := aString lines.
	count := self reducedLinesOf: list.
	list := list copyFrom: 1 to: count.
	tmp := list collect: [ :each | self reducedCharactersOf: each ].
	tmp isEmpty
		ifTrue: [ ^ Array new ].
	size := tmp max.
	size := (size + 7) // 8 * 8.
	^ list
		collect: [ :each | 
			each size >= size
				ifTrue: [ each copyFrom: 1 to: size ]
				ifFalse: [ each , (String new: size - each size withAll: $0) ] ]
]

{ #category : #testing }
RetroGameTool class >> isAbstract [
	^ self name = #RetroGameTool
]

{ #category : #utilities }
RetroGameTool class >> reducedCharactersOf: aString [
	aString size to: 1 by: -1 do: [ :each | 
		(aString at: each) ~= $0
			ifTrue: [ ^ each ] ].
	^ 0
]

{ #category : #utilities }
RetroGameTool class >> reducedLinesOf: anArray [
	anArray size to: 1 by: -1 do: [ :each | 
		((anArray at: each) allSatisfy: [ :c | c = $0 ])
			ifFalse: [ ^ each ] ].
	^ 0
]

{ #category : #api }
RetroGameTool >> confirm: aString thenDo: aBlock [
	dialog := ImageEditorYesNoDialog new
		init: self;
		message: aString;
		pendingAction: [ :ret | 
			dialog := nil.
			aBlock cull: ret ];
		yourself
]

{ #category : #accessing }
RetroGameTool >> controls [
	^ controls
]

{ #category : #accessing }
RetroGameTool >> controls: anObject [
	controls := anObject
]

{ #category : #accessing }
RetroGameTool >> dialog [
	^ dialog
]

{ #category : #accessing }
RetroGameTool >> dialog: anObject [
	dialog := anObject
]

{ #category : #api }
RetroGameTool >> draw [
	engine cls: 0.
	controls do: #draw.
	dialog ifNotNil: #draw
]

{ #category : #api }
RetroGameTool >> select: aCollection thenDo: aBlock [
	dialog := ImageEditorListDialog new
		init: self;
		list: aCollection;
		pendingAction: [ :ret | 
			dialog := nil.
			aBlock cull: ret ];
		yourself
]

{ #category : #api }
RetroGameTool >> update [
	dialog ifNotNil: [ ^ dialog update ].
	controls do: #update
]
