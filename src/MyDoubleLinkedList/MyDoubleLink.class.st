"
MyDoubleLink is an element of a DoubleLinkedList.

It contains is own value, his previous link and his next link.
"
Class {
	#name : #MyDoubleLink,
	#superclass : #Object,
	#instVars : [
		'previousLink',
		'value',
		'nextLink'
	],
	#category : #MyDoubleLinkedList
}

{ #category : #accessing }
MyDoubleLink class >> value: aValue [
	^ self new
		value: aValue;
		yourself
]

{ #category : #accessing }
MyDoubleLink >> nextLink [
	^nextLink 
]

{ #category : #accessing }
MyDoubleLink >> nextLink: aLink [
	nextLink := aLink
]

{ #category : #accessing }
MyDoubleLink >> previousLink [
	^previousLink 
]

{ #category : #accessing }
MyDoubleLink >> previousLink: aLink [
	previousLink := aLink
]

{ #category : #evaluating }
MyDoubleLink >> value [
	^ value
]

{ #category : #accessing }
MyDoubleLink >> value: aValue [
	value := aValue
]
