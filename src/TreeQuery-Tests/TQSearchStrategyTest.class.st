"
A TQSearchStrategyTest is a test class for testing the behavior of TQSearchStrategy
"
Class {
	#name : #TQSearchStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'tree'
	],
	#category : #'TreeQuery-Tests-Query'
}

{ #category : #testing }
TQSearchStrategyTest class >> isAbstract [
	^ self = TQSearchStrategy
]

{ #category : #running }
TQSearchStrategyTest >> setUp [
	tree := #(1 
		(2 
			(2)
		)
		(4
			(5
				(6
					(3)
				)
			)
			(4)
		)
	).
]
