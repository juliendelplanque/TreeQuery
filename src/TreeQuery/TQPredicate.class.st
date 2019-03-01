Class {
	#name : #TQPredicate,
	#superclass : #Object,
	#category : #'TreeQuery-Query'
}

{ #category : #extracting }
TQPredicate >> extract: aTQNodeWrapper [
	^ self subclassResponsibility
]

{ #category : #testing }
TQPredicate >> matches: aTQNodeWrapper [
	^ self subclassResponsibility
]
