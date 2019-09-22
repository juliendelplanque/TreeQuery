"
A TQMatchesAnywhereTest is a test class for testing the behavior of TQMatchesAnywhere
"
Class {
	#name : #TQMatchesAnywhereTest,
	#superclass : #TQSearchStrategyTest,
	#category : #'TreeQuery-Tests-Query'
}

{ #category : #test }
TQMatchesAnywhereTest >> testSearch [
	| query |
	query := TreeQuery anyWalk
		predicate: [ :n | n first = 2 ] asTQPredicate;
		matchAnywhere;
		yourself.
	
	self assert: (query runOn: tree childrenBlock: #allButFirst)
]

{ #category : #test }
TQMatchesAnywhereTest >> testSearch2 [
	| query |
	query := TreeQuery anyWalk
		predicate: [ :n | n first = 42 ] asTQPredicate;
		matchAnywhere;
		yourself.
	
	self deny: (query runOn: tree childrenBlock: #allButFirst)
]
