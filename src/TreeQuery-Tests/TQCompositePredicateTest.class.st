"
A TQCompositePredicateTest is a test class for testing the behavior of TQCompositePredicate
"
Class {
	#name : #TQCompositePredicateTest,
	#superclass : #TestCase,
	#instVars : [
		'compositePredicate'
	],
	#category : #'TreeQuery-Tests-Query'
}

{ #category : #running }
TQCompositePredicateTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	super setUp.
	compositePredicate := [ :x | x first isInteger ] asTQPredicate
		predicatesForChildren:
			{[ :x | x first isString ] asTQPredicate.
			[ :x | x first isInteger ] asTQPredicate}
]

{ #category : #test }
TQCompositePredicateTest >> testMatches [
	self assert: (compositePredicate matches: (TQNodeWrapper wrap: #(2 ('str') (1)) childrenBlock: #allButFirst))
]

{ #category : #test }
TQCompositePredicateTest >> testMatches2 [
	self assert: (compositePredicate matches: (TQNodeWrapper wrap: #(2 (1) ('str')) childrenBlock: #allButFirst))
]

{ #category : #test }
TQCompositePredicateTest >> testMatches3 [
	self deny: (compositePredicate matches: (TQNodeWrapper wrap: #('str' (1) (2)) childrenBlock: #allButFirst))
]

{ #category : #test }
TQCompositePredicateTest >> testMatches4 [
	self deny: (compositePredicate matches: (TQNodeWrapper wrap: #('str' (1)) childrenBlock: #allButFirst))
]

{ #category : #test }
TQCompositePredicateTest >> testMatches5 [
	self deny: (compositePredicate matches: (TQNodeWrapper wrap: #('str' (1 (2))) childrenBlock: #allButFirst))
]

{ #category : #test }
TQCompositePredicateTest >> testMatches6 [
	self deny: (compositePredicate matches: (TQNodeWrapper wrap: #(0 (1 (2))) childrenBlock: #allButFirst))
]

{ #category : #test }
TQCompositePredicateTest >> testMatches7 [
	self assert: (compositePredicate matches: (TQNodeWrapper wrap: #(2 (1) ('str') ($a)) childrenBlock: #allButFirst))
]

{ #category : #test }
TQCompositePredicateTest >> testMatchingChildrenFor [
	| matchingChildren |
	matchingChildren := (compositePredicate matchingChildrenFor: (TQNodeWrapper wrap: #(2 (1) ('str')) childrenBlock: #allButFirst)).
	
	self assert: matchingChildren first wrappedNode equals: #('str').
	self assert: matchingChildren first childrenBlock equals: #allButFirst.
	
	self assert: matchingChildren second wrappedNode equals: #(1).
	self assert: matchingChildren second childrenBlock equals: #allButFirst.
]
