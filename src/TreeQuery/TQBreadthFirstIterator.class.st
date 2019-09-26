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
	^ visitQueue isEmpty not
]

{ #category : #initialization }
TQBreadthFirstIterator >> initializeForRoot: anObject childrenBlock: aBlock [
	super initializeForRoot: anObject childrenBlock: aBlock.
	visitQueue := DoubleLinkedList new
						addFirst: (TQNodeWrapper wrap: anObject childrenBlock: aBlock parent: nil);
						yourself
]

{ #category : #accessing }
TQBreadthFirstIterator >> next [
	| nextWrapped |
	self checkHasNext.
	nextWrapped := visitQueue removeLast value.
	
	(self pruningPredicate matches: nextWrapped)
		ifTrue: [ ^ nextWrapped ].
	
	(childrenBlock value: nextWrapped wrappedNode) do: [ :child |
		visitQueue addFirst: (TQNodeWrapper wrap: child childrenBlock: childrenBlock parent: nextWrapped) ].
	^ nextWrapped
]

{ #category : #accessing }
TQBreadthFirstIterator >> peek [
	self checkHasNext.
	^ visitQueue last
]

{ #category : #accessing }
TQBreadthFirstIterator >> peekParent [
	self checkHasNext.
	^ visitQueue last parent
]
