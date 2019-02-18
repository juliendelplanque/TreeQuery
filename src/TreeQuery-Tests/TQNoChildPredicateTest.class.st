"
A TQNoChildPredicateTest is a test class for testing the behavior of TQNoChildPredicate
"
Class {
	#name : #TQNoChildPredicateTest,
	#superclass : #TestCase,
	#category : #'TreeQuery-Tests-Query'
}

{ #category : #test }
TQNoChildPredicateTest >> testMatches [
	self assert: (TQNoChildPredicate new matches: (TQNodeWrapper wrap: nil childrenBlock: [ :x | #() ])).
	
	self deny: (TQNoChildPredicate new matches: (TQNodeWrapper wrap: nil childrenBlock: [ :x | #(1 2 3) ]))
]
