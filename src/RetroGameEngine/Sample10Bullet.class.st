Class {
	#name : #Sample10Bullet,
	#superclass : #Sample10Object,
	#category : #'RetroGameEngine-Samples'
}

{ #category : #api }
Sample10Bullet >> draw [
	app engine
		blt: position
		imageBank: 0
		at: (app engine frameCount // 2 \\ 2 * 8 + 16) @ 32
		extent: 8 @ 8
		transparentColor: app class transparentColor
]

{ #category : #updating }
Sample10Bullet >> update [
	position := position + delta
]
