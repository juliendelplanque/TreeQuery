Extension { #name : #Object }

{ #category : #'*TreeQuery' }
Object >> anyIterator: childrenBlock [
	^ TQTreeIterator any
			root: self childrenBlock: childrenBlock
]

{ #category : #'*TreeQuery' }
Object >> asTQPredicate [
	^ TQObjectEqualityPredicate object: self
]

{ #category : #'*TreeQuery' }
Object >> breadthFirstIterator: childrenBlock [
	^ TQTreeIterator breadthFirst
			root: self childrenBlock: childrenBlock
]

{ #category : #'*TreeQuery' }
Object >> depthFirstIterator: childrenBlock [
	^ TQTreeIterator depthFirst
			root: self childrenBlock: childrenBlock
]

{ #category : #'*TreeQuery' }
Object >> wrappedUsingChildrenBlock: aBlock [
	^ TQNodeWrapper wrap: self childrenBlock: aBlock
]
