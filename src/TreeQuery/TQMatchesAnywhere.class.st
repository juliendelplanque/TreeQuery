Class {
	#name : #TQMatchesAnywhere,
	#superclass : #TQSearchStrategy,
	#category : #'TreeQuery-Query'
}

{ #category : #searching }
TQMatchesAnywhere >> search: aTQIterator [
	^ aTQIterator anySatisfy: [ :node |
		self predicate matches: node ]
]
