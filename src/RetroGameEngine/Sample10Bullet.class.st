Class {
	#name : #Sample10Bullet,
	#superclass : #Sample10Object,
	#category : #'RetroGameEngine-Samples'
}

{ #category : #api }
Sample10Bullet >> draw: anApp [
	anApp engine
		blt: position
		imageBank: 0
		at: (anApp engine frameCount // 2 \\ 2 * 8 + 16) @ 32
		extent: 8 @ 8
		color: anApp class transparentColor
]

{ #category : #updating }
Sample10Bullet >> update: anApp [
	position := position + delta
]
