Class {
	#name : #TQPredicate,
	#superclass : #TQAbstractPredicate,
	#instVars : [
		'predicateBlock'
	],
	#category : #'TreeQuery-Query'
}

{ #category : #'instance creation' }
TQPredicate class >> predicateBlock: aBlock [
	^ self new
		predicateBlock: aBlock;
		yourself
]

{ #category : #accessing }
TQPredicate >> children: aCollectionOfTQPredicates [
	^ TQCompositePredicate predicate: self children: aCollectionOfTQPredicates
]

{ #category : #testing }
TQPredicate >> matches: aNode [
	^ self predicateBlock value: aNode
]

{ #category : #accessing }
TQPredicate >> predicateBlock [
	^ predicateBlock
]

{ #category : #accessing }
TQPredicate >> predicateBlock: anObject [
	predicateBlock := anObject
]
