Class {
	#name : #TQParentPathPredicate,
	#superclass : #TQPathPredicate,
	#category : #'TreeQuery-Query'
}

{ #category : #testing }
TQParentPathPredicate >> matches: aTQNodeWrapper [
	| withoutFirst |
	(self path first matches: aTQNodeWrapper)
		ifFalse: [ ^ false ].
	self path size = 1
		ifTrue: [ ^ true ].
	aTQNodeWrapper hasParent
		ifFalse: [ ^ false ].
	withoutFirst := self withoutFirstPredicate.
	^ withoutFirst matches: aTQNodeWrapper parent
]
