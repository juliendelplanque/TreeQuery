"
I am an abstract iterator used to walk a tree.

My instances need to be initialized calling #initializeForRoot:childrenBlock: providing me the root of the AST and a block allowing myself to reach children of each node.


However you should use my class-side method to create new instances of myself.
"
Class {
	#name : #TQTreeIterator,
	#superclass : #Iterator,
	#instVars : [
		'childrenBlock',
		'root'
	],
	#category : #'TreeQuery-Core'
}

{ #category : #accessing }
TQTreeIterator class >> any [
	"Method to be used when the way the tree is walk does not matter.
	 When using this method one should not rely on the fact that a breadth first iterator is returned, it might change in the future.
	 This method allows to explicitely write in your code that *you do not care* about how the tree is walked."
	^ self breadthFirst
]

{ #category : #accessing }
TQTreeIterator class >> breadthFirst [
	^ TQBreadthFirstIterator
]

{ #category : #accessing }
TQTreeIterator class >> depthFirst [
	^ TQDepthFirstIterator
]

{ #category : #example }
TQTreeIterator class >> exampleBreadthFirst [
	"In this example, a tree represented by lists of lists is iterated.
	 For each node (which is an array), the data is stored in first position and
	 its children are stored in positions 2 to: its size.
	 The iterator walks the tree breadth first, that is to say, collecting the data
	 leads to the array in the following example:
		(TreeIterator exampleBreadthFirst collect: #first) >>> #(1 2 6 3 4 7 5 8 9)
	"
	^ TQTreeIterator breadthFirst 
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

{ #category : #example }
TQTreeIterator class >> exampleDepthFirst [
	"In this example, a tree represented by lists of lists is iterated.
	 For each node (which is an array), the data is stored in first position and
	 its children are stored in positions 2 to: its size.
	 The iterator walks the tree depth first, that is to say, collecting the data
	 leads to the array in the following example:
		(TreeIterator exampleDepthFirst collect: #first) >>> #(1 2 3 4 5 6 7 8 9)
	"
	^ TQTreeIterator depthFirst 
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

{ #category : #'instance creation' }
TQTreeIterator class >> root: anObject [
	^ self root: anObject childrenBlock: #children
]

{ #category : #'instance creation' }
TQTreeIterator class >> root: anObject childrenBlock: aBlock [
	^ self new
		initializeForRoot: anObject childrenBlock: aBlock;
		yourself
]

{ #category : #testing }
TQTreeIterator >> atEnd [
	^ self hasNext not
]

{ #category : #accessing }
TQTreeIterator >> childrenBlock [
	^ childrenBlock
]

{ #category : #initialization }
TQTreeIterator >> initializeForRoot: anObject childrenBlock: aBlock [
	root := anObject.
	childrenBlock := aBlock
]

{ #category : #accessing }
TQTreeIterator >> next [
	^ self subclassResponsibility
]

{ #category : #accessing }
TQTreeIterator >> peek [
	^ self subclassResponsibility
]

{ #category : #accessing }
TQTreeIterator >> peekParent [
	^ self subclassResponsibility
]
