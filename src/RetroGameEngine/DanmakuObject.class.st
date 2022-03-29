Class {
	#name : #DanmakuObject,
	#superclass : #RetroGameObject,
	#instVars : [
		'extent',
		'isAlive'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #accessing }
DanmakuObject >> extent [
	^ extent
]

{ #category : #accessing }
DanmakuObject >> extent: anObject [
	extent := anObject
]

{ #category : #api }
DanmakuObject >> init: anApp [
	super init: anApp.
	isAlive := true
]

{ #category : #accessing }
DanmakuObject >> isAlive [
	^ isAlive
]

{ #category : #accessing }
DanmakuObject >> isAlive: anObject [
	isAlive := anObject
]
