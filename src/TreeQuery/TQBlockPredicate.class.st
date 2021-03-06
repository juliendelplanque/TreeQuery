"
Matches if my #predicateBlock evaluate to true for the node provided to #matches:.
"
Class {
	#name : #TQBlockPredicate,
	#superclass : #TQAtomicPredicate,
	#instVars : [
		'predicateBlock'
	],
	#category : #'TreeQuery-Predicates'
}

{ #category : #'instance creation' }
TQBlockPredicate class >> predicateBlock: aBlock [
	^ self new
		predicateBlock: aBlock;
		yourself
]

{ #category : #testing }
TQBlockPredicate >> matches: aTQNodeWrapper [
	^ self predicateBlock value: aTQNodeWrapper wrappedNode
]

{ #category : #accessing }
TQBlockPredicate >> predicateBlock [
	^ predicateBlock
]

{ #category : #accessing }
TQBlockPredicate >> predicateBlock: anObject [
	predicateBlock := anObject
]

{ #category : #printing }
TQBlockPredicate >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self predicateBlock printOn: aStream.
	aStream nextPut: $)
]
