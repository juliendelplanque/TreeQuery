"
I am a decorator that keep nodes incoming from a TQTreeIterator as TQNodeWrapper.
"
Class {
	#name : #TQKeepWrappedNodeDecorator,
	#superclass : #IteratorDecorator,
	#category : #'TreeQuery-Core'
}

{ #category : #accessing }
TQKeepWrappedNodeDecorator >> next [
	^ self decoratedIterator nextWrapped
]

{ #category : #accessing }
TQKeepWrappedNodeDecorator >> peek [
	^ self decoratedIterator peekWrapped
]
