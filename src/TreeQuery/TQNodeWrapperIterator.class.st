"
I override #next, #peek and #peekParent in order to allow to manipulate wrapped nodes instead of directly the nodes of the tree manipulated.
"
Class {
	#name : #TQNodeWrapperIterator,
	#superclass : #TQIteratorDecorator,
	#category : #'TreeQuery-Core'
}

{ #category : #accessing }
TQNodeWrapperIterator >> next [
	^ self nextWrapped
]

{ #category : #accessing }
TQNodeWrapperIterator >> peek [
	^ self peekWrapped
]

{ #category : #accessing }
TQNodeWrapperIterator >> peekParent [
	^ self peekWrappedParent
]
