"
Ported demo from Pyxel.

"
Class {
	#name : #Sample08,
	#superclass : #RetroGameApp,
	#instVars : [
		'triangles'
	],
	#category : #'RetroGameEngine-Samples'
}

{ #category : #accessing }
Sample08 class >> title [
	^ '08 Triangle API Demo'
]

{ #category : #api }
Sample08 >> draw [
	triangles isEmpty
		ifFalse: [ self drawTriangle: triangles removeFirst ]
]

{ #category : #private }
Sample08 >> drawTriangle: anArray [
	| x1 y1 x2 y2 x3 y3 n col h1 h2 h3 w1 w2 w3 |
	x1 := anArray first.
	y1 := anArray second.
	x2 := anArray third.
	y2 := anArray fourth.
	x3 := anArray fifth.
	y3 := anArray sixth.
	n := anArray seventh.
	n = 0
		ifTrue: [ ^ self ].
	col := n + 7.
	n \\ 2 == 0
		ifTrue: [ engine
				triangle: x1 @ y1
				with: x2 @ y2
				with: x3 @ y3
				color: col ]
		ifFalse: [ engine
				triangleFrame: x1 @ y1
				with: x2 @ y2
				with: x3 @ y3
				color: col ].
	h1 := (x1 + x2) // 2.
	w1 := (y1 + y2) // 2.
	h2 := (x2 + x3) // 2.
	w2 := (y2 + y3) // 2.
	h3 := (x3 + x1) // 2.
	w3 := (y3 + y1) // 2.
	triangles
		add:
			{x1.
			y1.
			h1.
			w1.
			h3.
			w3.
			(n - 1)}.
	triangles
		add:
			{h1.
			w1.
			x2.
			y2.
			h2.
			w2.
			(n - 1)}.
	triangles
		add:
			{h3.
			w3.
			h2.
			w2.
			x3.
			y3.
			(n - 1)}
]

{ #category : #api }
Sample08 >> init [
	engine
		extent: 200 @ 150;
		title: 'Triangle API';
		init.
	engine cls: 13.
	engine text: 'tri(x1,y1,x2,y2,x3,y3,col)' at: 6 @ 6 color: 7.
	engine text: 'trib(x1,y1,x2,y2,x3,y3,col)' at: 6 @ 14 color: 7.
	triangles := OrderedCollection new.
	triangles add: #(100 24 7 143 193 143 7)
]

{ #category : #api }
Sample08 >> update [
	(engine isPressing: (RetroGameInputs escape))
		ifTrue: [ self quit ]
]
