"
A TQObjectEqualityPredicateTest is a test class for testing the behavior of TQObjectEqualityPredicate
"
Class {
	#name : #TQObjectEqualityPredicateTest,
	#superclass : #TestCase,
	#category : #'TreeQuery-Tests-Query'
}

{ #category : #test }
TQObjectEqualityPredicateTest >> testMatches [

	self assert: ((TQObjectEqualityPredicate object: 1) matches: (TQNodeWrapper wrap: 1 childrenBlock: [ :x | #() ])).
	self deny: ((TQObjectEqualityPredicate object: 1) matches: (TQNodeWrapper wrap: 2 childrenBlock: [ :x | #() ])).
	
	self assert: ((TQObjectEqualityPredicate object: 'str') matches: (TQNodeWrapper wrap: 'str' childrenBlock: [ :x | #() ])).
	self deny: ((TQObjectEqualityPredicate object: 'str') matches: (TQNodeWrapper wrap: 'str2' childrenBlock: [ :x | #() ])).
	
	self assert: ((TQObjectEqualityPredicate object: #(1 2 3)) matches: (TQNodeWrapper wrap: #(1 2 3) childrenBlock: [ :x | #() ])).
	self deny: ((TQObjectEqualityPredicate object: #(1 2 3)) matches: (TQNodeWrapper wrap: #(1 3 2) childrenBlock: [ :x | #() ])).
]
