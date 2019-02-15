Extension { #name : #BlockClosure }

{ #category : #'*TreeQuery' }
BlockClosure >> asTQPredicate [
	^ TQAtomicPredicate predicateBlock: self
]
