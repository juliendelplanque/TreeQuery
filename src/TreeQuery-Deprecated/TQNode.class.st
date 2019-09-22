Class {
	#name : #TQNode,
	#superclass : #Object,
	#instVars : [
		'data',
		'children'
	],
	#category : #'TreeQuery-Deprecated'
}

{ #category : #deprecation }
TQNode class >> isDeprecated [
	<generated>
	^ true
]

{ #category : #accessing }
TQNode >> children [
	^ children
]

{ #category : #accessing }
TQNode >> children: anObject [
	children := anObject
]

{ #category : #accessing }
TQNode >> data [
	^ data
]

{ #category : #accessing }
TQNode >> data: anObject [
	data := anObject
]

{ #category : #initialization }
TQNode >> initialize [
	super initialize.
	self children: #()
]
