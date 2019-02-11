"
A TQIteratorTest is a test class for testing the behavior of TQIterator
"
Class {
	#name : #TQIteratorTest,
	#superclass : #TestCase,
	#instVars : [
		'tree',
		'iterator'
	],
	#category : #'TreeQuery-Tests'
}

{ #category : #testing }
TQIteratorTest class >> isAbstract [
	^ self = TQIteratorTest
]

{ #category : #accessing }
TQIteratorTest >> iteratorWalk [
	"Returns the nodes one-by-one as encountered by the iterator during the walk."
	^ self subclassResponsibility
]

{ #category : #running }
TQIteratorTest >> setUp [
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
TQIteratorTest >> testAllSatisfy [
	self
		assertCollection: (iterator allSatisfy: #isArray)
		equals: (self iteratorWalk allSatisfy: #isArray)
]

{ #category : #tests }
TQIteratorTest >> testAnySatisfy [
	self
		assertCollection: (iterator anySatisfy: [ :n | n first = 9 ])
		equals: (self iteratorWalk anySatisfy: [ :n | n first = 9 ])
]

{ #category : #tests }
TQIteratorTest >> testAtEnd [
	9 timesRepeat: [ 
		self deny: iterator atEnd.
		iterator next ].
	
	self assert: iterator atEnd
]

{ #category : #tests }
TQIteratorTest >> testCollectAs [
	self
		assertCollection: (iterator collect: #first as: Array)
		equals: (self iteratorWalk collect: #first as: Array)
]

{ #category : #tests }
TQIteratorTest >> testCollectAs2 [
	self
		assertCollection: (iterator collect: [ :node | node allButFirst size ] as: OrderedCollection)
		equals: (self iteratorWalk collect: [ :node | node allButFirst size ] as: OrderedCollection)
]

{ #category : #tests }
TQIteratorTest >> testCount [
	self
		assertCollection: (iterator count: [ :n | n first odd ])
		equals: (self iteratorWalk count: [ :n | n first odd ])
]

{ #category : #tests }
TQIteratorTest >> testDetectIfFound [
	iterator detect: [ :array | array allButFirst size = 2 ] ifFound: [ :found |
		self iteratorWalk detect: [ :array | array allButFirst size = 2 ] ifFound: [ :walkFound |
			self assert: found equals: walkFound.
			^ self ] ].
	
	self fail
]

{ #category : #tests }
TQIteratorTest >> testDetectIfFoundIfNone [
	self
		assert: (iterator detect: [ :array | array allButFirst size = 2 ] ifFound: #yourself ifNone: [ self fail ])
		equals: (self iteratorWalk detect: [ :array | array allButFirst size = 2 ] ifFound: #yourself ifNone: [ self fail ])
]

{ #category : #tests }
TQIteratorTest >> testDetectIfFoundIfNone2 [
	self
		assert: (iterator detect: [ :array | array allButFirst size = 42 ] ifFound: #yourself ifNone: [ 43 ])
		equals: (self iteratorWalk detect: [ :array | array allButFirst size = 42 ] ifFound: #yourself ifNone: [ 43 ])
]

{ #category : #tests }
TQIteratorTest >> testHasNext [
	9 timesRepeat: [ 
		self assert: iterator hasNext.
		iterator next ].
	
	self deny: iterator hasNext
]

{ #category : #tests }
TQIteratorTest >> testSelectAs [
	self
		assertCollection: (iterator select: [ :n | n first odd ] as: Array)
		equals: ((self iteratorWalk select: [ :n | n first odd ]) as: Array)
]

{ #category : #tests }
TQIteratorTest >> testSelectAs2 [
	self
		assertCollection: (iterator select: [ :n | n first even ] as: OrderedCollection)
		equals: ((self iteratorWalk select: [ :n | n first even ]) as: OrderedCollection)
]