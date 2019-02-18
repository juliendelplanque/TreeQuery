"
Matches if I met a node without children.
"
Class {
	#name : #TQNoChildPredicate,
	#superclass : #TQAtomicPredicate,
	#category : #'TreeQuery-Query'
}

{ #category : #testing }
TQNoChildPredicate >> matches: aTQNodeWrapper [
	^ aTQNodeWrapper wrappedChildren isEmpty
]
