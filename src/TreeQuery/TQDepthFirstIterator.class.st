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

{ #category : #'accessing - wrapped' }
TQDepthFirstIterator >> nextWrapped [
	| nextWrapped |
	self checkHasNext.
	nextWrapped := visitStack pop.
	(childrenBlock value: nextWrapped wrappedNode) reverseDo: [ :child |
		visitStack push: (TQNodeWrapper wrap: child parent: nextWrapped) ].
	^ nextWrapped
]

{ #category : #'accessing - wrapped' }
TQDepthFirstIterator >> peekWrapped [
	self checkHasNext.
	^ visitStack top
]

{ #category : #'accessing - wrapped' }
TQDepthFirstIterator >> peekWrappedParent [
	self checkHasNext.
	^ visitStack top parent
]
