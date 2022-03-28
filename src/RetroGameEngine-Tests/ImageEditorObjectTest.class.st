"
An ImageEditorObjectTest is a test class for testing the behavior of ImageEditorObject
"
Class {
	#name : #ImageEditorObjectTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
ImageEditorObjectTest >> newApp [
	^ ImageEditor new
]

{ #category : #private }
ImageEditorObjectTest >> newObj [
	^ ImageEditorObject new
]

{ #category : #test }
ImageEditorObjectTest >> testExtent [
	| obj |
	obj := self newObj.
	self assert: obj extent isNil.
	obj extent: 1 @ 2.
	self assert: obj extent equals: 1 @ 2
]

{ #category : #test }
ImageEditorObjectTest >> testPosition [
	| obj |
	obj := self newObj.
	self assert: obj position isNil.
	obj position: 1 @ 2.
	self assert: obj position equals: 1 @ 2
]
