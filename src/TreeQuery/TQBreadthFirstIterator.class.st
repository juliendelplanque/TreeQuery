"
I am an iterator used to walk a tree breadth-first.
"
Class {
	#name : #TQBreadthFirstIterator,
	#superclass : #TreeIterator,
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
						addFirst: (TQNodeWrapper wrap: anObject parent: nil);
						yourself
]

{ #category : #'accessing - wrapped' }
TQBreadthFirstIterator >> nextWrapped [
	| nextWrapped |
	self hasNext
		ifFalse: [ TQIteratorIsAtEnd signalIterator: self ].
	nextWrapped := visitQueue removeLast.
	(childrenBlock value: nextWrapped wrappedNode) do: [ :child |
		visitQueue addFirst: (TQNodeWrapper wrap: child parent: nextWrapped) ].
	^ nextWrapped
]

{ #category : #'accessing - wrapped' }
TQBreadthFirstIterator >> peekWrapped [
	self hasNext
		ifFalse: [ TQIteratorIsAtEnd signalIterator: self ].
	^ visitQueue last
]

{ #category : #'accessing - wrapped' }
TQBreadthFirstIterator >> peekWrappedParent [
	self hasNext
		ifFalse: [ TQIteratorIsAtEnd signalIterator: self ].
	^ visitQueue last parent
]
