Class {
	#name : #TQMatchesTree,
	#superclass : #TQSearchStrategy,
	#category : #'TreeQuery-Query'
}

{ #category : #searching }
TQMatchesTree >> search: aTQIterator [
	^ self predicate matches: aTQIterator next
]
