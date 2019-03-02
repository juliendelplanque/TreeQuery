"
I am the error raised in the context of matching a composite predicate when one of the children predicate could not be matched with the tree.
"
Class {
	#name : #TQPredicateWasNotMatched,
	#superclass : #Error,
	#instVars : [
		'predicate'
	],
	#category : #'TreeQuery-Errors'
}

{ #category : #signalling }
TQPredicateWasNotMatched class >> signalPredicate: aTQPredicate [
	^ self new
		predicate: aTQPredicate;
		signal
]

{ #category : #accessing }
TQPredicateWasNotMatched >> predicate [
	^ predicate
]

{ #category : #accessing }
TQPredicateWasNotMatched >> predicate: anObject [
	predicate := anObject
]
