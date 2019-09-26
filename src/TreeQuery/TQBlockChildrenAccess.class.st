"
I access the children of a node by evaluating my #block with the node as argument.
"
Class {
	#name : #TQBlockChildrenAccess,
	#superclass : #TQChildrenAccessStrategy,
	#instVars : [
		'block'
	],
	#category : #'TreeQuery-Query'
}

{ #category : #'instance creation' }
TQBlockChildrenAccess class >> block: block [
	^ self new
		block: block;
		yourself
]

{ #category : #accessing }
TQBlockChildrenAccess >> block [
	^ block
]

{ #category : #accessing }
TQBlockChildrenAccess >> block: anObject [
	block := anObject
]

{ #category : #accessing }
TQBlockChildrenAccess >> childrenFor: anObject [
	^ self block value: anObject
]
