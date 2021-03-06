"
A TQBreadthFirstIteratorTest is a test class for testing the behavior of TQBreadthFirstIterator
"
Class {
	#name : #TQBreadthFirstIteratorTest,
	#superclass : #TQTreeIteratorTest,
	#category : #'TreeQuery-Tests-Core'
}

{ #category : #'iterator creation' }
TQBreadthFirstIteratorTest >> createIteratorOn: anObject [
	^ TQBreadthFirstIterator root: anObject childrenBlock: #allButFirst.
]

{ #category : #accessing }
TQBreadthFirstIteratorTest >> iteratorParentWalk [
	"Returns the nodes one-by-one as encountered by the iterator during the walk."
	^ #(nil #(1 #(2 #(3) #(4 #(5))) #(6 #(7 #(8) #(9)))) #(1 #(2 #(3) #(4 #(5))) #(6 #(7 #(8) #(9)))) #(2 #(3) #(4 #(5))) #(2 #(3) #(4 #(5))) #(6 #(7 #(8) #(9))) #(4 #(5)) #(7 #(8) #(9)) #(7 #(8) #(9)))
]

{ #category : #accessing }
TQBreadthFirstIteratorTest >> iteratorWalk [
	"Returns the nodes one-by-one as encountered by the iterator during the walk."
	^ #(#(1 #(2 #(3) #(4 #(5))) #(6 #(7 #(8) #(9)))) #(2 #(3) #(4 #(5))) #(6 #(7 #(8) #(9))) #(3) #(4 #(5)) #(7 #(8) #(9)) #(5) #(8) #(9))
]
