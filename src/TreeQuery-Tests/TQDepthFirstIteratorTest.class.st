"
A TQDepthFirstIteratorTest is a test class for testing the behavior of TQDepthFirstIterator
"
Class {
	#name : #TQDepthFirstIteratorTest,
	#superclass : #TQIteratorTest,
	#category : #'TreeQuery-Tests-Core'
}

{ #category : #accessing }
TQDepthFirstIteratorTest >> iteratorWalk [
	"Returns the nodes one-by-one as encountered by the iterator during the walk."
	^ #(#(1 #(2 #(3) #(4 #(5))) #(6 #(7 #(8) #(9)))) #(2 #(3) #(4 #(5))) #(3) #(4 #(5)) #(5) #(6 #(7 #(8) #(9))) #(7 #(8) #(9)) #(8) #(9))
]

{ #category : #running }
TQDepthFirstIteratorTest >> setUp [
	super setUp.
	iterator := TQDepthFirstIterator root: tree childrenBlock: #allButFirst
]
