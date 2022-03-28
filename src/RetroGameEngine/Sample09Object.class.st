Class {
	#name : #Sample09Object,
	#superclass : #Object,
	#instVars : [
		'app',
		'position',
		'isAlive'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #accessing }
Sample09Object class >> extent [
	self subclassResponsibility
]

{ #category : #accessing }
Sample09Object >> app [
	^ app
]

{ #category : #accessing }
Sample09Object >> app: anObject [
	app := anObject
]

{ #category : #accessing }
Sample09Object >> height [
	^ self class extent y
]

{ #category : #api }
Sample09Object >> init: anApp [
	app := anApp.
	isAlive := true
]

{ #category : #accessing }
Sample09Object >> isAlive [
	^ isAlive
]

{ #category : #accessing }
Sample09Object >> isAlive: anObject [
	isAlive := anObject
]

{ #category : #accessing }
Sample09Object >> position [
	^ position
]

{ #category : #accessing }
Sample09Object >> position: anObject [
	position := anObject
]

{ #category : #accessing }
Sample09Object >> width [
	^ self class extent x
]
