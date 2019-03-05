"
I am an abstract iterator used to walk a tree.

My instances need to be initialized calling #initializeForRoot:childrenBlock: providing me the root of the AST and a block allowing myself to reach children of each node.


However you should use my class-side method to creat new instances of myself.
"
Class {
	#name : #TreeIterator,
	#superclass : #Object,
	#instVars : [
		'childrenBlock',
		'root'
	],
	#category : #'TreeQuery-Core'
}

{ #category : #accessing }
TreeIterator class >> any [
	"Method to be used when the way the tree is walk does not matter.
	 When using this method one should not rely on the fact that a breadth first iterator is returned, it might change in the future.
	 This method allows to explicitely write in your code that *you do not care* about how the tree is walked."
	^ self breadthFirst
]

{ #category : #accessing }
TreeIterator class >> breadthFirst [
	^ TQBreadthFirstIterator
]

{ #category : #accessing }
TreeIterator class >> depthFirst [
	^ TQDepthFirstIterator
]

{ #category : #example }
TreeIterator class >> exampleBreadthFirst [
	"In this example, a tree represented by lists of lists is iterated.
	 For each node (which is an array), the data is stored in first position and
	 its children are stored in positions 2 to: its size.
	 The iterator walks the tree breadth first, that is to say, collecting the data
	 leads to the array in the following example:
		(TreeIterator exampleBreadthFirst collect: #first) >>> #(1 2 6 3 4 7 5 8 9)
	"
	^ TreeIterator breadthFirst 
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
TreeIterator class >> exampleDepthFirst [
	"In this example, a tree represented by lists of lists is iterated.
	 For each node (which is an array), the data is stored in first position and
	 its children are stored in positions 2 to: its size.
	 The iterator walks the tree depth first, that is to say, collecting the data
	 leads to the array in the following example:
		(TreeIterator exampleDepthFirst collect: #first) >>> #(1 2 3 4 5 6 7 8 9)
	"
	^ TreeIterator depthFirst 
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
TreeIterator class >> root: anObject [
	^ self root: anObject childrenBlock: #children
]

{ #category : #'instance creation' }
TreeIterator class >> root: anObject childrenBlock: aBlock [
	^ self new
		initializeForRoot: anObject childrenBlock: aBlock;
		yourself
]

{ #category : #accessing }
TreeIterator >> allButFirst [
	"Answer an array containing all but the first element.
	 Raise an error if there are not enough elements."

	^ self allButFirst: 1
]

{ #category : #accessing }
TreeIterator >> allButFirst: n [
	"Answer an array  containing all but the first n elements.
	 Raise an error if there are not enough elements."
	n timesRepeat: [ self next ].
	^ self upToEnd
]

{ #category : #enumerating }
TreeIterator >> allSatisfy: aBlock [
	"Evaluate aBlock with the nodes of the receiver.
	If aBlock returns false for any element return false.
	Otherwise return true."

	self do: [:each | (aBlock value: each) ifFalse: [^ false]].
	^ true
]

{ #category : #enumerating }
TreeIterator >> anySatisfy: aBlock [
	"Evaluate aBlock with the nodes of the receiver.
	If aBlock returns true for any element return true.
	Otherwise return false."

	self do: [:each | (aBlock value: each) ifTrue: [^ true]].
	^ false
]

{ #category : #testing }
TreeIterator >> atEnd [
	^ self hasNext not
]

{ #category : #accessing }
TreeIterator >> childrenBlock [
	^ childrenBlock
]

{ #category : #enumerating }
TreeIterator >> collect: aBlock [
	^ self collect: aBlock as: Array
]

{ #category : #enumerating }
TreeIterator >> collect: aBlock as: aSequenceableCollection [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Collect the resulting values into an instance of aSequenceableCollection.
	Answer the new collection."

	^ aSequenceableCollection streamContents: [ :stream |
		self do: [ :each | stream nextPut: (aBlock value: each)] ].
]

{ #category : #enumerating }
TreeIterator >> count: aBlock [ 
	"Evaluate aBlock with each of the receiver's nodes as the argument.  
	Answer the number of nodes that answered true."

	| sum |
	sum := 0.
	self do: [:each | (aBlock value: each) ifTrue: [sum := sum + 1]].
	^ sum
]

{ #category : #enumerating }
TreeIterator >> detect: aBlock [
	^ self detect: aBlock ifNone: [ NotFound signalFor: aBlock ]
]

{ #category : #enumerating }
TreeIterator >> detect: aBlock ifFound: ifFoundBlock [
	self detect: aBlock ifFound: ifFoundBlock ifNone: [ "Do nothing on purpose" ]
]

{ #category : #enumerating }
TreeIterator >> detect: aBlock ifFound: ifFoundBlock ifNone: ifNoneBlock [
	"Search for the first node for which aBlock returns true.
	 If found, evaluate ifFoundBlock with the found node as arg.
	 If not found, evaluate ifNoneBlock without arg."
	self do: [ :child |
		(aBlock value: child)
			ifTrue: [ ^ ifFoundBlock cull: child ] ].
		
	^ ifNoneBlock value
]

{ #category : #enumerating }
TreeIterator >> detect: aBlock ifNone: ifNoneBlock [
	^ self detect: aBlock ifFound: [ :found | found ] ifNone: ifNoneBlock
]

{ #category : #enumerating }
TreeIterator >> detectMax: aBlock [
	"Evaluate aBlock with node of the receiver's nodes as the argument. 
	Answer the element for which aBlock evaluates to the highest magnitude.
	If collection empty, return nil."

	| maxElement maxValue |
	maxValue := nil.
	self do: [:each |
		| val |
		maxValue
			ifNotNil: [
				(val := aBlock value: each) > maxValue ifTrue: [
					maxElement := each.
					maxValue := val]]
			ifNil: ["first element"
				maxElement := each.
				maxValue := aBlock value: each ] ].
	^ maxElement
]

{ #category : #enumerating }
TreeIterator >> detectMin: aBlock [
	"Evaluate aBlock with each of the receiver's nodes as the argument. 
	Answer the element for which aBlock evaluates to the lowest number.
	If collection empty, return nil."

	| minElement minValue |
	minValue := nil.
	self do: [:each |
		| val |
		minValue
			ifNotNil: [
				(val := aBlock value: each) < minValue ifTrue: [
					minElement := each.
					minValue := val]]
			ifNil: ["first element"
				minElement := each.
				minValue := aBlock value: each ] ].
	^ minElement
]

{ #category : #enumerating }
TreeIterator >> do: aBlock [
	"Executes aBlock on all the objects returned by #next until #hasNextReturn false."
	[ self hasNext ] whileTrue: [ 
		aBlock value: self next ]
]

{ #category : #enumerating }
TreeIterator >> do: doBlock separatedBy: separatorBlock [
	"Evaluate the doBlock for all nodes in the receiver,
	and evaluate the separatorBlock between."

	| beforeFirst | 
	beforeFirst := true.
	self do:
		[:each |
		beforeFirst
			ifTrue: [beforeFirst := false]
			ifFalse: [separatorBlock value].
		doBlock value: each ]
]

{ #category : #testing }
TreeIterator >> hasNext [
	^ self subclassResponsibility
]

{ #category : #initialization }
TreeIterator >> initializeForRoot: anObject childrenBlock: aBlock [
	root := anObject.
	childrenBlock := aBlock
]

{ #category : #accessing }
TreeIterator >> next [
	^ self nextWrapped wrappedNode
]

{ #category : #'accessing - wrapped' }
TreeIterator >> nextWrapped [
	^ self subclassResponsibility
]

{ #category : #accessing }
TreeIterator >> peek [
	^ self peekWrapped wrappedNode
]

{ #category : #accessing }
TreeIterator >> peekParent [
	^ self peekWrappedParent ifNotNil: #wrappedNode
]

{ #category : #'accessing - wrapped' }
TreeIterator >> peekWrapped [
	^ self subclassResponsibility
]

{ #category : #'accessing - wrapped' }
TreeIterator >> peekWrappedParent [
	^ self subclassResponsibility
]

{ #category : #enumerating }
TreeIterator >> reject: aBlock [
	^ self reject: aBlock as: Array
]

{ #category : #enumerating }
TreeIterator >> reject: aBlock as: aSequenceableCollectionClass [
	"Selects nodes of the AST for which aBlock returns false.
	 Returns these nodes in aSequenceableCollectionClass instance."
	^ aSequenceableCollectionClass streamContents: [ :stream |
		self do: [ :child |
		(aBlock value: child)
			ifFalse: [ stream nextPut: child ] ] ]
]

{ #category : #enumerating }
TreeIterator >> select: aBlock [
	^ self select: aBlock as: Array
]

{ #category : #enumerating }
TreeIterator >> select: aBlock as: aSequenceableCollectionClass [
	"Select nodes of the AST for which aBlock returns true.
	 Returns these nodes in aSequenceableCollectionClass instance."
	^ aSequenceableCollectionClass streamContents: [ :stream |
		self do: [ :child |
		(aBlock value: child)
			ifTrue: [ stream nextPut: child ] ] ]
]

{ #category : #enumerating }
TreeIterator >> sum: aBlock [
	"Evaluate aBlock with each of the receiver's nodes as the argument. 
	Return the sum of the answers."
	| sum |
	sum := 0.
	self do: [:each | 
		sum := (aBlock value: each) + sum].  
	^ sum
]

{ #category : #accessing }
TreeIterator >> upToEnd [
	^ self collect: #yourself as: Array
]
