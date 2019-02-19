"
I match any node of any possible tree.

I can only return true to #matches: message.
"
Class {
	#name : #TQAnyPredicate,
	#superclass : #TQAtomicPredicate,
	#category : #'TreeQuery-Query'
}

{ #category : #testing }
TQAnyPredicate >> matches: aTQNodeWrapper [
	^ true
]

{ #category : #printing }
TQAnyPredicate >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: '(*)'
]
