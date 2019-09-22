"
A TQMatchesTreeTest is a test class for testing the behavior of TQMatchesTree
"
Class {
	#name : #TQMatchesTreeTest,
	#superclass : #TQSearchStrategyTest,
	#category : #'TreeQuery-Tests-Query'
}

{ #category : #test }
TQMatchesTreeTest >> testSearch [
	| query |
	query := TreeQuery anyWalk
		predicate: [ :n | n first = 1 ] asTQPredicate;
		matchTree;
		yourself.
	
	self assert: (query runOn: tree childrenBlock: #allButFirst)
]
