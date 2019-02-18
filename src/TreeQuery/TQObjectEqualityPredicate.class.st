Class {
	#name : #TQObjectEqualityPredicate,
	#superclass : #TQAtomicPredicate,
	#instVars : [
		'object'
	],
	#category : #'TreeQuery-Query'
}

{ #category : #'instance creation' }
TQObjectEqualityPredicate class >> object: anObject [
	^ self new
		object: anObject;
		yourself
]

{ #category : #testing }
TQObjectEqualityPredicate >> matches: aTQNodeWrapper [
	^ aTQNodeWrapper wrappedNode = self object
]

{ #category : #accessing }
TQObjectEqualityPredicate >> object [
	^ object
]

{ #category : #accessing }
TQObjectEqualityPredicate >> object: anObject [
	object := anObject
]
