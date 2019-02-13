Class {
	#name : #TreeQuery,
	#superclass : #Object,
	#instVars : [
		'predicate',
		'searchStrategyClass',
		'iteratorClass'
	],
	#category : #'TreeQuery-Query'
}

{ #category : #configuring }
TreeQuery >> breadthFirst [
	self iteratorClass: TQBreadthFirstIterator
]

{ #category : #configuring }
TreeQuery >> depthFirst [
	self iteratorClass: TQDepthFirstIterator
]

{ #category : #accessing }
TreeQuery >> iteratorClass [
	^ iteratorClass
]

{ #category : #accessing }
TreeQuery >> iteratorClass: anObject [
	iteratorClass := anObject
]

{ #category : #configuring }
TreeQuery >> matchAnywhere [
	self searchStrategyClass: TQMatchesAnywhere
]

{ #category : #accessing }
TreeQuery >> predicate [
	^ predicate
]

{ #category : #accessing }
TreeQuery >> predicate: anObject [
	predicate := anObject
]

{ #category : #running }
TreeQuery >> runOn: anObject childrenBlock: aBlock [
	| iterator |
	iterator := TQNodeWrapperIterator decorate: (self iteratorClass root: anObject childrenBlock: aBlock).
	^ self searchStrategyClass new
		predicate: self predicate;
		search: iterator
]

{ #category : #accessing }
TreeQuery >> searchStrategyClass [
	^ searchStrategyClass
]

{ #category : #accessing }
TreeQuery >> searchStrategyClass: anObject [
	searchStrategyClass := anObject
]

{ #category : #configuring }
TreeQuery >> softMatch [
	self searchStrategyClass: TQMatchesAnywhere
]
