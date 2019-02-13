Class {
	#name : #TQNodeWrapperIterator,
	#superclass : #TQIteratorDecorator,
	#category : #'TreeQuery-Core'
}

{ #category : #accessing }
TQNodeWrapperIterator >> next [
	^ TQNodeWrapper new
		tqNode: self decoratedIterator next;
		tqChildrenBlock: self childrenBlock
]
