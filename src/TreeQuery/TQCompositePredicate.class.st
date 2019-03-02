Class {
	#name : #TQCompositePredicate,
	#superclass : #TQPredicate,
	#instVars : [
		'predicate',
		'predicatesForChildren'
	],
	#category : #'TreeQuery-Query'
}

{ #category : #'instance creation' }
TQCompositePredicate class >> predicate: aTQPredicate children: aCollectionOfTQPredicates [
	^ self new
		predicate: aTQPredicate;
		children: aCollectionOfTQPredicates;
		yourself
]

{ #category : #accessing }
TQCompositePredicate >> children [
	self deprecated: 'Use #predicatesForChildren instead.'.
	^ self predicatesForChildren
]

{ #category : #accessing }
TQCompositePredicate >> children: anObject [
	self deprecated: 'Use #predicatesForChildren: instead.'.
	self predicatesForChildren: anObject
]

{ #category : #testing }
TQCompositePredicate >> matches: aTQNodeWrapper [
	(self predicate matches: aTQNodeWrapper)
		ifFalse: [ ^ false ].
	
	self matchingChildrenFor: aTQNodeWrapper ifNotMatchedPredicate: [ ^ false ].
		
	^ true
]

{ #category : #accessing }
TQCompositePredicate >> matchingChildrenFor: aTQNodeWrapper [
	^ self
		matchingChildrenFor: aTQNodeWrapper
		ifNotMatchedPredicate: [ :notMatchedPredicate | 
			TQPredicateWasNotMatched signal: notMatchedPredicate ]
]

{ #category : #accessing }
TQCompositePredicate >> matchingChildrenFor: aTQNodeWrapper ifNotMatchedPredicate: aBlock [
	| wrappedChildren |
	wrappedChildren := aTQNodeWrapper wrappedChildren copy asOrderedCollection.
	^ self predicatesForChildren collect: [ :queryChild |
		wrappedChildren
			detect: [ :treeChild | queryChild matches: treeChild ]
			ifFound: [ :found | wrappedChildren remove: found. found ]
			ifNone: [ aBlock cull: queryChild ] ]
]

{ #category : #accessing }
TQCompositePredicate >> predicate [
	^ predicate
]

{ #category : #accessing }
TQCompositePredicate >> predicate: anObject [
	predicate := anObject
]

{ #category : #accessing }
TQCompositePredicate >> predicatesForChildren [
	^ predicatesForChildren
]

{ #category : #accessing }
TQCompositePredicate >> predicatesForChildren: anObject [
	predicatesForChildren := anObject
]
