Class {
	#name : #TQAtomicPredicate,
	#superclass : #TQPredicate,
	#category : #'TreeQuery-Query'
}

{ #category : #composing }
TQAtomicPredicate >> / aTQPredicate [
	^ TQPathPredicate path: { self . aTQPredicate }
]

{ #category : #composing }
TQAtomicPredicate >> > aCollectionOfTQPredicates [
	^ self children: aCollectionOfTQPredicates
]

{ #category : #composing }
TQAtomicPredicate >> children: aCollectionOfTQPredicates [
	^ TQCompositePredicate predicate: self children: aCollectionOfTQPredicates
]

{ #category : #composing }
TQAtomicPredicate >> hardChildren: aCollectionOfTQPredicates [
	^ TQHardCompositePredicate predicate: self children: aCollectionOfTQPredicates
]
