Class {
	#name : #TQNodeWrapper,
	#superclass : #Object,
	#instVars : [
		'tqNode',
		'tqChildrenBlock'
	],
	#category : #'TreeQuery-Query'
}

{ #category : #accessing }
TQNodeWrapper >> childrenBlock [
	^ tqChildrenBlock
]

{ #category : #accessing }
TQNodeWrapper >> childrenBlock: anObject [
	tqChildrenBlock := anObject
]

{ #category : #accessing }
TQNodeWrapper >> wrappedChildren [
	^ (self childrenBlock value: self wrappedNode) collect: [ :node |
			self class new
				wrappedNode: node;
				childrenBlock: self childrenBlock;
				yourself ]
]

{ #category : #accessing }
TQNodeWrapper >> wrappedNode [
	^ tqNode
]

{ #category : #accessing }
TQNodeWrapper >> wrappedNode: anObject [
	tqNode := anObject
]
