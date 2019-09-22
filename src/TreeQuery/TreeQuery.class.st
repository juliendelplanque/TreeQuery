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
TreeQuery class >> anyWalk [
	^ self new
		anyWalk;
		yourself
]

{ #category : #configuring }
TreeQuery class >> breadthFirst [
	^ self new
		breadthFirst;
		yourself
]

{ #category : #configuring }
TreeQuery class >> depthFirst [
	^ self new
		depthFirst;
		yourself
]

{ #category : #configuring }
TreeQuery >> anyWalk [
	"To use when it is not important which walk strategy is used for the query."
	self breadthFirst
]

{ #category : #configuring }
TreeQuery >> breadthFirst [
	self iteratorClass: TQTreeIterator breadthFirst
]

{ #category : #configuring }
TreeQuery >> collectMatches [
	self searchStrategyClass: TQCollectMatches
]

{ #category : #configuring }
TreeQuery >> depthFirst [
	self iteratorClass: TQTreeIterator depthFirst
]

{ #category : #accessing }
TreeQuery >> iteratorClass [
	^ iteratorClass ifNil: [ iteratorClass := TQTreeIterator any ]
]

{ #category : #accessing }
TreeQuery >> iteratorClass: anObject [
	iteratorClass := anObject
]

{ #category : #configuring }
TreeQuery >> matchAnywhere [
	self searchStrategyClass: TQMatchesAnywhere
]

{ #category : #configuring }
TreeQuery >> matchEverywhere [
	self searchStrategyClass: TQMatchesEverywhere
]

{ #category : #configuring }
TreeQuery >> matchTree [
	self searchStrategyClass: TQMatchesTree
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
	iterator := self iteratorClass root: anObject childrenBlock: aBlock.
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
