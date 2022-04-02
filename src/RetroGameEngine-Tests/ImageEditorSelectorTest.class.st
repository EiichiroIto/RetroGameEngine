"
An ImageEditorSelectorTest is a test class for testing the behavior of ImageEditorSelector
"
Class {
	#name : #ImageEditorSelectorTest,
	#superclass : #TestCase,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
ImageEditorSelectorTest >> newObj [
	^ ImageEditorSelector new
		init: ImageEditor new;
		yourself
]

{ #category : #test }
ImageEditorSelectorTest >> testButtonExtent [
	self assert: self newObj buttonExtent isPoint
]

{ #category : #test }
ImageEditorSelectorTest >> testDefaultPosition [
	self assert: self newObj defaultPosition isPoint
]

{ #category : #test }
ImageEditorSelectorTest >> testExtent [
	self assert: self newObj extent isPoint
]

{ #category : #test }
ImageEditorSelectorTest >> testImageNo [
	| obj |
	obj := self newObj.
	self assert: obj imageNo equals: 0.
	obj imageNo: 2.
	self assert: obj imageNo equals: 2
]

{ #category : #test }
ImageEditorSelectorTest >> testImageNoChanged [
	| obj b x |
	obj := self newObj.
	x := nil.
	b := [ x := 1 ].
	obj imageNoChanged.
	self assert: x isNil.
	obj whenImageNoChanged: b.
	self assert: x isNil.
	obj imageNoChanged.
	self assert: x equals: 1
]

{ #category : #test }
ImageEditorSelectorTest >> testImageNoPosition [
	self assert: self newObj imageNoPosition isPoint
]

{ #category : #test }
ImageEditorSelectorTest >> testImageTextPosition [
	self assert: self newObj imageTextPosition isPoint
]

{ #category : #test }
ImageEditorSelectorTest >> testMinusButtonPosition [
	self assert: self newObj minusButtonPosition isPoint
]

{ #category : #test }
ImageEditorSelectorTest >> testMinusClicked [
	| obj |
	obj := self newObj.
	self assert: obj imageNo equals: 0.
	obj imageNo: 2.
	self assert: obj imageNo equals: 2.
	obj minusClicked.
	self assert: obj imageNo equals: 1.
	obj minusClicked.
	self assert: obj imageNo equals: 0.
	obj minusClicked.
	self assert: obj imageNo equals: 0
]

{ #category : #test }
ImageEditorSelectorTest >> testPlusButtonPosition [
	self assert: self newObj plusButtonPosition isPoint
]

{ #category : #test }
ImageEditorSelectorTest >> testPlusClicked [
	| obj |
	obj := self newObj.
	self assert: obj imageNo equals: 0.
	obj imageNo: 1.
	self assert: obj imageNo equals: 1.
	obj plusClicked.
	self assert: obj imageNo equals: 2.
	obj plusClicked.
	self assert: obj imageNo equals: 2
]

{ #category : #test }
ImageEditorSelectorTest >> testWhenImageNoChanged [
	| obj b |
	obj := self newObj.
	self assert: obj whenImageNoChanged isNil.
	b := [ 1 + 2 ].
	obj whenImageNoChanged: b.
	self assert: obj whenImageNoChanged identicalTo: b
]
