Class {
	#name : #TQMatchesEverywhere,
	#superclass : #TQSearchStrategy,
	#category : #'TreeQuery-Query'
}

{ #category : #searching }
TQMatchesEverywhere >> search: aTQIterator [
	^ aTQIterator allSatisfy: [ :node |
		self predicate matches: node ]
]
