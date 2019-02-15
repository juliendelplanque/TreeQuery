Class {
	#name : #TQCollectMatches,
	#superclass : #TQSearchStrategy,
	#category : #'TreeQuery-Query'
}

{ #category : #searching }
TQCollectMatches >> search: aTQIterator [
	^ (aTQIterator select: [ :node |
		self predicate matches: node ]) collect: #wrappedNode
]
