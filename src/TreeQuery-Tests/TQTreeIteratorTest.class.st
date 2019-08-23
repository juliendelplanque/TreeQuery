"
A TreeIteratorTest is a test class for testing the behavior of TreeIterator
"
Class {
	#name : #TQTreeIteratorTest,
	#superclass : #TestCase,
	#instVars : [
		'tree',
		'iterator'
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

{ #category : #running }
TQTreeIteratorTest >> setUp [
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
TQTreeIteratorTest >> testAllButFirst [
	self assertCollection: (iterator allButFirst: 1) equals: (self iteratorWalk allButFirst: 1)
]

{ #category : #tests }
TQTreeIteratorTest >> testAllButFirst2 [
	self assertCollection: (iterator allButFirst: 2) equals: (self iteratorWalk allButFirst: 2)
]

{ #category : #tests }
TQTreeIteratorTest >> testAllButFirst3 [
	self assertCollection: (iterator allButFirst: 3) equals: (self iteratorWalk allButFirst: 3).
]

{ #category : #tests }
TQTreeIteratorTest >> testAllButFirst4 [
	self should: [ iterator allButFirst: self iteratorWalk size + 1 ] raise: TQIteratorIsAtEnd
]

{ #category : #tests }
TQTreeIteratorTest >> testAllButFirst5 [
	self assertCollection: (iterator allButFirst: self iteratorWalk size) equals: (self iteratorWalk allButFirst: self iteratorWalk size).
]

{ #category : #tests }
TQTreeIteratorTest >> testAllSatisfy [
	self
		assertCollection: (iterator allSatisfy: #isArray)
		equals: (self iteratorWalk allSatisfy: #isArray)
]

{ #category : #tests }
TQTreeIteratorTest >> testAnySatisfy [
	self
		assertCollection: (iterator anySatisfy: [ :n | n first = 9 ])
		equals: (self iteratorWalk anySatisfy: [ :n | n first = 9 ])
]

{ #category : #tests }
TQTreeIteratorTest >> testAtEnd [
	9 timesRepeat: [ 
		self deny: iterator atEnd.
		iterator next ].
	
	self assert: iterator atEnd
]

{ #category : #tests }
TQTreeIteratorTest >> testCollect [
	self
		assertCollection: (iterator collect: #first)
		equals: (self iteratorWalk collect: #first as: Array)
]

{ #category : #tests }
TQTreeIteratorTest >> testCollectAs [
	self
		assertCollection: (iterator collect: #first as: Array)
		equals: (self iteratorWalk collect: #first as: Array)
]

{ #category : #tests }
TQTreeIteratorTest >> testCollectAs2 [
	self
		assertCollection: (iterator collect: [ :node | node allButFirst size ] as: OrderedCollection)
		equals: (self iteratorWalk collect: [ :node | node allButFirst size ] as: OrderedCollection)
]

{ #category : #tests }
TQTreeIteratorTest >> testCount [
	self
		assertCollection: (iterator sum: [ :n | n first ])
		equals: (self iteratorWalk sum: [ :n | n first ])
]

{ #category : #tests }
TQTreeIteratorTest >> testDetect [
	self
		assert: (iterator detect: [ :array | array allButFirst size = 2 ])
		equals: (self iteratorWalk detect: [ :array | array allButFirst size = 2 ])
]

{ #category : #tests }
TQTreeIteratorTest >> testDetect2 [
	self
		should: [ iterator detect: [ :array | array allButFirst size = 10 ] ] raise: NotFound.
	self
		should: [ self iteratorWalk detect: [ :array | array allButFirst size = 10 ] ] raise: NotFound
]

{ #category : #tests }
TQTreeIteratorTest >> testDetectIfFound [
	iterator detect: [ :array | array allButFirst size = 2 ] ifFound: [ :found |
		self iteratorWalk detect: [ :array | array allButFirst size = 2 ] ifFound: [ :walkFound |
			self assert: found equals: walkFound.
			^ self ] ].
	
	self fail
]

{ #category : #tests }
TQTreeIteratorTest >> testDetectIfFoundIfNone [
	self
		assert: (iterator detect: [ :array | array allButFirst size = 2 ] ifFound: #yourself ifNone: [ self fail ])
		equals: (self iteratorWalk detect: [ :array | array allButFirst size = 2 ] ifFound: #yourself ifNone: [ self fail ])
]

{ #category : #tests }
TQTreeIteratorTest >> testDetectIfFoundIfNone2 [
	self
		assert: (iterator detect: [ :array | array allButFirst size = 42 ] ifFound: #yourself ifNone: [ 43 ])
		equals: (self iteratorWalk detect: [ :array | array allButFirst size = 42 ] ifFound: #yourself ifNone: [ 43 ])
]

{ #category : #tests }
TQTreeIteratorTest >> testDetectIfNone [
	iterator detect: [ :array | array first = 10 ] ifNone: [
		self iteratorWalk detect: [ :array | array first = 10 ] ifNone: [ 
			^ self ] ].
	
	self fail
]

{ #category : #tests }
TQTreeIteratorTest >> testDetectMax [
	self
		assert: (iterator detectMax: [ :array | array first ])
		equals: (self iteratorWalk detectMax: [ :array | array first ])
]

{ #category : #tests }
TQTreeIteratorTest >> testDetectMin [
	self
		assert: (iterator detectMin: [ :array | array first ])
		equals: (self iteratorWalk detectMin: [ :array | array first ])
]

{ #category : #tests }
TQTreeIteratorTest >> testDo [
	|i|
	i := 1.
	iterator do: [ :array |
		self assertCollection: array equals: (self iteratorWalk at: i).
		i := i + 1 ].
]

{ #category : #tests }
TQTreeIteratorTest >> testDoSeparatedBy [
	|i separationsCount|
	i := 1.
	separationsCount := 0.
	iterator do: [ :array |
		self assertCollection: array equals: (self iteratorWalk at: i).
		i := i + 1 ] separatedBy: [ separationsCount := separationsCount + 1 ].
	
	self assert: separationsCount equals: self iteratorWalk size - 1
]

{ #category : #tests }
TQTreeIteratorTest >> testHasNext [
	self iteratorWalk size timesRepeat: [ 
		self assert: iterator hasNext.
		iterator next ].
	
	self deny: iterator hasNext
]

{ #category : #tests }
TQTreeIteratorTest >> testNext [
	self iteratorWalk do: [ :array |
		self assert: iterator next first equals: array first ].
	
	self should: [ iterator next ] raise: TQIteratorIsAtEnd
]

{ #category : #tests }
TQTreeIteratorTest >> testPeek [
	self iteratorWalk do: [ :array |
		self assert: iterator peek first equals: array first.
		iterator next ].
	
	self should: [ iterator peek ] raise: TQIteratorIsAtEnd
]

{ #category : #tests }
TQTreeIteratorTest >> testPeekParent [
	self iteratorParentWalk do: [ :array |
		self assert: (iterator peekParent ifNotNil: #first) equals: (array ifNotNil: #first).
		iterator next ].
	
	self should: [ iterator peekParent ] raise: TQIteratorIsAtEnd
]

{ #category : #tests }
TQTreeIteratorTest >> testReject [
	self
		assertCollection: (iterator reject: [ :n | n first odd ])
		equals: ((self iteratorWalk reject: [ :n | n first odd ]) as: Array)
]

{ #category : #tests }
TQTreeIteratorTest >> testRejectAs [
	self
		assertCollection: (iterator reject: [ :n | n first odd ] as: Array)
		equals: ((self iteratorWalk reject: [ :n | n first odd ]) as: Array)
]

{ #category : #tests }
TQTreeIteratorTest >> testSelect [
	self
		assertCollection: (iterator select: [ :n | n first odd ])
		equals: ((self iteratorWalk select: [ :n | n first odd ]) as: Array)
]

{ #category : #tests }
TQTreeIteratorTest >> testSelectAs [
	self
		assertCollection: (iterator select: [ :n | n first odd ] as: Array)
		equals: ((self iteratorWalk select: [ :n | n first odd ]) as: Array)
]

{ #category : #tests }
TQTreeIteratorTest >> testSelectAs2 [
	self
		assertCollection: (iterator select: [ :n | n first even ] as: OrderedCollection)
		equals: ((self iteratorWalk select: [ :n | n first even ]) as: OrderedCollection)
]

{ #category : #tests }
TQTreeIteratorTest >> testSum [
	self
		assertCollection: (iterator sum: [ :n | n first ])
		equals: (self iteratorWalk sum: [ :n | n first ])
]

{ #category : #tests }
TQTreeIteratorTest >> testUpToEnd [
	self
		assertCollection: (iterator upToEnd)
		equals: (self iteratorWalk collect: #yourself as: Array)
]
