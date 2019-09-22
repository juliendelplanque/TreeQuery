"
Matches if my #object is identical (i.e I use #==) to the wrapped object in the node provided to #matches:.
"
Class {
	#name : #TQObjectIdentityPredicate,
	#superclass : #TQObjectEqualityPredicate,
	#category : #'TreeQuery-Deprecated'
}

{ #category : #deprecation }
TQObjectIdentityPredicate class >> isDeprecated [
	<generated>
	^ true
]

{ #category : #testing }
TQObjectIdentityPredicate >> matches: aTQNodeWrapper [
	^ aTQNodeWrapper wrappedNode == self object
]
