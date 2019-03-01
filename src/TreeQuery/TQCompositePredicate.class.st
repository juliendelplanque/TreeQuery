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
TQCompositePredicate >> matchingChildrenFor: aTQNodeWrapper [
	| wrappedChildren |
	wrappedChildren := aTQNodeWrapper wrappedChildren copy asOrderedCollection.
	^ self children collect: [ :queryChild |
		wrappedChildren
			detect: [ :treeChild | queryChild matches: treeChild ]
			ifFound: [ :found | wrappedChildren remove: found. found ]
			ifNone: [ nil ] ] thenReject: #isNil
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
