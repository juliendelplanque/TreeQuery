Class {
	#name : #TQChildPathPredicate,
	#superclass : #TQPathPredicate,
	#category : #'TreeQuery-Predicates'
}

{ #category : #composing }
TQChildPathPredicate >> / aTQPredicate [
	^ self concatenateWith: aTQPredicate
]

{ #category : #testing }
TQChildPathPredicate >> matches: aTQNodeWrapper [
	| withoutFirst |
	(self path first matches: aTQNodeWrapper)
		ifFalse: [ ^ false ].
	self path size = 1
		ifTrue: [ ^ true ].
	withoutFirst := self withoutFirstPredicate.
	
	^ aTQNodeWrapper wrappedChildren
		anySatisfy: [ :wrappedChild | withoutFirst matches: wrappedChild ].
]

{ #category : #printing }
TQChildPathPredicate >> pathSeparatorForPrinting [
	^ $/
]
