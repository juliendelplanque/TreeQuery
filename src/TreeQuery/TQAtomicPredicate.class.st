Class {
	#name : #TQAtomicPredicate,
	#superclass : #TQPredicate,
	#instVars : [
		'predicateBlock'
	],
	#category : #'TreeQuery-Query'
}

{ #category : #'instance creation' }
TQAtomicPredicate class >> predicateBlock: aBlock [
	^ self new
		predicateBlock: aBlock;
		yourself
]

{ #category : #testing }
TQAtomicPredicate >> matches: aTQNodeWrapper [
	^ self predicateBlock value: aTQNodeWrapper wrappedNode
]

{ #category : #accessing }
TQAtomicPredicate >> predicateBlock [
	^ predicateBlock
]

{ #category : #accessing }
TQAtomicPredicate >> predicateBlock: anObject [
	predicateBlock := anObject
]
