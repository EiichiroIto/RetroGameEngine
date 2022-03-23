Class {
	#name : #Sample09Bullet,
	#superclass : #Sample09Object,
	#category : #'RetroGameEngine-Samples'
}

{ #category : #constants }
Sample09Bullet class >> color [
	^ 11
]

{ #category : #constants }
Sample09Bullet class >> extent [
	^ 2 @ 8
]

{ #category : #constants }
Sample09Bullet class >> speed [
	^ 4
]

{ #category : #api }
Sample09Bullet >> draw: anApp [
	anApp engine rect: position extent: self class extent color: self class color
]

{ #category : #api }
Sample09Bullet >> init: anApp [
	isAlive := true
]

{ #category : #api }
Sample09Bullet >> update: anApp [
	position := position x @ (position y - self class speed).
	position y + self height - 1 < 0
		ifTrue: [ isAlive := false ]
]
