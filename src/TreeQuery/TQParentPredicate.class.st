Class {
	#name : #TQParentPredicate,
	#superclass : #TQPredicate,
	#instVars : [
		'predicate'
	],
	#category : #'TreeQuery-Query'
}

{ #category : #'instance creation' }
TQParentPredicate class >> predicate: aTQPredicate [
	^ self new
		predicate: aTQPredicate;
		yourself
]

{ #category : #testing }
TQParentPredicate >> matches: aTQNodeWrapper [
	aTQNodeWrapper hasParent
		ifFalse: [ ^ false ].
	^ self predicate matches: aTQNodeWrapper parent
]

{ #category : #accessing }
TQParentPredicate >> predicate [
	^ predicate
]

{ #category : #accessing }
TQParentPredicate >> predicate: anObject [
	predicate := anObject
]
