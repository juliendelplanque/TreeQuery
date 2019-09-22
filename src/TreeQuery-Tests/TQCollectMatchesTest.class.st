"
A TQCollectMatchesTest is a test class for testing the behavior of TQCollectMatches
"
Class {
	#name : #TQCollectMatchesTest,
	#superclass : #TQSearchStrategyTest,
	#category : #'TreeQuery-Tests-Query'
}

{ #category : #test }
TQCollectMatchesTest >> testSearch [
	| query |
	query := TreeQuery anyWalk
		predicate: [ :n | n first = 2 ] asTQPredicate;
		collectMatches;
		yourself.
	
	self assert: (query runOn: tree childrenBlock: #allButFirst) equals: #((2 (2)) (2))
]

{ #category : #test }
TQCollectMatchesTest >> testSearch2 [
	| query |
	query := TreeQuery anyWalk
		predicate: [ :n | n first = 42 ] asTQPredicate;
		collectMatches;
		yourself.
	
	self assert: (query runOn: tree childrenBlock: #allButFirst) equals: #()
]
