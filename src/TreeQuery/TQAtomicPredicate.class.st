"
A predicate is said to be atomic if it does not rely on the result of an other predicate to decide whether a node provided to #matches: methods matches or not.
"
Class {
	#name : #TQAtomicPredicate,
	#superclass : #TQPredicate,
	#category : #'TreeQuery-Predicates'
}

{ #category : #composing }
TQAtomicPredicate >> / aTQPredicate [
	^ TQChildPathPredicate path: { self . aTQPredicate }
]

{ #category : #composing }
TQAtomicPredicate >> > aCollectionOfTQPredicates [
	^ self predicatesForChildren: aCollectionOfTQPredicates
]

{ #category : #composing }
TQAtomicPredicate >> >> aCollectionOfTQPredicates [
	^ self strictPredicatesForChildren: aCollectionOfTQPredicates
]

{ #category : #composing }
TQAtomicPredicate >> \ aTQPredicate [
	^ self parentPredicate: aTQPredicate
]

{ #category : #extracting }
TQAtomicPredicate >> extract: aTQNodeWrapper [
	^ TQNode new
			data: aTQNodeWrapper wrappedNode;
			yourself
]

{ #category : #composing }
TQAtomicPredicate >> parentPredicate: aTQPredicate [
	^ TQParentPathPredicate path: { self . aTQPredicate }
]

{ #category : #composing }
TQAtomicPredicate >> predicatesForChildren: aCollectionOfTQPredicates [
	^ TQCompositePredicate predicate: self children: aCollectionOfTQPredicates
]

{ #category : #composing }
TQAtomicPredicate >> strictPredicatesForChildren: aCollectionOfTQPredicates [
	^ TQStrictCompositePredicate predicate: self children: aCollectionOfTQPredicates
]
