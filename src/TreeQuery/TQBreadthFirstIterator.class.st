"
I am an iterator used to walk a tree breadth-first.
"
Class {
	#name : #TQBreadthFirstIterator,
	#superclass : #TQIterator,
	#instVars : [
		'visitQueue'
	],
	#category : #'TreeQuery-Core'
}

{ #category : #example }
TQBreadthFirstIterator class >> example [
	"In this example, a tree represented by lists of lists is iterated.
	 For each node (which is an array), the data is stored in first position and
	 its children are stored in positions 2 to: its size.
	 The iterator walks the tree breadth first, that is to say, collecting the data
	 leads to the array in the following example:
		(TQBreadthFirstIterator example collect: #first) >>> #(1 2 6 3 4 7 5 8 9)
	"
	^ TQBreadthFirstIterator 
		root: #(1 
					(2 
						(3)
						(4
							(5)
						)
					)
					(6
						(7
							(8)
							(9)
						)
					)
				) childrenBlock: #allButFirst
]

{ #category : #testing }
TQBreadthFirstIterator >> hasNext [
	^ visitQueue isNotEmpty
]

{ #category : #initialization }
TQBreadthFirstIterator >> initializeForRoot: anObject childrenBlock: aBlock [
	super initializeForRoot: anObject childrenBlock: aBlock.
	visitQueue := LinkedList new
						addFirst: anObject;
						yourself
]

{ #category : #accessing }
TQBreadthFirstIterator >> next [
	| next |
	self hasNext
		ifFalse: [ TQIteratorIsAtEnd signalIterator: self ].
	next := visitQueue removeLast.
	(childrenBlock value: next) do: [ :child |
		visitQueue addFirst: child ].
	^ next
]
