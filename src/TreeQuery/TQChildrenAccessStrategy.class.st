"
I am an abstract object that describes how to access the direct children of node from the node itself.

See my subclasses for concrete examples.

My subclasses should override #childrenFor:.

I can mimic the behaviour of a block with a single argument as I understand #value:.
"
Class {
	#name : #TQChildrenAccessStrategy,
	#superclass : #Object,
	#category : #'TreeQuery-Query'
}

{ #category : #accessing }
TQChildrenAccessStrategy >> childrenFor: anObject [
	^ self subclassResponsibility
]

{ #category : #accessing }
TQChildrenAccessStrategy >> value: anObject [
	^ self childrenFor: anObject
]
