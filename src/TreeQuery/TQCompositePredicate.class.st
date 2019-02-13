Class {
	#name : #TQCompositePredicate,
	#superclass : #TQAbstractPredicate,
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
TQCompositePredicate >> matches: aNode [
	| matchedTreeChildren |
	(self predicate matches: aNode)
		ifFalse: [ ^ false ].
	
	matchedTreeChildren := self children collect: [ :queryChild |
		aNode tqChildren
			detect: [ :treeChild | queryChild matches: treeChild ]
			ifNone: [ ^ false ] ].
	^ matchedTreeChildren asIdentitySet size = matchedTreeChildren size
]

{ #category : #accessing }
TQCompositePredicate >> predicate [
	^ predicate
]

{ #category : #accessing }
TQCompositePredicate >> predicate: anObject [
	predicate := anObject
]
