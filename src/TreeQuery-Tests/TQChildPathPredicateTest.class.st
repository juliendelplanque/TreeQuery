"
A TQChildPathPredicateTest is a test class for testing the behavior of TQChildPathPredicate
"
Class {
	#name : #TQChildPathPredicateTest,
	#superclass : #TQPathPredicateTest,
	#category : #'TreeQuery-Tests-Query'
}

{ #category : #running }
TQChildPathPredicateTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	pathPredicate := TQChildPathPredicate path: { [ :array | array first isInteger ] asTQPredicate . [ :array | array first isString ] asTQPredicate }
]

{ #category : #test }
TQChildPathPredicateTest >> testMatches [
	| treeWrapped |
	treeWrapped := TQNodeWrapper wrap: #(1 #('str')) childrenBlock: #allButFirst.
	
	self assert: (pathPredicate matches: treeWrapped).
]

{ #category : #test }
TQChildPathPredicateTest >> testMatches2 [
	| treeWrapped |
	treeWrapped := TQNodeWrapper wrap: #(1 #(2)) childrenBlock: #allButFirst.
	
	self deny: (pathPredicate matches: treeWrapped).
]

{ #category : #test }
TQChildPathPredicateTest >> testMatches3 [
	| treeWrapped |
	treeWrapped := TQNodeWrapper wrap: #(1 #('str' (2))) childrenBlock: #allButFirst.
	
	self assert: (pathPredicate matches: treeWrapped).
]

{ #category : #test }
TQChildPathPredicateTest >> testMatches4 [
	| treeWrapped |
	treeWrapped := TQNodeWrapper wrap: #(1 (2) ('str') (3)) childrenBlock: #allButFirst.
	
	self assert: (pathPredicate matches: treeWrapped).
]

{ #category : #test }
TQChildPathPredicateTest >> testMatches5 [
	| treeWrapped |
	treeWrapped := TQNodeWrapper wrap: #(1) childrenBlock: #allButFirst.
	
	self deny: (pathPredicate matches: treeWrapped).
]
