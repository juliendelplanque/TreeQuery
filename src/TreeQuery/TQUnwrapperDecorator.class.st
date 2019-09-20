"
I am a decorator that unwrap nodes of tree that have been wrapped in TQNodeWrapper.
"
Class {
	#name : #TQUnwrapperDecorator,
	#superclass : #IteratorDecorator,
	#category : #'TreeQuery-Core'
}

{ #category : #accessing }
TQUnwrapperDecorator >> next [
	^ self decoratedIterator next wrappedNode
]

{ #category : #accessing }
TQUnwrapperDecorator >> peek [
	^ self decoratedIterator peek wrappedNode
]
