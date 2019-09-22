"
A TQMatchesEverywhereTest is a test class for testing the behavior of TQMatchesEverywhere
"
Class {
	#name : #TQMatchesEverywhereTest,
	#superclass : #TQSearchStrategyTest,
	#category : #'TreeQuery-Tests-Query'
}

{ #category : #test }
TQMatchesEverywhereTest >> testSearch [
	| query |
	query := TreeQuery anyWalk
		predicate: [ :n | n size >= 1 ] asTQPredicate;
		matchEverywhere;
		yourself.
	
	self assert: (query runOn: tree childrenBlock: #allButFirst)
]

{ #category : #test }
TQMatchesEverywhereTest >> testSearch2 [
	| query |
	query := TreeQuery anyWalk
		predicate: [ :n | n first = 6 ] asTQPredicate;
		matchEverywhere;
		yourself.
	
	self deny: (query runOn: tree childrenBlock: #allButFirst)
]
