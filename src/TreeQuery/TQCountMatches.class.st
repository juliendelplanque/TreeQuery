Class {
	#name : #TQCountMatches,
	#superclass : #TQSearchStrategy,
	#category : #'TreeQuery-Query'
}

{ #category : #searching }
TQCountMatches >> search: aTQIterator [
	^ ((aTQIterator
			outputTo: [ :node | self predicate matches: node ] selectIt)
			outputTo: (0 injectItInto: [ :sum :current | sum + 1 ])) next
]
