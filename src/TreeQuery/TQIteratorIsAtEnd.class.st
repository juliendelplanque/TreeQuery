"
I am the error signaled when a TQ iterator reached the end of the tree.
"
Class {
	#name : #TQIteratorIsAtEnd,
	#superclass : #Error,
	#instVars : [
		'iterator'
	],
	#category : #TreeQuery
}

{ #category : #signalling }
TQIteratorIsAtEnd class >> signalIterator: aTQIterator [
	^ self new
		iterator: aTQIterator;
		signal
]

{ #category : #accessing }
TQIteratorIsAtEnd >> iterator [
	^ iterator
]

{ #category : #accessing }
TQIteratorIsAtEnd >> iterator: anObject [
	iterator := anObject
]
