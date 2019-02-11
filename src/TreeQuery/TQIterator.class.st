"
I am an abstract iterator used to walk a tree.

My instances need to be initialized calling #initializeForRoot:childrenBlock: providing me the root of the AST and a block allowing myself to reach children of each node.


However you should use my class-side method to creat new instances of myself.
"
Class {
	#name : #TQIterator,
	#superclass : #Object,
	#instVars : [
		'childrenBlock',
		'root'
	],
	#category : #TreeQuery
}

{ #category : #'instance creation' }
TQIterator class >> root: anObject [
	^ self root: anObject childrenBlock: #children
]

{ #category : #'instance creation' }
TQIterator class >> root: anObject childrenBlock: aBlock [
	^ self new
		initializeForRoot: anObject childrenBlock: aBlock;
		yourself
]

{ #category : #enumerating }
TQIterator >> allSatisfy: aBlock [
	"Evaluate aBlock with the nodes of the receiver.
	If aBlock returns false for any element return false.
	Otherwise return true."

	self do: [:each | (aBlock value: each) ifFalse: [^ false]].
	^ true
]

{ #category : #enumerating }
TQIterator >> anySatisfy: aBlock [
	"Evaluate aBlock with the nodes of the receiver.
	If aBlock returns true for any element return true.
	Otherwise return false."

	self do: [:each | (aBlock value: each) ifTrue: [^ true]].
	^ false
]

{ #category : #testing }
TQIterator >> atEnd [
	^ self hasNext not
]

{ #category : #enumerating }
TQIterator >> collect: aBlock [
	^ self collect: aBlock as: Array
]

{ #category : #enumerating }
TQIterator >> collect: aBlock as: aSequenceableCollection [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	Collect the resulting values into an instance of aSequenceableCollection.
	Answer the new collection."

	^ aSequenceableCollection streamContents: [ :stream |
		self do: [ :each | stream nextPut: (aBlock value: each)] ].
]

{ #category : #enumerating }
TQIterator >> count: aBlock [ 
	"Evaluate aBlock with each of the receiver's nodes as the argument.  
	Answer the number of nodes that answered true."

	| sum |
	sum := 0.
	self do: [:each | (aBlock value: each) ifTrue: [sum := sum + 1]].
	^ sum
]

{ #category : #enumerating }
TQIterator >> detect: aBlock [
	^ self detect: aBlock ifNone: [ NotFound signalFor: aBlock ]
]

{ #category : #enumerating }
TQIterator >> detect: aBlock ifFound: ifFoundBlock [
	self detect: aBlock ifFound: ifFoundBlock ifNone: [ "Do nothing on purpose" ]
]

{ #category : #enumerating }
TQIterator >> detect: aBlock ifFound: ifFoundBlock ifNone: ifNoneBlock [
	"Search for the first node for which aBlock returns true.
	 If found, evaluate ifFoundBlock with the found node as arg.
	 If not found, evaluate ifNoneBlock without arg."
	self do: [ :child |
		(aBlock value: child)
			ifTrue: [ ^ ifFoundBlock cull: child ] ].
		
	^ ifNoneBlock value
]

{ #category : #enumerating }
TQIterator >> detect: aBlock ifNone: ifNoneBlock [
	^ self detect: aBlock ifFound: [ :found | found ] ifNone: ifNoneBlock
]

{ #category : #enumerating }
TQIterator >> detectMax: aBlock [
	"Evaluate aBlock with node of the receiver's nodes as the argument. 
	Answer the element for which aBlock evaluates to the highest magnitude.
	If collection empty, return nil."

	| maxElement maxValue |
	maxValue := nil.
	self do: [:each |
		| val |
		maxValue
			ifNotNil: [
				(val := aBlock value: each) > maxValue ifTrue: [
					maxElement := each.
					maxValue := val]]
			ifNil: ["first element"
				maxElement := each.
				maxValue := aBlock value: each ] ].
	^ maxElement
]

{ #category : #enumerating }
TQIterator >> detectMin: aBlock [
	"Evaluate aBlock with each of the receiver's nodes as the argument. 
	Answer the element for which aBlock evaluates to the lowest number.
	If collection empty, return nil."

	| minElement minValue |
	minValue := nil.
	self do: [:each |
		| val |
		minValue
			ifNotNil: [
				(val := aBlock value: each) < minValue ifTrue: [
					minElement := each.
					minValue := val]]
			ifNil: ["first element"
				minElement := each.
				minValue := aBlock value: each ] ].
	^ minElement
]

{ #category : #enumerating }
TQIterator >> do: aBlock [
	"Executes aBlock on all the objects returned by #next until #hasNextReturn false."
	[ self hasNext ] whileTrue: [ 
		aBlock value: self next ]
]

{ #category : #enumerating }
TQIterator >> do: doBlock separatedBy: separatorBlock [
	"Evaluate the doBlock for all nodes in the receiver,
	and evaluate the separatorBlock between."

	| beforeFirst | 
	beforeFirst := true.
	self do:
		[:each |
		beforeFirst
			ifTrue: [beforeFirst := false]
			ifFalse: [separatorBlock value].
		doBlock value: each]
]

{ #category : #testing }
TQIterator >> hasNext [
	^ self subclassResponsibility
]

{ #category : #initialization }
TQIterator >> initializeForRoot: anObject childrenBlock: aBlock [
	root := anObject.
	childrenBlock := aBlock
]

{ #category : #accessing }
TQIterator >> next [
	^ self subclassResponsibility
]

{ #category : #enumerating }
TQIterator >> reject: aBlock [
	^ self reject: aBlock as: Array
]

{ #category : #enumerating }
TQIterator >> reject: aBlock as: aSequenceableCollectionClass [
	"Selects nodes of the AST for which aBlock returns false.
	 Returns these nodes in aSequenceableCollectionClass instance."
	^ aSequenceableCollectionClass streamContents: [ :stream |
		self do: [ :child |
		(aBlock value: child)
			ifFalse: [ stream nextPut: child ] ] ]
]

{ #category : #enumerating }
TQIterator >> select: aBlock [
	^ self select: aBlock as: Array
]

{ #category : #enumerating }
TQIterator >> select: aBlock as: aSequenceableCollectionClass [
	"Select nodes of the AST for which aBlock returns true.
	 Returns these nodes in aSequenceableCollectionClass instance."
	^ aSequenceableCollectionClass streamContents: [ :stream |
		self do: [ :child |
		(aBlock value: child)
			ifTrue: [ stream nextPut: child ] ] ]
]

{ #category : #enumerating }
TQIterator >> sum: aBlock [
	"Evaluate aBlock with each of the receiver's nodes as the argument. 
	Return the sum of the answers."
	| sum |
	sum := 0.
	self do: [:each | 
		sum := (aBlock value: each) + sum].  
	^ sum
]
