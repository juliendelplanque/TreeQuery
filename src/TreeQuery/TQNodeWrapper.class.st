"
I wrap a node of the tree to visit.

My #wrappedNode instance variable contains the object we wrap to make it act as a tree.
My #childrenBlock instance variable contains a Block defining how to access the children of the wrapped node.
My #wrappedChildren method allows one to access the children of the node I wrap themselves wrapped.
"
Class {
	#name : #TQNodeWrapper,
	#superclass : #Object,
	#instVars : [
		'tqNode',
		'tqChildrenBlock',
		'parent'
	],
	#category : #'TreeQuery-Core'
}

{ #category : #'instance creation' }
TQNodeWrapper class >> wrap: anObject childrenBlock: aBlock [
	^ self new
		wrappedNode: anObject;
		childrenBlock: aBlock;
		yourself
]

{ #category : #'instance creation' }
TQNodeWrapper class >> wrap: anObject childrenBlock: aBlock parent: aTQNodeWrapper [
	^ self new
		wrappedNode: anObject;
		childrenBlock: aBlock;
		parent: aTQNodeWrapper;
		yourself
]

{ #category : #'instance creation' }
TQNodeWrapper class >> wrap: anObject parent: aTQNodeWrapper [
	^ self new
		wrappedNode: anObject;
		parent: aTQNodeWrapper;
		yourself
]

{ #category : #accessing }
TQNodeWrapper >> childrenBlock [
	^ tqChildrenBlock
]

{ #category : #accessing }
TQNodeWrapper >> childrenBlock: anObject [
	tqChildrenBlock := anObject
]

{ #category : #testing }
TQNodeWrapper >> hasParent [
	^ self parent isNotNil
]

{ #category : #accessing }
TQNodeWrapper >> parent [
	^ parent
]

{ #category : #accessing }
TQNodeWrapper >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
TQNodeWrapper >> wrappedChildren [
	^ (self childrenBlock value: self wrappedNode) collect: [ :node |
			self class new
				parent: self;
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
