Extension { #name : #Object }

{ #category : #'*TreeQuery' }
Object >> asTQPredicate [
	^ TQObjectEqualityPredicate object: self
]
