Class {
	#name : #TQParentPathPredicate,
	#superclass : #TQPathPredicate,
	#category : #'TreeQuery-Query'
}

{ #category : #'instance creation' }
TQParentPathPredicate class >> childPredicate: childPredicate parentPredicate: parentPredicate [
	^ self new
		childPredicate: childPredicate;
		parentPredicate: parentPredicate;
		yourself
]

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
