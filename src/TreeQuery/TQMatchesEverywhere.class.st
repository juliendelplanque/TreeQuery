Class {
	#name : #TQMatchesEverywhere,
	#superclass : #TQSearchStrategy,
	#category : #'TreeQuery-Query'
}

{ #category : #searching }
TQMatchesEverywhere >> search: aTQIterator [
	^ aTQIterator withCollectionAPI allSatisfy: [ :node |
		self predicate matches: node ]
]
