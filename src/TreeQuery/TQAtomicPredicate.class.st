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
	^ self predicatesForChildren: aCollectionOfTQPredicates
]

{ #category : #composing }
TQAtomicPredicate >> children: aCollectionOfTQPredicates [
	self
		deprecated: 'Use #predicatesForChildren: instead.'
		transformWith: '`@receiver children: `@statements1' 
						-> '`@receiver predicatesForChildren: `@statements1'.
	^ self predicatesForChildren: aCollectionOfTQPredicates
]

{ #category : #extracting }
TQAtomicPredicate >> extract: aTQNodeWrapper [
	^ TQNode new
			data: aTQNodeWrapper wrappedNode;
			yourself
]

{ #category : #composing }
TQAtomicPredicate >> parent: aTQAtomicPredicate [
	^ TQParentPredicate predicate: aTQAtomicPredicate
]

{ #category : #composing }
TQAtomicPredicate >> predicatesForChildren: aCollectionOfTQPredicates [
	^ TQCompositePredicate predicate: self children: aCollectionOfTQPredicates
]

{ #category : #composing }
TQAtomicPredicate >> strictChildren: aCollectionOfTQPredicates [
	self
		deprecated: 'Use #strictPredicatesForChildren: instead.'
		transformWith: '`@receiver strictChildren: `@statements1' 
						-> '`@receiver strictPredicatesForChildren: `@statements1'.
	^ self strictPredicatesForChildren: aCollectionOfTQPredicates
]

{ #category : #composing }
TQAtomicPredicate >> strictPredicatesForChildren: aCollectionOfTQPredicates [
	^ TQStrictCompositePredicate predicate: self children: aCollectionOfTQPredicates
]
