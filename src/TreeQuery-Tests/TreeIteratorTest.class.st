"
A TreeIteratorTest is a test class for testing the behavior of TreeIterator
"
Class {
	#name : #TreeIteratorTest,
	#superclass : #TestCase,
	#instVars : [
		'tree',
		'iterator'
	],
	#category : #'TreeQuery-Tests-Core'
}

{ #category : #testing }
TreeIteratorTest class >> isAbstract [
	^ self = TreeIteratorTest
]

{ #category : #accessing }
TreeIteratorTest >> iteratorParentWalk [
	"Returns the parents of nodes one-by-one as encountered by the iterator during the walk."
	^ self subclassResponsibility
]

{ #category : #accessing }
TreeIteratorTest >> iteratorWalk [
	"Returns the nodes one-by-one as encountered by the iterator during the walk."
	^ self subclassResponsibility
]

{ #category : #running }
TreeIteratorTest >> setUp [
	super setUp.
	tree := #(1 
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
TreeIteratorTest >> testAllButFirst [
	self assertCollection: (iterator allButFirst: 1) equals: (self iteratorWalk allButFirst: 1)
]

{ #category : #tests }
TreeIteratorTest >> testAllButFirst2 [
	self assertCollection: (iterator allButFirst: 2) equals: (self iteratorWalk allButFirst: 2)
]

{ #category : #tests }
TreeIteratorTest >> testAllButFirst3 [
	self assertCollection: (iterator allButFirst: 3) equals: (self iteratorWalk allButFirst: 3).
]

{ #category : #tests }
TreeIteratorTest >> testAllButFirst4 [
	self should: [ iterator allButFirst: self iteratorWalk size + 1 ] raise: TQIteratorIsAtEnd
]

{ #category : #tests }
TreeIteratorTest >> testAllButFirst5 [
	self assertCollection: (iterator allButFirst: self iteratorWalk size) equals: (self iteratorWalk allButFirst: self iteratorWalk size).
]

{ #category : #tests }
TreeIteratorTest >> testAllSatisfy [
	self
		assertCollection: (iterator allSatisfy: #isArray)
		equals: (self iteratorWalk allSatisfy: #isArray)
]

{ #category : #tests }
TreeIteratorTest >> testAnySatisfy [
	self
		assertCollection: (iterator anySatisfy: [ :n | n first = 9 ])
		equals: (self iteratorWalk anySatisfy: [ :n | n first = 9 ])
]

{ #category : #tests }
TreeIteratorTest >> testAtEnd [
	9 timesRepeat: [ 
		self deny: iterator atEnd.
		iterator next ].
	
	self assert: iterator atEnd
]

{ #category : #tests }
TreeIteratorTest >> testCollect [
	self
		assertCollection: (iterator collect: #first)
		equals: (self iteratorWalk collect: #first as: Array)
]

{ #category : #tests }
TreeIteratorTest >> testCollectAs [
	self
		assertCollection: (iterator collect: #first as: Array)
		equals: (self iteratorWalk collect: #first as: Array)
]

{ #category : #tests }
TreeIteratorTest >> testCollectAs2 [
	self
		assertCollection: (iterator collect: [ :node | node allButFirst size ] as: OrderedCollection)
		equals: (self iteratorWalk collect: [ :node | node allButFirst size ] as: OrderedCollection)
]

{ #category : #tests }
TreeIteratorTest >> testCount [
	self
		assertCollection: (iterator sum: [ :n | n first ])
		equals: (self iteratorWalk sum: [ :n | n first ])
]

{ #category : #tests }
TreeIteratorTest >> testDetect [
	self
		assert: (iterator detect: [ :array | array allButFirst size = 2 ])
		equals: (self iteratorWalk detect: [ :array | array allButFirst size = 2 ])
]

{ #category : #tests }
TreeIteratorTest >> testDetect2 [
	self
		should: [ iterator detect: [ :array | array allButFirst size = 10 ] ] raise: NotFound.
	self
		should: [ self iteratorWalk detect: [ :array | array allButFirst size = 10 ] ] raise: NotFound
]

{ #category : #tests }
TreeIteratorTest >> testDetectIfFound [
	iterator detect: [ :array | array allButFirst size = 2 ] ifFound: [ :found |
		self iteratorWalk detect: [ :array | array allButFirst size = 2 ] ifFound: [ :walkFound |
			self assert: found equals: walkFound.
			^ self ] ].
	
	self fail
]

{ #category : #tests }
TreeIteratorTest >> testDetectIfFoundIfNone [
	self
		assert: (iterator detect: [ :array | array allButFirst size = 2 ] ifFound: #yourself ifNone: [ self fail ])
		equals: (self iteratorWalk detect: [ :array | array allButFirst size = 2 ] ifFound: #yourself ifNone: [ self fail ])
]

{ #category : #tests }
TreeIteratorTest >> testDetectIfFoundIfNone2 [
	self
		assert: (iterator detect: [ :array | array allButFirst size = 42 ] ifFound: #yourself ifNone: [ 43 ])
		equals: (self iteratorWalk detect: [ :array | array allButFirst size = 42 ] ifFound: #yourself ifNone: [ 43 ])
]

{ #category : #tests }
TreeIteratorTest >> testDetectIfNone [
	iterator detect: [ :array | array first = 10 ] ifNone: [
		self iteratorWalk detect: [ :array | array first = 10 ] ifNone: [ 
			^ self ] ].
	
	self fail
]

{ #category : #tests }
TreeIteratorTest >> testDetectMax [
	self
		assert: (iterator detectMax: [ :array | array first ])
		equals: (self iteratorWalk detectMax: [ :array | array first ])
]

{ #category : #tests }
TreeIteratorTest >> testDetectMin [
	self
		assert: (iterator detectMin: [ :array | array first ])
		equals: (self iteratorWalk detectMin: [ :array | array first ])
]

{ #category : #tests }
TreeIteratorTest >> testDo [
	|i|
	i := 1.
	iterator do: [ :array |
		self assertCollection: array equals: (self iteratorWalk at: i).
		i := i + 1 ].
]

{ #category : #tests }
TreeIteratorTest >> testDoSeparatedBy [
	|i separationsCount|
	i := 1.
	separationsCount := 0.
	iterator do: [ :array |
		self assertCollection: array equals: (self iteratorWalk at: i).
		i := i + 1 ] separatedBy: [ separationsCount := separationsCount + 1 ].
	
	self assert: separationsCount equals: self iteratorWalk size - 1
]

{ #category : #tests }
TreeIteratorTest >> testHasNext [
	self iteratorWalk size timesRepeat: [ 
		self assert: iterator hasNext.
		iterator next ].
	
	self deny: iterator hasNext
]

{ #category : #tests }
TreeIteratorTest >> testNext [
	self iteratorWalk do: [ :array |
		self assert: iterator next first equals: array first ].
	
	self should: [ iterator next ] raise: TQIteratorIsAtEnd
]

{ #category : #tests }
TreeIteratorTest >> testPeek [
	self iteratorWalk do: [ :array |
		self assert: iterator peek first equals: array first.
		iterator next ].
	
	self should: [ iterator peek ] raise: TQIteratorIsAtEnd
]

{ #category : #tests }
TreeIteratorTest >> testPeekParent [
	self iteratorParentWalk do: [ :array |
		self assert: (iterator peekParent ifNotNil: #first) equals: (array ifNotNil: #first).
		iterator next ].
	
	self should: [ iterator peekParent ] raise: TQIteratorIsAtEnd
]

{ #category : #tests }
TreeIteratorTest >> testReject [
	self
		assertCollection: (iterator reject: [ :n | n first odd ])
		equals: ((self iteratorWalk reject: [ :n | n first odd ]) as: Array)
]

{ #category : #tests }
TreeIteratorTest >> testRejectAs [
	self
		assertCollection: (iterator reject: [ :n | n first odd ] as: Array)
		equals: ((self iteratorWalk reject: [ :n | n first odd ]) as: Array)
]

{ #category : #tests }
TreeIteratorTest >> testSelect [
	self
		assertCollection: (iterator select: [ :n | n first odd ])
		equals: ((self iteratorWalk select: [ :n | n first odd ]) as: Array)
]

{ #category : #tests }
TreeIteratorTest >> testSelectAs [
	self
		assertCollection: (iterator select: [ :n | n first odd ] as: Array)
		equals: ((self iteratorWalk select: [ :n | n first odd ]) as: Array)
]

{ #category : #tests }
TreeIteratorTest >> testSelectAs2 [
	self
		assertCollection: (iterator select: [ :n | n first even ] as: OrderedCollection)
		equals: ((self iteratorWalk select: [ :n | n first even ]) as: OrderedCollection)
]

{ #category : #tests }
TreeIteratorTest >> testSum [
	self
		assertCollection: (iterator sum: [ :n | n first ])
		equals: (self iteratorWalk sum: [ :n | n first ])
]

{ #category : #tests }
TreeIteratorTest >> testUpToEnd [
	self
		assertCollection: (iterator upToEnd)
		equals: (self iteratorWalk collect: #yourself as: Array)
]
