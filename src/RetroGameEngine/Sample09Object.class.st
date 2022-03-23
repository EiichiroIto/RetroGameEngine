Class {
	#name : #Sample09Object,
	#superclass : #Object,
	#instVars : [
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
Sample09Object >> height [
	^ self class extent y
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
