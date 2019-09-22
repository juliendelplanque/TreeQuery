Extension { #name : #Object }

{ #category : #'*TreeQuery' }
Object >> asTQPredicate [
	^ [ :object | object = self ] asTQPredicate
]

{ #category : #'*TreeQuery' }
Object >> asTQPredicateIdentity [
	^ [ :object | object == self ] asTQPredicate
]

{ #category : #'*TreeQuery' }
Object >> wrappedUsingChildrenBlock: aBlock [
	^ TQNodeWrapper wrap: self childrenBlock: aBlock
]
