Class {
	#name : #Sample10Object,
	#superclass : #RetroGameObject,
	#instVars : [
		'isAlive',
		'delta'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #accessing }
Sample10Object >> delta [
	^ delta
]

{ #category : #accessing }
Sample10Object >> delta: anObject [
	delta := anObject
]

{ #category : #api }
Sample10Object >> init: anApp [
	super init: anApp.
	delta := 0 @ 0.
	isAlive := true
]

{ #category : #accessing }
Sample10Object >> isAlive [
	^ isAlive
]

{ #category : #accessing }
Sample10Object >> isAlive: anObject [
	isAlive := anObject
]
