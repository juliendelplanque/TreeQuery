"
A TQBlockPredicateTest is a test class for testing the behavior of TQBlockPredicate
"
Class {
	#name : #TQBlockPredicateTest,
	#superclass : #TestCase,
	#instVars : [
		'predicate'
	],
	#category : #'TreeQuery-Tests-Predicates'
}

{ #category : #running }
TQBlockPredicateTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	predicate := TQBlockPredicate new
						predicateBlock: [ :n | n = 42 ];
						yourself
]

{ #category : #test }
TQBlockPredicateTest >> testMatches [
	self assert: (predicate matches: (TQNodeWrapper wrap: 42 childrenBlock: [ :x | #() ])).
	
	self deny: (predicate matches: (TQNodeWrapper wrap: $a childrenBlock: [ :x | #() ])).
]
