"
A TQBreadthFirstIteratorTest is a test class for testing the behavior of TQBreadthFirstIterator
"
Class {
	#name : #TQBreadthFirstIteratorTest,
	#superclass : #TQIteratorTest,
	#category : #'TreeQuery-Tests-Core'
}

{ #category : #accessing }
TQBreadthFirstIteratorTest >> iteratorWalk [
	"Returns the nodes one-by-one as encountered by the iterator during the walk."
	^ #(#(1 #(2 #(3) #(4 #(5))) #(6 #(7 #(8) #(9)))) #(2 #(3) #(4 #(5))) #(6 #(7 #(8) #(9))) #(3) #(4 #(5)) #(7 #(8) #(9)) #(5) #(8) #(9))
]

{ #category : #running }
TQBreadthFirstIteratorTest >> setUp [
	super setUp.
	iterator := TQBreadthFirstIterator root: tree childrenBlock: #allButFirst
]

{ #category : #tests }
TQBreadthFirstIteratorTest >> testNext [
	#(1 2 6 3 4 7 5 8 9) do: [ :i |
		self assert: iterator next first equals: i ].
	
	self should: [ iterator next ] raise: TQIteratorIsAtEnd
]
