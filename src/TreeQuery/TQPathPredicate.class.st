Class {
	#name : #TQPathPredicate,
	#superclass : #TQPredicate,
	#instVars : [
		'path'
	],
	#category : #'TreeQuery-Predicates'
}

{ #category : #'instance creation' }
TQPathPredicate class >> path: aCollectionOfTQPredicat [
	^ self new
		path: aCollectionOfTQPredicat;
		yourself
]

{ #category : #composing }
TQPathPredicate >> concatenateWith: aTQAtomicPredicate [
	^ self
		path: self path , { aTQAtomicPredicate };
		yourself
]

{ #category : #accessing }
TQPathPredicate >> path [
	^ path
]

{ #category : #accessing }
TQPathPredicate >> path: anObject [
	path := anObject
]

{ #category : #printing }
TQPathPredicate >> pathSeparatorForPrinting [
	^ self subclassResponsibility
]

{ #category : #printing }
TQPathPredicate >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self path
		do: [ :predicate | predicate printOn: aStream ]
		separatedBy: [ aStream nextPut: self pathSeparatorForPrinting ].
	aStream nextPut: $)
]

{ #category : #converting }
TQPathPredicate >> withoutFirstPredicate [
	^ self class path: self path allButFirst
]
