Extension { #name : #Symbol }

{ #category : #'*TreeQuery' }
Symbol >> asTQPredicate [
	^ TQBlockPredicate predicateBlock: self
]
