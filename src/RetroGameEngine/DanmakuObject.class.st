Class {
	#name : #DanmakuObject,
	#superclass : #Object,
	#instVars : [
		'app',
		'position',
		'extent',
		'isAlive'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #accessing }
DanmakuObject >> app [
	^ app
]

{ #category : #accessing }
DanmakuObject >> app: anObject [
	app := anObject
]

{ #category : #api }
DanmakuObject >> draw [
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
	app := anApp.
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
DanmakuObject >> update [
	""
]
