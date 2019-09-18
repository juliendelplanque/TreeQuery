Class {
	#name : #TQMatchesAnywhere,
	#superclass : #TQSearchStrategy,
	#category : #'TreeQuery-Query'
}

{ #category : #searching }
TQMatchesAnywhere >> search: aTQIterator [
	^ aTQIterator withCollectionAPI anySatisfy: [ :node |
		self predicate matches: node ]
]
