Extension { #name : #TreeQuery }

{ #category : #'*TreeQuery-Deprecated' }
TreeQuery >> checkMatch [
	self
		deprecated: 'Use #matchAnywhere instead.'
		transformWith: '`@receiver checkMatch' -> '`@receiver matchAnywhere'.
	self matchAnywhere
]
