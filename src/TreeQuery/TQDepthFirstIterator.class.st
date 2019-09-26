"
I am an iterator used to walk a tree depth-first.
"
Class {
	#name : #TQDepthFirstIterator,
	#superclass : #TQTreeIterator,
	#instVars : [
		'visitStack'
	],
	#category : #'TreeQuery-Core'
}

{ #category : #testing }
TQDepthFirstIterator >> hasNext [
	^ visitStack isNotEmpty
]

{ #category : #initialization }
TQDepthFirstIterator >> initializeForRoot: anObject childrenBlock: aBlock [
	super initializeForRoot: anObject childrenBlock: aBlock.
	visitStack := Stack new
						push: (TQNodeWrapper wrap: anObject parent: nil);
						yourself
]

{ #category : #accessing }
TQDepthFirstIterator >> next [
	| nextWrapped |
	self checkHasNext.
	nextWrapped := visitStack pop.
	
	(self pruningPredicate matches: nextWrapped)
		ifTrue: [ ^ nextWrapped ].
	
	(childrenBlock value: nextWrapped wrappedNode) reverseDo: [ :child |
		visitStack push: (TQNodeWrapper wrap: child parent: nextWrapped) ].
	^ nextWrapped
]

{ #category : #accessing }
TQDepthFirstIterator >> peek [
	self checkHasNext.
	^ visitStack top
]

{ #category : #accessing }
TQDepthFirstIterator >> peekParent [
	self checkHasNext.
	^ visitStack top parent
]
