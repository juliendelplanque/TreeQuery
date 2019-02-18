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
TQAtomicPredicate >> strictChildren: aCollectionOfTQPredicates [
	^ TQStrictCompositePredicate predicate: self children: aCollectionOfTQPredicates
]
