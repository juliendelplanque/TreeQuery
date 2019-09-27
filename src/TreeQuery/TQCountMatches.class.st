Class {
	#name : #TQCountMatches,
	#superclass : #TQSearchStrategy,
	#category : #'TreeQuery-Query'
}

{ #category : #searching }
TQCountMatches >> search: aTQIterator [
	^ (TQCollectMatches new search: aTQIterator)
		outputTo: (0 injectItInto: [ :sum :current | sum + 1 ])
]
