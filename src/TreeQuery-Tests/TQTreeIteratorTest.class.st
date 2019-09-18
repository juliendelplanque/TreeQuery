"
A TreeIteratorTest is a test class for testing the behavior of TreeIterator
"
Class {
	#name : #TQTreeIteratorTest,
	#superclass : #IteratorTest,
	#instVars : [
		'tree'
	],
	#category : #'TreeQuery-Tests-Core'
}

{ #category : #testing }
TQTreeIteratorTest class >> isAbstract [
	^ self = TQTreeIteratorTest
]

{ #category : #accessing }
TQTreeIteratorTest >> iteratorParentWalk [
	"Returns the parents of nodes one-by-one as encountered by the iterator during the walk."
	^ self subclassResponsibility
]

{ #category : #accessing }
TQTreeIteratorTest >> iteratorWalk [
	"Returns the nodes one-by-one as encountered by the iterator during the walk."
	^ self subclassResponsibility
]

{ #category : #accessing }
TQTreeIteratorTest >> objectToWalk [
	^ #(1 
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
				)
]

{ #category : #tests }
TQTreeIteratorTest >> testDecoratedByDuplicateRemoverIterator [
	iterator := iterator removeDuplicates.
	
	self assert: (iterator upToEnd collect: #wrappedNode) equals: self iteratorWalk asOrderedCollection removeDuplicates asArray
]

{ #category : #tests }
TQTreeIteratorTest >> testLast [
	self assert: iterator last wrappedNode equals: self iteratorWalk last.
	
	self should: [ iterator next ] raise: IteratorIsAtEnd
]

{ #category : #tests }
TQTreeIteratorTest >> testNext [
	self iteratorWalk do: [ :array |
		self assert: iterator next wrappedNode first equals: array first ].
	
	self should: [ iterator next ] raise: IteratorIsAtEnd
]

{ #category : #tests }
TQTreeIteratorTest >> testPeek [
	self iteratorWalk do: [ :array |
		self assert: iterator peek first equals: array first.
		iterator next ].
	
	self should: [ iterator peek ] raise: IteratorIsAtEnd
]

{ #category : #tests }
TQTreeIteratorTest >> testPeekParent [
	self iteratorParentWalk do: [ :array |
		self assert: (iterator peekParent ifNotNil: #first) equals: (array ifNotNil: #first).
		iterator next ].
	
	self should: [ iterator peekParent ] raise: IteratorIsAtEnd
]

{ #category : #tests }
TQTreeIteratorTest >> testUpToAs [
	self
		assertCollection: ((iterator upTo: (self iteratorWalk size / 2) rounded as: OrderedCollection) collect: #wrappedNode)
		equals: ((self iteratorWalk copyFrom: 1 to: (self iteratorWalk size / 2) rounded) as: OrderedCollection)
]

{ #category : #tests }
TQTreeIteratorTest >> testUpToEndAs [
	self
		assertCollection: ((iterator upToEndAs: OrderedCollection) collect: #wrappedNode)
		equals: (self iteratorWalk as: OrderedCollection)
]

{ #category : #tests }
TQTreeIteratorTest >> testUpToEndInto [
	| colToAdd |
	colToAdd := OrderedCollection new.
	colToAdd add: 1.
	colToAdd add: 2.
	self assert: colToAdd size equals: 2.
	
	iterator upToEndInto: colToAdd.
	
	self
		assertCollection: (colToAdd first: 2) , ((colToAdd allButFirst: 2) collect: #wrappedNode)
		equals: (({ 1 . 2 } , self iteratorWalk) as: OrderedCollection)
]

{ #category : #tests }
TQTreeIteratorTest >> testUpToInto [
	| colToAdd |
	colToAdd := OrderedCollection new.
	colToAdd add: 1.
	colToAdd add: 2.
	self assert: colToAdd size equals: 2.
	
	iterator upTo: (self iteratorWalk size / 2) rounded into: colToAdd.
	
	self
		assertCollection: (colToAdd first: 2) ,( (colToAdd allButFirst: 2) collect: #wrappedNode)
		equals: (({ 1 . 2 } , (self iteratorWalk copyFrom: 1 to: (self iteratorWalk size / 2) rounded)) as: OrderedCollection)
]
