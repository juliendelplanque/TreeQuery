"
A TQPathPredicateTest is a test class for testing the behavior of TQPathPredicate
"
Class {
	#name : #TQPathPredicateTest,
	#superclass : #TestCase,
	#instVars : [
		'pathPredicate'
	],
	#category : #'TreeQuery-Tests-Query'
}

{ #category : #running }
TQPathPredicateTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	pathPredicate := TQPathPredicate path: { [ :array | array first isInteger ] asTQPredicate . [ :array | array first isString ] asTQPredicate }
]

{ #category : #test }
TQPathPredicateTest >> testConcatenateWith [
	| newPredicate |
	newPredicate := [ :x | x = 3 ] asTQPredicate.
	self assert: pathPredicate path size equals: 2.
	pathPredicate concatenateWith: newPredicate.
	self assert: pathPredicate path size equals: 3.
	self assert: pathPredicate path last equals: newPredicate
]

{ #category : #test }
TQPathPredicateTest >> testMatches [
	| treeWrapped |
	treeWrapped := TQNodeWrapper wrap: #(1 #('str')) childrenBlock: #allButFirst.
	
	self assert: (pathPredicate matches: treeWrapped).
]

{ #category : #test }
TQPathPredicateTest >> testMatches2 [
	| treeWrapped |
	treeWrapped := TQNodeWrapper wrap: #(1 #(2)) childrenBlock: #allButFirst.
	
	self deny: (pathPredicate matches: treeWrapped).
]

{ #category : #test }
TQPathPredicateTest >> testMatches3 [
	| treeWrapped |
	treeWrapped := TQNodeWrapper wrap: #(1 #('str' (2))) childrenBlock: #allButFirst.
	
	self assert: (pathPredicate matches: treeWrapped).
]

{ #category : #test }
TQPathPredicateTest >> testMatches4 [
	| treeWrapped |
	treeWrapped := TQNodeWrapper wrap: #(1 (2) ('str') (3)) childrenBlock: #allButFirst.
	
	self assert: (pathPredicate matches: treeWrapped).
]

{ #category : #test }
TQPathPredicateTest >> testMatches5 [
	| treeWrapped |
	treeWrapped := TQNodeWrapper wrap: #(1) childrenBlock: #allButFirst.
	
	self deny: (pathPredicate matches: treeWrapped).
]

{ #category : #test }
TQPathPredicateTest >> testWithoutFirstPredicate [
	| secondPredicate withoutFirst |
	self assert: pathPredicate path size equals: 2.
	secondPredicate := pathPredicate path second.
	withoutFirst := pathPredicate withoutFirstPredicate.
	self assert: withoutFirst path size equals: 1.
	self assert: withoutFirst path first equals: secondPredicate.
]
