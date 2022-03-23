Class {
	#name : #Sample09Blast,
	#superclass : #Sample09Object,
	#instVars : [
		'radius'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #constants }
Sample09Blast class >> colorIn [
	^ 7
]

{ #category : #constants }
Sample09Blast class >> colorOut [
	^ 10
]

{ #category : #constants }
Sample09Blast class >> endRadius [
	^ 8
]

{ #category : #constants }
Sample09Blast class >> startRadius [
	^ 1
]

{ #category : #api }
Sample09Blast >> draw: anApp [
	anApp engine
		circle: position r: radius color: self class colorIn;
		circleFrame: position r: radius color: self class colorOut
]

{ #category : #api }
Sample09Blast >> init: anApp [
	radius := self class startRadius.
	isAlive := true
]

{ #category : #api }
Sample09Blast >> update: anApp [
	radius := radius + 1.
	radius > self class endRadius
		ifTrue: [ isAlive := false ]
]
