"
A TQParentPathPredicateTest is a test class for testing the behavior of TQParentPathPredicate
"
Class {
	#name : #TQParentPathPredicateTest,
	#superclass : #TQPathPredicateTest,
	#instVars : [
		'parentPredicate'
	],
	#category : #'TreeQuery-Tests-Query'
}

{ #category : #running }
TQParentPathPredicateTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	parentPredicate := TQParentPathPredicate path: { TQAnyPredicate new . [ :parent | parent first odd ] asTQPredicate }
]

{ #category : #test }
TQParentPathPredicateTest >> testMatches [
	| node |
	node := (TQNodeWrapper wrap: #(1 (2) (3)) childrenBlock: #allButFirst) wrappedChildren first.
					
	self assert: (parentPredicate matches: node)
]

{ #category : #test }
TQParentPathPredicateTest >> testMatches2 [
	| node |
	node := (TQNodeWrapper wrap: #(2 (2) (3)) childrenBlock: #allButFirst) wrappedChildren first.
					
	self deny: (parentPredicate matches: node)
]

{ #category : #test }
TQParentPathPredicateTest >> testMatches3 [
	| node |
	node := (TQNodeWrapper wrap: #(1 (2) (3)) childrenBlock: #allButFirst).
					
	self deny: (parentPredicate matches: node)
]
