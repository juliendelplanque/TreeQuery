"
A TQObjectEqualityPredicateTest is a test class for testing the behavior of TQObjectEqualityPredicate
"
Class {
	#name : #TQObjectEqualityPredicateTest,
	#superclass : #TestCase,
	#category : #'TreeQuery-Tests-Predicates'
}

{ #category : #test }
TQObjectEqualityPredicateTest >> testMatches [

	self assert: (1 asTQPredicate matches: (TQNodeWrapper wrap: 1 childrenBlock: [ :x | #() ])).
	self deny: (1 asTQPredicate matches: (TQNodeWrapper wrap: 2 childrenBlock: [ :x | #() ])).
	
	self assert: ('str' asTQPredicate matches: (TQNodeWrapper wrap: 'str' childrenBlock: [ :x | #() ])).
	self deny: ('str' asTQPredicate matches: (TQNodeWrapper wrap: 'str2' childrenBlock: [ :x | #() ])).
	
	self assert: (#(1 2 3) asTQPredicate matches: (TQNodeWrapper wrap: #(1 2 3) childrenBlock: [ :x | #() ])).
	self deny: (#(1 2 3) asTQPredicate matches: (TQNodeWrapper wrap: #(1 3 2) childrenBlock: [ :x | #() ])).
]
