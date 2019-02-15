Class {
	#name : #TQSearchStrategy,
	#superclass : #Object,
	#instVars : [
		'predicate'
	],
	#category : #'TreeQuery-Query'
}

{ #category : #accessing }
TQSearchStrategy >> predicate [
	^ predicate
]

{ #category : #accessing }
TQSearchStrategy >> predicate: anObject [
	predicate := anObject
]

{ #category : #searching }
TQSearchStrategy >> search: aTQIterator [
	^ self subclassResponsibility
]
