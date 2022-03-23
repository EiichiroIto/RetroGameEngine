Class {
	#name : #RetroGameBenchmarks,
	#superclass : #Object,
	#category : #'RetroGameEngine-Tests'
}

{ #category : #private }
RetroGameBenchmarks >> newBitBlt [
	^ RetroGameBitBlt new
]

{ #category : #private }
RetroGameBenchmarks >> newImage [
	^ RetroGameImage new
]

{ #category : #examples }
RetroGameBenchmarks >> test1 [
	"[5000 timesRepeat: [RetroGameBenchmarks new test1]] timeToRun."
	"[5000 timesRepeat: [RetroGameBenchmarks new test1]] timeProfile."
	" 0:00:00:02.857"
	" 0:00:00:03.887"
	" 0:00:00:16.843"
	" 0:00:00:30.865"
	" 0:00:00:29.945"
	"0:00:00:31.688"

	| src dest |
	src := self newImage
		extent: 200 @ 200;
		init.
	dest := self newImage
		extent: 256 @ 256;
		init.
	self newBitBlt
		sourceArray: src array;
		sourceExtent: src extent;
		sourcePoint: 0 @ 0;
		destArray: dest array;
		destExtent: dest extent;
		destPoint: 0 @ 0;
		clipExtent: 100 @ 160;
		copyBitsTranslucent: nil
]

{ #category : #examples }
RetroGameBenchmarks >> test2 [
	"[RetroGameBenchmarks new test2] timeToRun."
	"[RetroGameBenchmarks new test2] timeProfile."
	" 0:00:00:07.709"

	| app form |
	app := Sample03 new.
	app
		engine: RetroGameEngine new;
		init.
	720
		timesRepeat: [ app loop.
			form := app engine form ]
]
