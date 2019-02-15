"
A TQNodeWrapperTest is a test class for testing the behavior of TQNodeWrapper
"
Class {
	#name : #TQNodeWrapperTest,
	#superclass : #TestCase,
	#instVars : [
		'node',
		'nodeWrapper'
	],
	#category : #'TreeQuery-Tests-Query'
}

{ #category : #running }
TQNodeWrapperTest >> setUp [
	super setUp.
	node := #(1 
				(2 
					(2)
				)
				(4
					(5
						(6
							(3)
						)
					)
				(4)
				)
			).
	nodeWrapper := TQNodeWrapper new
							wrappedNode: node;
							childrenBlock: #allButFirst;
							yourself
]

{ #category : #tests }
TQNodeWrapperTest >> testChildrenBlock [
	self assert: nodeWrapper childrenBlock equals: #allButFirst
]

{ #category : #tests }
TQNodeWrapperTest >> testWrappedChildren [
	| wrappedChildren |
	wrappedChildren := nodeWrapper wrappedChildren.
	self assert: wrappedChildren isNotEmpty.
	wrappedChildren with: node allButFirst do: [ :wrappedChild :child |
		self assert: wrappedChild wrappedNode equals: child ]
]

{ #category : #tests }
TQNodeWrapperTest >> testWrappedNode [
	self assert: nodeWrapper wrappedNode equals: node
]
