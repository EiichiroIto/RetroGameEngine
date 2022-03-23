Class {
	#name : #Sample10Object,
	#superclass : #Object,
	#instVars : [
		'position',
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

{ #category : #accessing }
Sample10Object >> position [
	^ position
]

{ #category : #accessing }
Sample10Object >> position: anObject [
	position := anObject
]
