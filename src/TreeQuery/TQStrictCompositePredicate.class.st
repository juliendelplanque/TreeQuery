Class {
	#name : #TQStrictCompositePredicate,
	#superclass : #TQCompositePredicate,
	#category : #'TreeQuery-Predicates'
}

{ #category : #testing }
TQStrictCompositePredicate >> matches: aTQNodeWrapper [
	| matchedChildren |
	(self predicate matches: aTQNodeWrapper)
		ifFalse: [ ^ false ].
	matchedChildren := (self matchingChildrenFor: aTQNodeWrapper ifNotMatchedPredicate: [ ^ false ]).
	
	^ matchedChildren size = aTQNodeWrapper wrappedChildren size
]
