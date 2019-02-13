Class {
	#name : #TQAbstractPredicate,
	#superclass : #Object,
	#category : #'TreeQuery-Query'
}

{ #category : #testing }
TQAbstractPredicate >> matches: aNode [
	^ self subclassResponsibility
]
