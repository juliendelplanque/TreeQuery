Class {
	#name : #TQPathPredicate,
	#superclass : #TQPredicate,
	#instVars : [
		'path'
	],
	#category : #'TreeQuery-Query'
}

{ #category : #'instance creation' }
TQPathPredicate class >> path: aCollectionOfTQPredicat [
	^ self new
		path: aCollectionOfTQPredicat;
		yourself
]

{ #category : #composing }
TQPathPredicate >> / aTQPredicate [
	^ self concatenateWith: aTQPredicate
]

{ #category : #composing }
TQPathPredicate >> concatenateWith: aTQAtomicPredicate [
	^ self
		path: self path , { aTQAtomicPredicate };
		yourself
]

{ #category : #testing }
TQPathPredicate >> matches: aTQNodeWrapper [
	| withoutFirst |
	(self path first matches: aTQNodeWrapper)
		ifFalse: [ ^ false ].
	self path size = 1
		ifTrue: [ ^ true ].
	withoutFirst := self withoutFirstPredicate.
	
	^ aTQNodeWrapper wrappedChildren
		anySatisfy: [ :wrappedChild | withoutFirst matches: wrappedChild ].
]

{ #category : #accessing }
TQPathPredicate >> path [
	^ path
]

{ #category : #accessing }
TQPathPredicate >> path: anObject [
	path := anObject
]

{ #category : #converting }
TQPathPredicate >> withoutFirstPredicate [
	^ self class path: self path allButFirst
]
