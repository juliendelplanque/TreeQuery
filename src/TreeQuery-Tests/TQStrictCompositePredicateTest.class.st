"
A TQStrictCompositePredicateTest is a test class for testing the behavior of TQStrictCompositePredicate
"
Class {
	#name : #TQStrictCompositePredicateTest,
	#superclass : #TQCompositePredicateTest,
	#category : #'TreeQuery-Tests-Query'
}

{ #category : #running }
TQStrictCompositePredicateTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	super setUp.
	compositePredicate := [ :x | x first isInteger ] asTQPredicate
		strictPredicatesForChildren:
			{[ :x | x first isString ] asTQPredicate.
			[ :x | x first isInteger ] asTQPredicate}
]

{ #category : #test }
TQStrictCompositePredicateTest >> testMatches7 [
	"Strict mode, it should matches exactly the tree, no additional node is accepted."
	self deny: (compositePredicate matches: (TQNodeWrapper wrap: #(2 (1) ('str') ($a)) childrenBlock: #allButFirst))
]
