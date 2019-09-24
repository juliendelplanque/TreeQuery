"
I am an abstract predicate to match a node.

My subclass must implement #matches: method.
"
Class {
	#name : #TQPredicate,
	#superclass : #Object,
	#category : #'TreeQuery-Predicates'
}

{ #category : #converting }
TQPredicate >> asTQPredicate [
	^ self
]

{ #category : #testing }
TQPredicate >> matches: aTQNodeWrapper [
	^ self subclassResponsibility
]
