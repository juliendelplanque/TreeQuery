Class {
	#name : #BaselineOfTreeQuery,
	#superclass : #BaselineOf,
	#category : #BaselineOfTreeQuery
}

{ #category : #baselines }
BaselineOfTreeQuery >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'TreeQuery';
				package: 'TreeQuery-Tests' with: [ spec requires: #('TreeQuery') ].
			spec
				group: 'core' with: #('TreeQuery') ]
]
