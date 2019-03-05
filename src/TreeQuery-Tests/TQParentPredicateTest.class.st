"
A TQParentPredicateTest is a test class for testing the behavior of TQParentPredicate
"
Class {
	#name : #TQParentPredicateTest,
	#superclass : #TestCase,
	#instVars : [
		'parentPredicate'
	],
	#category : #'TreeQuery-Tests-Query'
}

{ #category : #running }
TQParentPredicateTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	parentPredicate := TQParentPredicate predicate: [ :parent | parent first odd ] asTQPredicate
]

{ #category : #test }
TQParentPredicateTest >> testMatches [
	| node |
	node := (TQNodeWrapper wrap: #(1 (2) (3)) childrenBlock: #allButFirst) wrappedChildren first.
					
	self assert: (parentPredicate matches: node)
]

{ #category : #test }
TQParentPredicateTest >> testMatches2 [
	| node |
	node := (TQNodeWrapper wrap: #(2 (2) (3)) childrenBlock: #allButFirst) wrappedChildren first.
					
	self deny: (parentPredicate matches: node)
]

{ #category : #test }
TQParentPredicateTest >> testMatches3 [
	| node |
	node := (TQNodeWrapper wrap: #(1 (2) (3)) childrenBlock: #allButFirst).
					
	self deny: (parentPredicate matches: node)
]
