Extension { #name : #Symbol }

{ #category : #'*TreeQuery' }
Symbol >> asTQPredicate [
	^ TQPredicate predicateBlock: self
]
