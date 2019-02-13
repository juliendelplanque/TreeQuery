Class {
	#name : #TQIteratorDecorator,
	#superclass : #TQIterator,
	#instVars : [
		'decoratedIterator'
	],
	#category : #'TreeQuery-Core'
}

{ #category : #'instance creation' }
TQIteratorDecorator class >> decorate: aTQIterator [
	^ self new
		decoratedIterator: aTQIterator;
		yourself
]

{ #category : #accessing }
TQIteratorDecorator >> childrenBlock [
	^ self decoratedIterator childrenBlock
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

{ #category : #accessing }
TQIteratorDecorator >> next [
	^ self decoratedIterator next
]
