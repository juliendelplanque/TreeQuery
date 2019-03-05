"
I am an iterator used to walk a tree depth-first.
"
Class {
	#name : #TQDepthFirstIterator,
	#superclass : #TQIterator,
	#instVars : [
		'visitStack'
	],
	#category : #'TreeQuery-Core'
}

{ #category : #example }
TQDepthFirstIterator class >> example [
	"In this example, a tree represented by lists of lists is iterated.
	 For each node (which is an array), the data is stored in first position and
	 its children are stored in positions 2 to: its size.
	 The iterator walks the tree depth first, that is to say, collecting the data
	 leads to the array in the following example:
		(TQDepthFirstIterator example collect: #first) >>> #(1 2 3 4 5 6 7 8 9)
	"
	^ TQDepthFirstIterator 
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
	self hasNext
		ifFalse: [ TQIteratorIsAtEnd signalIterator: self ].
	nextWrapped := visitStack pop.
	(childrenBlock value: nextWrapped wrappedNode) reverseDo: [ :child |
		visitStack push: (TQNodeWrapper wrap: child parent: nextWrapped) ].
	^ nextWrapped
]

{ #category : #'accessing - wrapped' }
TQDepthFirstIterator >> peekWrapped [
	self hasNext
		ifFalse: [ TQIteratorIsAtEnd signalIterator: self ].
	^ visitStack top
]

{ #category : #'accessing - wrapped' }
TQDepthFirstIterator >> peekWrappedParent [
	self hasNext
		ifFalse: [ TQIteratorIsAtEnd signalIterator: self ].
	^ visitStack top parent
]
