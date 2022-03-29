"
A RetroGameObjectTest is a test class for testing the behavior of RetroGameObject
"
Class {
	#name : #RetroGameObjectTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
RetroGameObjectTest >> newApp [
	^ RetroGameApp new
]

{ #category : #private }
RetroGameObjectTest >> newObj [
	^ RetroGameObject new
]

{ #category : #test }
RetroGameObjectTest >> testApp [
	| obj a |
	obj := self newObj.
	self assert: obj app isNil.
	a := self newApp.
	obj app: a.
	self assert: obj app identicalTo: a
]

{ #category : #test }
RetroGameObjectTest >> testInit [
	| obj a |
	obj := self newObj.
	self assert: obj app isNil.
	self assert: obj position isNil.
	a := self newApp.
	obj init: a.
	self assert: obj app identicalTo: a.
	self assert: obj position equals: obj defaultPosition
]

{ #category : #test }
RetroGameObjectTest >> testPosition [
	| obj |
	obj := self newObj.
	self assert: obj position isNil.
	obj position: 1 @ 2.
	self assert: obj position equals: 1 @ 2
]
