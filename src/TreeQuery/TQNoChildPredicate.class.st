"
Matches if I met a node without children.
"
Class {
	#name : #TQNoChildPredicate,
	#superclass : #TQAtomicPredicate,
	#category : #'TreeQuery-Predicates'
}

{ #category : #testing }
TQNoChildPredicate >> matches: aTQNodeWrapper [
	^ aTQNodeWrapper wrappedChildren isEmpty
]
