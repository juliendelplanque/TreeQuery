Extension { #name : #Symbol }

{ #category : #'*TreeQuery' }
Symbol >> asTQPredicate [
	^ TQAtomicPredicate predicateBlock: self
]
