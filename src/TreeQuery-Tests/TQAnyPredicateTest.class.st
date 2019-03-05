"
A TQAnyPredicateTest is a test class for testing the behavior of TQAnyPredicate
"
Class {
	#name : #TQAnyPredicateTest,
	#superclass : #TestCase,
	#category : #'TreeQuery-Tests-Predicates'
}

{ #category : #tests }
TQAnyPredicateTest >> testMatches [
	self assert: (TQAnyPredicate new matches: nil).
	self assert: (TQAnyPredicate new matches: Object new).
	self assert: (TQAnyPredicate new matches: true).
	self assert: (TQAnyPredicate new matches: TQNodeWrapper new)
]
