"
Matches if my #object is equal to the wrapped object in the node provided to #matches:.
"
Class {
	#name : #TQObjectEqualityPredicate,
	#superclass : #TQAtomicPredicate,
	#instVars : [
		'object'
	],
	#category : #'TreeQuery-Deprecated'
}

{ #category : #deprecation }
TQObjectEqualityPredicate class >> isDeprecated [
	<generated>
	^ true
]

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

{ #category : #printing }
TQObjectEqualityPredicate >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	self object printOn: aStream.
	aStream nextPut: $)
]
