Class {
	#name : #RetroGameBitBlt,
	#superclass : #Object,
	#instVars : [
		'destArray',
		'sourceArray',
		'destExtent',
		'sourceExtent',
		'destPoint',
		'sourcePoint',
		'clipExtent',
		'destMask',
		'transparentColor'
	],
	#category : #'RetroGameEngine-Core'
}

{ #category : #accessing }
RetroGameBitBlt >> clipExtent [
	^ clipExtent
]

{ #category : #accessing }
RetroGameBitBlt >> clipExtent: anObject [
	clipExtent := anObject
]

{ #category : #private }
RetroGameBitBlt >> clipRange [
	| cx cy |
	(sourcePoint x >= sourceExtent x
		or: [ sourcePoint y >= sourceExtent y ])
		ifTrue: [ ^ clipExtent := nil ].
	(destPoint x >= destExtent x or: [ destPoint y >= destExtent y ])
		ifTrue: [ ^ clipExtent := nil ].
	cx := clipExtent abs x.
	sourcePoint x < 0
		ifTrue: [ cx := cx + sourcePoint x.
			sourcePoint := 0 @ sourcePoint y ].
	destPoint x < 0
		ifTrue: [ cx := cx + destPoint x.
			clipExtent x >= 0
				ifTrue: [ sourcePoint := (sourcePoint x - destPoint x) @ sourcePoint y ].
			destPoint := 0 @ destPoint y ].
	sourcePoint x + cx >= sourceExtent x
		ifTrue: [ cx := sourceExtent x - sourcePoint x ].
	destPoint x + cx >= destExtent x
		ifTrue: [ cx := destExtent x - destPoint x ].
	cx < 1
		ifTrue: [ ^ clipExtent := nil ].
	cy := clipExtent abs y.
	sourcePoint y < 0
		ifTrue: [ cy := cy + sourcePoint y.
			sourcePoint := sourcePoint x @ 0 ].
	destPoint y < 0
		ifTrue: [ cy := cy + destPoint y.
			clipExtent x >= 0
				ifTrue: [ sourcePoint := sourcePoint x @ (sourcePoint y - destPoint y) ].
			destPoint := destPoint x @ 0 ].
	sourcePoint y + cy >= sourceExtent y
		ifTrue: [ cy := sourceExtent y - sourcePoint y ].
	destPoint y + cy >= destExtent y
		ifTrue: [ cy := destExtent y - destPoint y ].
	cy < 1
		ifTrue: [ ^ clipExtent := nil ].
	clipExtent := cx @ cy
]

{ #category : #api }
RetroGameBitBlt >> copyBits [
	| flip |
	flip := clipExtent sign.
	self clipRange.
	clipExtent ifNil: [ ^ self ].
	flip x < 0
		ifTrue: [ flip y < 0
				ifTrue: [ self copyBitsHVReverse ]
				ifFalse: [ self copyBitsHReverse ] ]
		ifFalse: [ flip y < 0
				ifTrue: [ self copyBitsVReverse ]
				ifFalse: [ destMask
						ifNil: [ transparentColor
								ifNil: [ self copyBitsNormal ]
								ifNotNil: [ self copyBitsNormalWithTransparentColor ] ]
						ifNotNil: [ self copyBitsNormalWithMask ] ] ]
]

{ #category : #api }
RetroGameBitBlt >> copyBitsHReverse [
	| c destIndex sourceIndex |
	sourceIndex := self sourceIndexOf: sourcePoint.
	destIndex := self destIndexOf: destPoint.
	clipExtent y
		timesRepeat: [ 1 to: clipExtent x do: [ :x | 
				c := sourceArray at: sourceIndex + clipExtent x - x.
				((destMask isNil or: [ destMask at: destIndex + x - 1 ])
					and: [ c ~= transparentColor ])
					ifTrue: [ destArray at: destIndex + x - 1 put: c ] ].
			sourceIndex := sourceIndex + sourceExtent x.
			destIndex := destIndex + destExtent x ]
]

{ #category : #api }
RetroGameBitBlt >> copyBitsHVReverse [
	| c destIndex sourceIndex |
	sourceIndex := self
		sourceIndexOf: sourcePoint + (0 @ (clipExtent y - 1)).
	destIndex := self destIndexOf: destPoint.
	clipExtent y
		timesRepeat: [ 1 to: clipExtent x do: [ :x | 
				c := sourceArray at: sourceIndex + clipExtent x - x.
				((destMask isNil or: [ destMask at: destIndex + x - 1 ])
					and: [ c ~= transparentColor ])
					ifTrue: [ destArray at: destIndex + x - 1 put: c ].
				 ].
			sourceIndex := sourceIndex - sourceExtent x.
			destIndex := destIndex + destExtent x ]
]

{ #category : #api }
RetroGameBitBlt >> copyBitsNormal [
	| destIndex sourceIndex |
	sourceIndex := self sourceIndexOf: sourcePoint.
	destIndex := self destIndexOf: destPoint.
	1 to: clipExtent y do: [ :y | 
		destArray
			replaceFrom: destIndex
			to: destIndex + clipExtent x - 1
			with: sourceArray
			startingAt: sourceIndex.
		sourceIndex := sourceIndex + sourceExtent x.
		destIndex := destIndex + destExtent x ]
]

{ #category : #api }
RetroGameBitBlt >> copyBitsNormalWithMask [
	| c destIndex sourceIndex |
	sourceIndex := self sourceIndexOf: sourcePoint.
	destIndex := self destIndexOf: destPoint.
	1 to: clipExtent y do: [ :y | 
		0 to: clipExtent x - 1 do: [ :index | 
			c := sourceArray at: sourceIndex + index.
			((destMask at: destIndex + index) and: [ c ~= transparentColor ])
				ifTrue: [ destArray at: destIndex + index put: c ] ].
		sourceIndex := sourceIndex + sourceExtent x.
		destIndex := destIndex + destExtent x ]
]

{ #category : #api }
RetroGameBitBlt >> copyBitsNormalWithTransparentColor [
	| c destIndex sourceIndex |
	sourceIndex := self sourceIndexOf: sourcePoint.
	destIndex := self destIndexOf: destPoint.
	1 to: clipExtent y do: [ :y | 
		0 to: clipExtent x - 1 do: [ :index | 
			c := sourceArray at: sourceIndex + index.
			c = transparentColor
				ifFalse: [ destArray at: destIndex + index put: c ] ].
		sourceIndex := sourceIndex + sourceExtent x.
		destIndex := destIndex + destExtent x ]
]

{ #category : #api }
RetroGameBitBlt >> copyBitsVReverse [
	| c destIndex sourceIndex |
	sourceIndex := self
		sourceIndexOf: sourcePoint + (0 @ (clipExtent y - 1)).
	destIndex := self destIndexOf: destPoint.
	clipExtent y
		timesRepeat: [ clipExtent x
				timesRepeat: [ c := sourceArray at: sourceIndex.
				((destMask isNil or: [ destMask at: destIndex ])
					and: [ c ~= transparentColor ])
						ifTrue: [ destArray at: destIndex put: c ].
					sourceIndex := sourceIndex + 1.
					destIndex := destIndex + 1 ].
			sourceIndex := sourceIndex - clipExtent x - sourceExtent x.
			destIndex := destIndex + destExtent x - clipExtent x ]
]

{ #category : #accessing }
RetroGameBitBlt >> destArray [
	^ destArray
]

{ #category : #accessing }
RetroGameBitBlt >> destArray: anObject [
	destArray := anObject
]

{ #category : #accessing }
RetroGameBitBlt >> destExtent [
	^ destExtent
]

{ #category : #accessing }
RetroGameBitBlt >> destExtent: anObject [
	destExtent := anObject
]

{ #category : #private }
RetroGameBitBlt >> destIndexOf: aPoint [
	^ aPoint y * destExtent x + aPoint x + 1
]

{ #category : #accessing }
RetroGameBitBlt >> destMask [
	^ destMask
]

{ #category : #accessing }
RetroGameBitBlt >> destMask: anObject [
	destMask := anObject
]

{ #category : #accessing }
RetroGameBitBlt >> destPoint [
	^ destPoint
]

{ #category : #accessing }
RetroGameBitBlt >> destPoint: anObject [
	destPoint := anObject
]

{ #category : #accessing }
RetroGameBitBlt >> sourceArray [
	^ sourceArray
]

{ #category : #accessing }
RetroGameBitBlt >> sourceArray: anObject [
	sourceArray := anObject
]

{ #category : #accessing }
RetroGameBitBlt >> sourceExtent [
	^ sourceExtent
]

{ #category : #accessing }
RetroGameBitBlt >> sourceExtent: anObject [
	sourceExtent := anObject
]

{ #category : #private }
RetroGameBitBlt >> sourceIndexOf: aPoint [
	^ aPoint y * sourceExtent x + aPoint x + 1
]

{ #category : #accessing }
RetroGameBitBlt >> sourcePoint [
	^ sourcePoint
]

{ #category : #accessing }
RetroGameBitBlt >> sourcePoint: anObject [
	sourcePoint := anObject
]

{ #category : #accessing }
RetroGameBitBlt >> transparentColor [
	^ transparentColor
]

{ #category : #accessing }
RetroGameBitBlt >> transparentColor: anObject [
	transparentColor := anObject
]
