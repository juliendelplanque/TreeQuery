Trait {
	#name : #TQIterable,
	#category : #TreeQuery
}

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
TQIterable >> breadthFirstSelect: aBlock as: aSequenceableCollectionClass [
	^ self breadthFirstIterator select: aBlock as: aSequenceableCollectionClass
]

{ #category : #accessor }
TQIterable >> childrenSelector [
	^ self explicitRequirement
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
TQIterable >> depthFirstSelect: aBlock as: aSequenceableCollectionClass [
	^ self depthFirstIterator select: aBlock as: aSequenceableCollectionClass
]
