"
I am an iterator used to walk a tree breadth-first.
"
Class {
	#name : #TQBreadthFirstIterator,
	#superclass : #TQTreeIterator,
	#instVars : [
		'visitQueue'
	],
	#category : #'TreeQuery-Core'
}

{ #category : #testing }
TQBreadthFirstIterator >> hasNext [
	^ visitQueue isNotEmpty
]

{ #category : #initialization }
TQBreadthFirstIterator >> initializeForRoot: anObject childrenBlock: aBlock [
	super initializeForRoot: anObject childrenBlock: aBlock.
	visitQueue := LinkedList new
						addFirst: (TQNodeWrapper wrap: anObject childrenBlock: aBlock parent: nil);
						yourself
]

{ #category : #'accessing - wrapped' }
TQBreadthFirstIterator >> next [
	| nextWrapped |
	self checkHasNext.
	nextWrapped := visitQueue removeLast.
	(childrenBlock value: nextWrapped wrappedNode) do: [ :child |
		visitQueue addFirst: (TQNodeWrapper wrap: child childrenBlock: childrenBlock parent: nextWrapped) ].
	^ nextWrapped
]

{ #category : #'accessing - wrapped' }
TQBreadthFirstIterator >> peek [
	self checkHasNext.
	^ visitQueue last
]

{ #category : #'accessing - wrapped' }
TQBreadthFirstIterator >> peekParent [
	self checkHasNext.
	^ visitQueue last parent
]
