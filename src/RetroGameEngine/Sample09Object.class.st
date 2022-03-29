Class {
	#name : #Sample09Object,
	#superclass : #RetroGameObject,
	#instVars : [
		'isAlive'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #accessing }
Sample09Object class >> extent [
	self subclassResponsibility
]

{ #category : #accessing }
Sample09Object >> height [
	^ self class extent y
]

{ #category : #api }
Sample09Object >> init: anApp [
	super init: anApp.
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
Sample09Object >> width [
	^ self class extent x
]
