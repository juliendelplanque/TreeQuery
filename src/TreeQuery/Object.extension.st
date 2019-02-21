Extension { #name : #Object }

{ #category : #'*TreeQuery' }
Object >> asTQPredicate [
	^ TQObjectEqualityPredicate object: self
]

{ #category : #'*TreeQuery' }
Object >> wrappedUsingChildrenBlock: aBlock [
	^ TQNodeWrapper wrap: self childrenBlock: aBlock
]
