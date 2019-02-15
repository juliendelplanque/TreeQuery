Extension { #name : #BlockClosure }

{ #category : #'*TreeQuery' }
BlockClosure >> asTQPredicate [
	^ TQBlockPredicate predicateBlock: self
]
