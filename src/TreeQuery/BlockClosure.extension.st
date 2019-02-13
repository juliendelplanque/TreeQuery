Extension { #name : #BlockClosure }

{ #category : #'*TreeQuery' }
BlockClosure >> asTQPredicate [
	^ TQPredicate predicateBlock: self
]
