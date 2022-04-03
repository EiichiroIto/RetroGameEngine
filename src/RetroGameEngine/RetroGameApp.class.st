Class {
	#name : #RetroGameApp,
	#superclass : #Object,
	#instVars : [
		'whenQuitBlock',
		'engine',
		'fps'
	],
	#category : #'RetroGameEngine-Core'
}

{ #category : #utilities }
RetroGameApp class >> classesHavingImages [
	^ self concreteClasses
		select: [ :each | 
			each class methods
				anySatisfy: [ :each2 | 
					| sel |
					sel := each2 selector.
					(sel beginsWith: 'image')
						and: [ (sel copyFrom: 6 to: sel size) isAllDigits ] ] ]
]

{ #category : #utilities }
RetroGameApp class >> classesHavingTilemaps [
	^ self concreteClasses
		select: [ :each | 
			each class methods
				anySatisfy: [ :each2 | 
					| sel |
					sel := each2 selector.
					(sel beginsWith: 'tilemap')
						and: [ (sel copyFrom: 8 to: sel size) isAllDigits ] ] ]
]

{ #category : #utilities }
RetroGameApp class >> concreteClasses [
	^ self allSubclasses reject: #isAbstract
]

{ #category : #utilities }
RetroGameApp class >> imageClassesAndSelectors [
	| list |
	list := OrderedCollection new.
	self concreteClasses
		do: [ :each | 
			| list2 sel |
			list2 := each class methods
				select: [ :each2 | 
					sel := each2 selector.
					(sel beginsWith: 'image')
						and: [ (sel copyFrom: 6 to: sel size) isAllDigits ] ].
			list
				addAll:
					(list2
						collect: [ :each3 | 
							{each.
							each3 selector} ]) ].
	^ list
]

{ #category : #running }
RetroGameApp class >> run [
	SpRetroGamePlayer on: self new
]

{ #category : #utilities }
RetroGameApp class >> tilemapClassesAndSelectors [
	| list |
	list := OrderedCollection new.
	self concreteClasses
		do: [ :each | 
			| list2 sel |
			list2 := each class methods
				select: [ :each2 | 
					sel := each2 selector.
					(sel beginsWith: 'tilemap')
						and: [ (sel copyFrom: 8 to: sel size) isAllDigits ] ].
			list
				addAll:
					(list2
						collect: [ :each3 | 
							{each.
							each3 selector} ]) ].
	^ list
]

{ #category : #accessing }
RetroGameApp class >> title [
	self subclassResponsibility
]

{ #category : #api }
RetroGameApp >> draw [
	self subclassResponsibility
]

{ #category : #accessing }
RetroGameApp >> engine [
	^ engine
]

{ #category : #accessing }
RetroGameApp >> engine: anObject [
	engine := anObject
]

{ #category : #accessing }
RetroGameApp >> fps [
	^ fps
]

{ #category : #accessing }
RetroGameApp >> fps: anObject [
	fps := anObject
]

{ #category : #api }
RetroGameApp >> init [
	self subclassResponsibility
]

{ #category : #initialization }
RetroGameApp >> initialize [
	fps := 30
]

{ #category : #api }
RetroGameApp >> loop [
	self update.
	self draw.
	engine updateInputs
]

{ #category : #api }
RetroGameApp >> quit [
	whenQuitBlock value
]

{ #category : #api }
RetroGameApp >> update [
	self subclassResponsibility
]

{ #category : #accessing }
RetroGameApp >> whenQuitBlock [
	^ whenQuitBlock
]

{ #category : #accessing }
RetroGameApp >> whenQuitBlock: aBlock [
	whenQuitBlock := aBlock
]
