Class {
	#name : #TQNodeWrapperIterator,
	#superclass : #TQIteratorDecorator,
	#category : #'TreeQuery-Core'
}

{ #category : #accessing }
TQNodeWrapperIterator >> next [
	^ TQNodeWrapper new
		wrappedNode: self decoratedIterator next;
		childrenBlock: self childrenBlock
]
