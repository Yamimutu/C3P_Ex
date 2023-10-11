"
My doubleLinkedList is a list of MyDoubleLink which each element know his previous and his next link.
"
Class {
	#name : #MyDoubleLinkedList,
	#superclass : #Object,
	#instVars : [
		'head',
		'tail'
	],
	#category : #MyDoubleLinkedList
}

{ #category : #adding }
MyDoubleLinkedList >> add: aValue [
	^ self addLast: aValue
]

{ #category : #adding }
MyDoubleLinkedList >> add: aValue after: afterValue [

	| link afterLink afterLinkNext |
	
	(self includes: afterValue) ifFalse: [^ nil].
	afterLink := self getLink: afterValue.
	
	afterLink value = tail value
		ifTrue: [ ^ self addLast: aValue ].
		
	link := MyDoubleLink value: aValue.
	afterLinkNext := afterLink nextLink.
	
	afterLink nextLink: link.
	link previousLink: afterLink.
	link nextLink: afterLinkNext.
	afterLinkNext previousLink: link.	
		
	^ link
]

{ #category : #adding }
MyDoubleLinkedList >> add: aValue before: beforeValue [

	| link beforeLink beforeLinkPrevious |
	
	(self includes: beforeValue) ifFalse: [^ nil].
	beforeLink := self getLink: beforeValue.
	
	beforeLink value = head value
		ifTrue: [ ^ self addFirst: aValue ].
		
	link := MyDoubleLink value: aValue.
	beforeLinkPrevious := beforeLink previousLink.
	
	beforeLinkPrevious nextLink: link.
	link previousLink: beforeLinkPrevious.
	link nextLink: beforeLink.
	beforeLink previousLink: link.	
		
	^ link
]

{ #category : #adding }
MyDoubleLinkedList >> addFirst: aValue [
	| link | 
	link := MyDoubleLink value: aValue.
	link nextLink: head.
	head ifNotNil: [ head previousLink: link ].
	tail ifNil: [ tail := link ].
	head := link.
	^ link
]

{ #category : #adding }
MyDoubleLinkedList >> addLast: aValue [
	| link | 
	link := MyDoubleLink value: aValue.
	link previousLink: tail.
	tail ifNotNil: [ tail nextLink: link ].
	head ifNil: [ head := link ].
	tail := link.
	^ link
]

{ #category : #accessing }
MyDoubleLinkedList >> getLink: aValue [
	| current |
	current := head.
	[ current isNil ] whileFalse: [ 
		(current value == aValue)
			ifTrue: [^ current]
			ifFalse: [current  := current nextLink]].
	^ nil
	
]

{ #category : #accessing }
MyDoubleLinkedList >> head [
	^ head
]

{ #category : #accessing }
MyDoubleLinkedList >> headValue [
	^ head value
]

{ #category : #testing }
MyDoubleLinkedList >> includes: aValue [
	| current |
	current := head.
	[ current isNil ] whileFalse: [ 
		(current value == aValue)
			ifTrue: [^ true]
			ifFalse: [current  := current nextLink]].
	^ false
	
	

]

{ #category : #accessing }
MyDoubleLinkedList >> size [
	| current size|
	size := 0.
	current := head.
	[ current isNil ] whileFalse: [ 
			size := size + 1.
			current  := current nextLink].
	^ size
	
	

]

{ #category : #accessing }
MyDoubleLinkedList >> tail [
	^ tail
]

{ #category : #accessing }
MyDoubleLinkedList >> tailValue [
	^ tail value
]
