Class {
	#name : #RetroGameObject,
	#superclass : #Object,
	#instVars : [
		'app',
		'position'
	],
	#category : #'RetroGameEngine-Core'
}

{ #category : #accessing }
RetroGameObject >> app [
	^ app
]

{ #category : #accessing }
RetroGameObject >> app: anObject [
	app := anObject
]

{ #category : #constants }
RetroGameObject >> defaultPosition [
	^ 0 @ 0
]

{ #category : #api }
RetroGameObject >> draw [
	self subclassResponsibility
]

{ #category : #api }
RetroGameObject >> init: anApp [
	app := anApp.
	position := self defaultPosition
]

{ #category : #accessing }
RetroGameObject >> position [
	^ position
]

{ #category : #accessing }
RetroGameObject >> position: anObject [
	position := anObject
]

{ #category : #api }
RetroGameObject >> update [
	self subclassResponsibility
]
