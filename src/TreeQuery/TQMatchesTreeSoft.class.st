Class {
	#name : #TQMatchesTreeSoft,
	#superclass : #TQSearchStrategy,
	#category : #'TreeQuery-Query'
}

{ #category : #searching }
TQMatchesTreeSoft >> search: aTQIterator [
	^ self predicate matches: aTQIterator next
]
