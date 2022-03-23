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
