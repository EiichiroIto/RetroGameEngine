Class {
	#name : #TilemapEditorCommands,
	#superclass : #RetroGameObject,
	#category : #'RetroGameEngine-TilemapEditor'
}

{ #category : #constants }
TilemapEditorCommands class >> commands [
	^ #('NEW' 'LOAD' 'SAVE' 'NEW+' 'LOAD+' 'SAVE+' 'LOADI')
]

{ #category : #constants }
TilemapEditorCommands class >> loadCommand [
	^ 2
]

{ #category : #constants }
TilemapEditorCommands class >> loadImageCommand [
	^ 7
]

{ #category : #constants }
TilemapEditorCommands class >> loadItemCommand [
	^ 5
]

{ #category : #constants }
TilemapEditorCommands class >> newCommand [
	^ 1
]

{ #category : #constants }
TilemapEditorCommands class >> newItemCommand [
	^ 4
]

{ #category : #constants }
TilemapEditorCommands class >> saveCommand [
	^ 3
]

{ #category : #constants }
TilemapEditorCommands class >> saveItemCommand [
	^ 6
]

{ #category : #constants }
TilemapEditorCommands >> commandExtent [
	^ 26 @ 8
]

{ #category : #private }
TilemapEditorCommands >> commandNoAt: aPoint [
	1 to: self class commands size do: [ :each | 
		(((self commandPositionAt: each) extent: self commandExtent)
			containsPoint: aPoint)
			ifTrue: [ ^ each ] ].
	^ nil
]

{ #category : #private }
TilemapEditorCommands >> commandPositionAt: anInteger [
	^ position + (self commandExtent * (0 @ (anInteger - 1))) + 1
]

{ #category : #constants }
TilemapEditorCommands >> defaultPosition [
	^ 225 @ 10
]

{ #category : #api }
TilemapEditorCommands >> draw [
	| e p |
	e := app engine.
	e rect: position - 1 extent: self extent + 2 color: 1.
	self class commands
		withIndexDo: [ :each :index | 
			p := self commandPositionAt: index.
			e rect: p extent: self commandExtent - 1 color: 6.
			e text: each at: p + 1 color: 0 ]
]

{ #category : #constants }
TilemapEditorCommands >> extent [
	^ self commandExtent * (1 @ self class commands size) + 1
]

{ #category : #actions }
TilemapEditorCommands >> load [
	| list |
	list := RetroGameApp classesHavingTilemaps.
	list isEmpty
		ifTrue: [ ^ self ].
	app
		select: (list collect: [ :each | each name ])
		thenDo:
			[ :ret | ret ifNotNil: [ app loadClass: (list at: ret) ] ]
]

{ #category : #actions }
TilemapEditorCommands >> loadImage [
	| list |
	list := RetroGameApp imageClassesAndSelectors.
	list isEmpty
		ifTrue: [ ^ self ].
	app
		select: (list collect: [ :each | each first name , '-' , each second ])
		thenDo: [ :ret | 
			ret
				ifNotNil: [ app
						loadImageClass: (list at: ret) first
						selector: (list at: ret) second ] ]
]

{ #category : #actions }
TilemapEditorCommands >> loadItem [
	| list |
	list := RetroGameApp tilemapClassesAndSelectors.
	list isEmpty
		ifTrue: [ ^ self ].
	app
		select: (list collect: [ :each | each first name , '-' , each second ])
		thenDo: [ :ret | 
			ret
				ifNotNil: [ app
						loadTilemapClass: (list at: ret) first
						selector: (list at: ret) second ] ]
]

{ #category : #actions }
TilemapEditorCommands >> new [
	app
		confirm: 'Is it OK to reset tilemaps and images?'
		thenDo: [ :result | 
			result
				ifTrue: [ app resetAll ] ]
]

{ #category : #actions }
TilemapEditorCommands >> newItem [
	app
		confirm: 'Is it OK to reset tilemap?'
		thenDo: [ :result | 
			result
				ifTrue: [ app resetTilemap ] ]
]

{ #category : #actions }
TilemapEditorCommands >> save [
	| list |
	list := RetroGameApp concreteClasses.
	list isEmpty
		ifTrue: [ ^ self ].
	app
		select: (list collect: [ :each | each name ])
		thenDo:
			[ :ret | ret ifNotNil: [ app saveTilemapClass: (list at: ret) ] ]
]

{ #category : #actions }
TilemapEditorCommands >> saveItem [
	| list |
	list := RetroGameApp concreteClasses.
	list isEmpty
		ifTrue: [ ^ self ].
	app
		select: (list collect: [ :each | each name ])
		thenDo: [ :ret | 
			ret
				ifNotNil: [ app
						saveTilemap: app currentTilemap
						class: (list at: ret)
						selector: (app methodSelectorFor: app imageNo) ] ]
]

{ #category : #api }
TilemapEditorCommands >> update [
	| cmd |
	(app engine isPressed: RetroGameInputs mouseLeftButton)
		ifFalse: [ ^ self ].
	cmd := self commandNoAt: app engine mousePosition.
	cmd ifNil: [ ^ self ].
	cmd = self class newCommand
		ifTrue: [ ^ self new ].
	cmd = self class loadCommand
		ifTrue: [ ^ self load ].
	cmd = self class saveCommand
		ifTrue: [ ^ self save ].
	cmd = self class newItemCommand
		ifTrue: [ ^ self newItem ].
	cmd = self class loadItemCommand
		ifTrue: [ ^ self loadItem ].
	cmd = self class saveItemCommand
		ifTrue: [ ^ self saveItem ].
	cmd = self class loadImageCommand
		ifTrue: [ ^ self loadImage ]
]
