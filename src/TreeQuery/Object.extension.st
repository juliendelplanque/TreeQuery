Extension { #name : #Object }

{ #category : #'*TreeQuery' }
Object >> anyIterator: childrenBlock [
	^ TreeIterator any
			root: self childrenBlock: childrenBlock
]

{ #category : #'*TreeQuery' }
Object >> asTQPredicate [
	^ TQObjectEqualityPredicate object: self
]

{ #category : #'*TreeQuery' }
Object >> breadthFirstIterator: childrenBlock [
	^ TreeIterator breadthFirst
			root: self childrenBlock: childrenBlock
]

{ #category : #'*TreeQuery' }
Object >> depthFirstIterator: childrenBlock [
	^ TreeIterator depthFirst
			root: self childrenBlock: childrenBlock
]

{ #category : #'*TreeQuery' }
Object >> wrappedUsingChildrenBlock: aBlock [
	^ TQNodeWrapper wrap: self childrenBlock: aBlock
]
