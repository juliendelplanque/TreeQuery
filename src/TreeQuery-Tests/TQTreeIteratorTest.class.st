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
TQTreeIteratorTest >> testNext [
	self iteratorWalk do: [ :array |
		self assert: iterator next first equals: array first ].
	
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
