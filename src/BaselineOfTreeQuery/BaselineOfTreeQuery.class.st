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
				package: 'TreeQuery' with: [ spec requires: #('Iterators') ];
				package: 'TreeQuery-Tests' with: [ spec requires: #('TreeQuery') ].
			spec
				baseline: 'Iterators'
				with: [ 
					spec repository: 'github://juliendelplanque/Iterators:v1.x.x/src';
						loads: #('core' 'collections' 'shell-dsl' 'inspector-extensions') ];
				project: 'IteratorsTests' copyFrom: 'Iterators' with: [ spec loads: #('tests') ].
			spec
				group: 'core' with: #('TreeQuery');
				group: 'tests' with: #('TreeQuery-Tests' 'IteratorsTests') ]
]
