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
