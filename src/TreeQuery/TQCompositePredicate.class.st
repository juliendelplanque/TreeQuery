Class {
	#name : #TQCompositePredicate,
	#superclass : #TQPredicate,
	#instVars : [
		'predicate',
		'predicatesForChildren'
	],
	#category : #'TreeQuery-Predicates'
}

{ #category : #'instance creation' }
TQCompositePredicate class >> predicate: aTQPredicate children: aCollectionOfTQPredicates [
	^ self new
		predicate: aTQPredicate;
		predicatesForChildren: aCollectionOfTQPredicates;
		yourself
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
TQCompositePredicate >> matchingChildrenFor: aTQNodeWrapper collect: collectBlock ifNotMatchedPredicate: aBlock [
	| wrappedChildren |
	wrappedChildren := aTQNodeWrapper wrappedChildren copy asOrderedCollection.
	^ self predicatesForChildren collect: [ :queryChild |
		wrappedChildren
			detect: [ :treeChild | queryChild matches: treeChild ]
			ifFound: [ :found | 
				wrappedChildren remove: found.
				collectBlock value: found ]
			ifNone: [ aBlock cull: queryChild ] ]
]

{ #category : #accessing }
TQCompositePredicate >> matchingChildrenFor: aTQNodeWrapper ifNotMatchedPredicate: aBlock [
	^ self matchingChildrenFor: aTQNodeWrapper collect: #yourself ifNotMatchedPredicate: aBlock
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
