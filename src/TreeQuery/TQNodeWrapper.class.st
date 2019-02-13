Class {
	#name : #TQNodeWrapper,
	#superclass : #Object,
	#instVars : [
		'tqNode',
		'tqChildrenBlock'
	],
	#category : #'TreeQuery-Query'
}

{ #category : #'reflective operations' }
TQNodeWrapper >> doesNotUnderstand: aMessage [
	^ self tqNode perform: aMessage selector withArguments: aMessage arguments
]

{ #category : #accessing }
TQNodeWrapper >> tqChildren [
	^ (self tqChildrenBlock value: self tqNode) collect: [ :node |
			self class new
				tqNode: node;
				tqChildrenBlock: self tqChildrenBlock;
				yourself ]
]

{ #category : #accessing }
TQNodeWrapper >> tqChildrenBlock [
	^ tqChildrenBlock
]

{ #category : #accessing }
TQNodeWrapper >> tqChildrenBlock: anObject [
	tqChildrenBlock := anObject
]

{ #category : #accessing }
TQNodeWrapper >> tqNode [
	^ tqNode
]

{ #category : #accessing }
TQNodeWrapper >> tqNode: anObject [
	tqNode := anObject
]
