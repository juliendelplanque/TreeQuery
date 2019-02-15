Class {
	#name : #TQPredicate,
	#superclass : #Object,
	#category : #'TreeQuery-Query'
}

{ #category : #testing }
TQPredicate >> matches: aTQNodeWrapper [
	^ self subclassResponsibility
]
