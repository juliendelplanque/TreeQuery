"
I implement the decorator design pattern for iterators.
"
Class {
	#name : #TQIteratorDecorator,
	#superclass : #TQIterator,
	#instVars : [
		'decoratedIterator'
	],
	#category : #'TreeQuery-Core'
}

{ #category : #'instance creation' }
TQIteratorDecorator class >> decoratedIterator: aTQIterator [
	^ self new
		decoratedIterator: aTQIterator;
		yourself
]

{ #category : #accessing }
TQIteratorDecorator >> decoratedIterator [
	^ decoratedIterator
]

{ #category : #accessing }
TQIteratorDecorator >> decoratedIterator: anObject [
	decoratedIterator := anObject
]

{ #category : #testing }
TQIteratorDecorator >> hasNext [
	^ self decoratedIterator hasNext
]

{ #category : #'accessing - wrapped' }
TQIteratorDecorator >> nextWrapped [
	^ self decoratedIterator nextWrapped
]

{ #category : #'accessing - wrapped' }
TQIteratorDecorator >> peekWrapped [
	^ self decoratedIterator peekWrapped
]

{ #category : #'accessing - wrapped' }
TQIteratorDecorator >> peekWrappedParent [
	^ self decoratedIterator peekWrappedParent
]
