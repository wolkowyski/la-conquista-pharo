Class {
	#name : #BaselineOfLaConquista,
	#superclass : #BaselineOf,
	#category : #BaselineOfLaConquista
}

{ #category : #baselines }
BaselineOfLaConquista >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'A-TRABAJOPARADIGMAS' ]
]
