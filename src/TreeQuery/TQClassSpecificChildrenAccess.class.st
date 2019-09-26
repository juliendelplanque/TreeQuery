"
I am a strategy composed of other strategies allowing to access children of objects differently depending on the class of the object.

If none of the registred strategies match, I fallback to my #defaultStrategy.
"
Class {
	#name : #TQClassSpecificChildrenAccess,
	#superclass : #TQChildrenAccessStrategy,
	#instVars : [
		'classToAccessStrategyDict',
		'defaultStrategy'
	],
	#category : #'TreeQuery-Query'
}

{ #category : #api }
TQClassSpecificChildrenAccess >> accessChildrenVia: aTQChildrenAccessStrategy for: aClass [
	"Specify that aTQChildrenAccessStrategy is used to access children of aClass instances."
	classToAccessStrategyDict at: aClass put: aTQChildrenAccessStrategy
]

{ #category : #accessing }
TQClassSpecificChildrenAccess >> childrenFor: anObject [
	^ (classToAccessStrategyDict
		at: anObject class
		ifAbsent: [ defaultStrategy ]) childrenFor: anObject
]

{ #category : #api }
TQClassSpecificChildrenAccess >> defaultChildrenBlock: aBlock [
	self defaultStrategy: (TQBlockChildrenAccess block: aBlock)
]

{ #category : #api }
TQClassSpecificChildrenAccess >> defaultStrategy: aChildrenAccessStrategy [
	defaultStrategy := aChildrenAccessStrategy
]

{ #category : #initialization }
TQClassSpecificChildrenAccess >> initialize [
	super initialize.
	classToAccessStrategyDict := Dictionary new
]

{ #category : #api }
TQClassSpecificChildrenAccess >> useChildrenBlock: aBlock for: aClass [
	self accessChildrenVia: (TQBlockChildrenAccess block: aBlock) for: aClass
]
