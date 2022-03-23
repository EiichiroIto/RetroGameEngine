Class {
	#name : #BaselineOfRetroGameEngine,
	#superclass : #BaselineOf,
	#category : #BaselineOfRetroGameEngine
}

{ #category : #baselines }
BaselineOfRetroGameEngine >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				package: 'RetroGameEngine';
				package: 'RetroGameEngine-Tests'
					with: [ spec requires: #('RetroGameEngine') ] ]
]

{ #category : #accessing }
BaselineOfRetroGameEngine >> projectClass [
	^ MetacelloCypressBaselineProject
]
