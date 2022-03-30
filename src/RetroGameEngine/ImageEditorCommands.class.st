Class {
	#name : #ImageEditorCommands,
	#superclass : #RetroGameObject,
	#instVars : [
		'pasteBuffer'
	],
	#category : #'RetroGameEngine-ImageEditor'
}

{ #category : #constants }
ImageEditorCommands class >> commands [
	^ #('NEW' 'LOAD' 'SAVE' 'NEW+' 'LOAD+' 'SAVE+' 'CUT' 'COPY' 'PASTE')
]

{ #category : #constants }
ImageEditorCommands class >> copyCommand [
	^ 8
]

{ #category : #constants }
ImageEditorCommands class >> cutCommand [
	^ 7
]

{ #category : #constants }
ImageEditorCommands class >> loadCommand [
	^ 2
]

{ #category : #constants }
ImageEditorCommands class >> loadItemCommand [
	^ 5
]

{ #category : #constants }
ImageEditorCommands class >> newCommand [
	^ 1
]

{ #category : #constants }
ImageEditorCommands class >> newItemCommand [
	^ 4
]

{ #category : #constants }
ImageEditorCommands class >> pasteCommand [
	^ 9
]

{ #category : #constants }
ImageEditorCommands class >> saveCommand [
	^ 3
]

{ #category : #constants }
ImageEditorCommands class >> saveItemCommand [
	^ 6
]

{ #category : #constants }
ImageEditorCommands >> commandExtent [
	^ 26 @ 8
]

{ #category : #private }
ImageEditorCommands >> commandNoAt: aPoint [
	1 to: self class commands size do: [ :each | 
		(((self commandPositionAt: each) extent: self commandExtent)
			containsPoint: aPoint)
			ifTrue: [ ^ each ] ].
	^ nil
]

{ #category : #private }
ImageEditorCommands >> commandPositionAt: anInteger [
	^ position + (self commandExtent * (0 @ (anInteger - 1))) + 1
]

{ #category : #actions }
ImageEditorCommands >> copySelection [
	app painter selectionRectangle ifNil: [ ^ self ].
	pasteBuffer := self newImage
		extent: app painter selectionRectangle extent + 1;
		init.
	self newBitBlt
		sourceArray: app currentImage array;
		sourceExtent: app currentImage extent;
		sourcePoint: app painter selectionRectangle topLeft;
		clipExtent: pasteBuffer extent;
		destArray: pasteBuffer array;
		destExtent: pasteBuffer extent;
		destPoint: 0 @ 0;
		copyBits
]

{ #category : #actions }
ImageEditorCommands >> cutSelection [
	| ex |
	self copySelection.
	app painter selectionRectangle ifNil: [ ^ self ].
	ex := app painter selectionRectangle extent.
	0 to: ex y do: [ :y | 
		0 to: ex x do: [ :x | 
			app currentImage
				pixelAt: x @ y + app painter selectionRectangle topLeft
				put: 0 ] ]
]

{ #category : #constants }
ImageEditorCommands >> defaultPosition [
	^ 200 @ 10
]

{ #category : #api }
ImageEditorCommands >> draw [
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
ImageEditorCommands >> extent [
	^ self commandExtent * (1 @ self class commands size) + 1
]

{ #category : #actions }
ImageEditorCommands >> load [
	| list |
	list := RetroGameApp subclasses.
	list isEmpty
		ifTrue: [ ^ self ].
	app
		select: (list collect: [ :each | each name ])
		thenDo:
			[ :ret | ret ifNotNil: [ app loadImageClass: (list at: ret) ] ]
]

{ #category : #actions }
ImageEditorCommands >> loadItem [
	| list |
	list := OrderedCollection new.
	RetroGameApp subclasses
		do: [ :each | 
			| list2 |
			list2 := each class methods
				select: [ :each2 | each2 selector beginsWith: 'image' ].
			list
				addAll:
					(list2
						collect: [ :each3 | 
							{each.
							each3 selector} ]) ].
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
ImageEditorCommands >> new [
	app
		confirm: 'Is it OK to reset all images?'
		thenDo: [ :result | 
			result
				ifTrue: [ app resetImages ] ]
]

{ #category : #private }
ImageEditorCommands >> newBitBlt [
	^ RetroGameBitBlt new
]

{ #category : #private }
ImageEditorCommands >> newImage [
	^ RetroGameImage new
]

{ #category : #actions }
ImageEditorCommands >> newItem [
	app
		confirm: 'Is it OK to reset image?'
		thenDo: [ :result | 
			result
				ifTrue: [ app resetImage ] ]
]

{ #category : #accessing }
ImageEditorCommands >> pasteBuffer [
	^ pasteBuffer
]

{ #category : #accessing }
ImageEditorCommands >> pasteBuffer: anObject [
	pasteBuffer := anObject
]

{ #category : #actions }
ImageEditorCommands >> pasteSelection [
	pasteBuffer ifNil: [ ^ self ].
	app painter selectionRectangle ifNil: [ ^ self ].
	self newBitBlt
		sourceArray: pasteBuffer array;
		sourceExtent: pasteBuffer extent;
		sourcePoint: 0 @ 0;
		clipExtent: pasteBuffer extent;
		destArray: app currentImage array;
		destExtent: app currentImage extent;
		destPoint: app painter selectionRectangle topLeft;
		copyBits
]

{ #category : #actions }
ImageEditorCommands >> save [
	
]

{ #category : #actions }
ImageEditorCommands >> saveItem [
	| list |
	list := RetroGameApp subclasses.
	list isEmpty
		ifTrue: [ ^ self ].
	app
		select: (list collect: [ :each | each name ])
		thenDo: [ :ret | 
			ret
				ifNotNil: [ app
						saveImageClass: (list at: ret)
						selector: ('image' , app imageNo asString) asSymbol ] ]
]

{ #category : #api }
ImageEditorCommands >> update [
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
	cmd = self class cutCommand
		ifTrue: [ ^ self cutSelection ].
	cmd = self class copyCommand
		ifTrue: [ ^ self copySelection ].
	cmd = self class pasteCommand
		ifTrue: [ ^ self pasteSelection ]
]
