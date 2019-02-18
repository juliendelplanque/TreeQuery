Class {
	#name : #TQHardCompositePredicate,
	#superclass : #TQCompositePredicate,
	#category : #'TreeQuery-Query'
}

{ #category : #testing }
TQHardCompositePredicate >> matches: aTQNodeWrapper [
	| wrappedChildren |
	(self predicate matches: aTQNodeWrapper)
		ifFalse: [ ^ false ].
	
	wrappedChildren := aTQNodeWrapper wrappedChildren copy asOrderedCollection.
	
	self children do: [ :queryChild |
		wrappedChildren
			detect: [ :treeChild | queryChild matches: treeChild ]
			ifFound: [ :found | wrappedChildren remove: found ]
			ifNone: [ ^ false ] ].
		
	^ wrappedChildren isEmpty
]
