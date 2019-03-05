"
A TQObjectIdentityPredicateTest is a test class for testing the behavior of TQObjectIdentityPredicate
"
Class {
	#name : #TQObjectIdentityPredicateTest,
	#superclass : #TestCase,
	#category : #'TreeQuery-Tests-Predicates'
}

{ #category : #test }
TQObjectIdentityPredicateTest >> testMatches [
	| object |
	object := Object new.
	self assert: ((TQObjectEqualityPredicate object: object) matches: (TQNodeWrapper wrap: object childrenBlock: [ :x | #() ])).
	self deny: ((TQObjectEqualityPredicate object: object) matches: (TQNodeWrapper wrap: Object new childrenBlock: [ :x | #() ])).
]
