Trait {
	#name : #TQIterable,
	#category : #TreeQuery
}

{ #category : #accessor }
TQIterable >> anyIterator [
	"Returns an iterator for which we do not know the walking strategy.
	 It should be used to implement methods that do not care about the order in which the tree is walked."
	^ self breadthFirstIterator
]

{ #category : #'enumerating - breadth first' }
TQIterable >> breadthFirstAllSatisfy: aBlock [
	^ self breadthFirstIterator allSatisfy: aBlock
]

{ #category : #'enumerating - breadth first' }
TQIterable >> breadthFirstAnySatisfy: aBlock [
	^ self breadthFirstIterator anySatisfy: aBlock
]

{ #category : #'enumerating - breadth first' }
TQIterable >> breadthFirstCollect: aBlock [
	^ self breadthFirstIterator collect: aBlock
]

{ #category : #'enumerating - breadth first' }
TQIterable >> breadthFirstCollect: aBlock as: aSequenceableCollection [
	^ self breadthFirstIterator collect: aBlock as: aSequenceableCollection
]

{ #category : #'enumerating - breadth first' }
TQIterable >> breadthFirstDetect: aBlock ifFound: ifFoundBlock [
	^ self breadthFirstIterator detect: aBlock ifFound: ifFoundBlock
]

{ #category : #'enumerating - breadth first' }
TQIterable >> breadthFirstDetect: aBlock ifFound: ifFoundBlock ifNone: ifNoneBlock [
	^ self breadthFirstIterator detect: aBlock ifFound: ifFoundBlock ifNone: ifNoneBlock
]

{ #category : #'enumerating - breadth first' }
TQIterable >> breadthFirstDetect: aBlock ifNone: ifNoneBlock [
	^ self breadthFirstIterator detect: aBlock ifNone: ifNoneBlock
]

{ #category : #'enumerating - breadth first' }
TQIterable >> breadthFirstDo: aBlock [
	^ self breadthFirstIterator do: aBlock
]

{ #category : #accessor }
TQIterable >> breadthFirstIterator [
	^ TQBreadthFirstIterator root: self childrenBlock: self childrenSelector
]

{ #category : #'enumerating - breadth first' }
TQIterable >> breadthFirstReject: aBlock [
	^ self breadthFirstIterator reject: aBlock
]

{ #category : #'enumerating - breadth first' }
TQIterable >> breadthFirstReject: aBlock as: aSequenceableCollectionClass [
	^ self breadthFirstIterator reject: aBlock as: aSequenceableCollectionClass
]

{ #category : #'enumerating - breadth first' }
TQIterable >> breadthFirstSelect: aBlock [
	^ self breadthFirstIterator select: aBlock
]

{ #category : #'enumerating - breadth first' }
TQIterable >> breadthFirstSelect: aBlock as: aSequenceableCollectionClass [
	^ self breadthFirstIterator select: aBlock as: aSequenceableCollectionClass
]

{ #category : #accessor }
TQIterable >> childrenSelector [
	^ self explicitRequirement
]

{ #category : #'enumerating - others' }
TQIterable >> count: aBlock [
	^ self anyIterator count: aBlock
]

{ #category : #'enumerating - depth first' }
TQIterable >> depthFirstAllSatisfy: aBlock [
	^ self depthFirstIterator allSatisfy: aBlock
]

{ #category : #'enumerating - depth first' }
TQIterable >> depthFirstAnySatisfy: aBlock [
	^ self depthFirstIterator anySatisfy: aBlock
]

{ #category : #'enumerating - depth first' }
TQIterable >> depthFirstCollect: aBlock [
	^ self depthFirstIterator collect: aBlock
]

{ #category : #'enumerating - depth first' }
TQIterable >> depthFirstCollect: aBlock as: aSequenceableCollection [
	^ self depthFirstIterator collect: aBlock as: aSequenceableCollection
]

{ #category : #'enumerating - depth first' }
TQIterable >> depthFirstDetect: aBlock ifFound: ifFoundBlock [
	^ self depthFirstIterator detect: aBlock ifFound: ifFoundBlock
]

{ #category : #'enumerating - depth first' }
TQIterable >> depthFirstDetect: aBlock ifFound: ifFoundBlock ifNone: ifNoneBlock [
	^ self depthFirstIterator detect: aBlock ifFound: ifFoundBlock ifNone: ifNoneBlock
]

{ #category : #'enumerating - depth first' }
TQIterable >> depthFirstDetect: aBlock ifNone: ifNoneBlock [
	^ self depthFirstIterator detect: aBlock ifNone: ifNoneBlock
]

{ #category : #'enumerating - depth first' }
TQIterable >> depthFirstDo: aBlock [
	^ self depthFirstIterator do: aBlock
]

{ #category : #accessor }
TQIterable >> depthFirstIterator [
	^ TQDepthFirstIterator root: self childrenBlock: self childrenSelector
]

{ #category : #'enumerating - depth first' }
TQIterable >> depthFirstReject: aBlock [
	^ self depthFirstIterator reject: aBlock
]

{ #category : #'enumerating - depth first' }
TQIterable >> depthFirstReject: aBlock as: aSequenceableCollectionClass [
	^ self depthFirstIterator reject: aBlock as: aSequenceableCollectionClass
]

{ #category : #'enumerating - depth first' }
TQIterable >> depthFirstSelect: aBlock [
	^ self depthFirstIterator select: aBlock
]

{ #category : #'enumerating - depth first' }
TQIterable >> depthFirstSelect: aBlock as: aSequenceableCollectionClass [
	^ self depthFirstIterator select: aBlock as: aSequenceableCollectionClass
]

{ #category : #'enumerating - others' }
TQIterable >> detectMax: aBlock [
	^ self anyIterator detectMax: aBlock
]

{ #category : #'enumerating - others' }
TQIterable >> detectMin: aBlock [
	^ self anyIterator detectMin: aBlock
]

{ #category : #'enumerating - others' }
TQIterable >> sum: aBlock [
	^ self anyIterator sum: aBlock
]
