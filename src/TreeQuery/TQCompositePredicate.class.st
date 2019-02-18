Class {
	#name : #TQCompositePredicate,
	#superclass : #TQPredicate,
	#instVars : [
		'predicate',
		'children'
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
	^ children
]

{ #category : #accessing }
TQCompositePredicate >> children: anObject [
	children := anObject
]

{ #category : #testing }
TQCompositePredicate >> matches: aTQNodeWrapper [
	| wrappedChildren |
	(self predicate matches: aTQNodeWrapper)
		ifFalse: [ ^ false ].
	
	wrappedChildren := aTQNodeWrapper wrappedChildren copy asOrderedCollection.
	
	self children do: [ :queryChild |
		wrappedChildren
			detect: [ :treeChild | queryChild matches: treeChild ]
			ifFound: [ :found | wrappedChildren remove: found ]
			ifNone: [ ^ false ] ].
		
	^ true
]

{ #category : #accessing }
TQCompositePredicate >> predicate [
	^ predicate
]

{ #category : #accessing }
TQCompositePredicate >> predicate: anObject [
	predicate := anObject
]
