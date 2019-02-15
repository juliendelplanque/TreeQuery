Class {
	#name : #TQPredicate,
	#superclass : #Object,
	#category : #'TreeQuery-Query'
}

{ #category : #composing }
TQPredicate >> / aTQPredicate [
	^ TQPathPredicate path: { self . aTQPredicate }
]

{ #category : #composing }
TQPredicate >> > aCollectionOfTQPredicates [
	^ self children: aCollectionOfTQPredicates
]

{ #category : #composing }
TQPredicate >> children: aCollectionOfTQPredicates [
	^ TQCompositePredicate predicate: self children: aCollectionOfTQPredicates
]

{ #category : #testing }
TQPredicate >> matches: aTQNodeWrapper [
	^ self subclassResponsibility
]
