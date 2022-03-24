Class {
	#name : #DanmakuObject,
	#superclass : #Object,
	#instVars : [
		'position',
		'extent',
		'isAlive'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #api }
DanmakuObject >> draw: anApp [
	""
]

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

{ #category : #accessing }
DanmakuObject >> position [
	^ position
]

{ #category : #accessing }
DanmakuObject >> position: anObject [
	position := anObject
]

{ #category : #api }
DanmakuObject >> update: anApp [
	""
]
