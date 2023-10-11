Class {
	#name : #MyDoubleLinkedListTests,
	#superclass : #TestCase,
	#instVars : [
		'myList'
	],
	#category : #MyDoubleLinkedListTests
}

{ #category : #running }
MyDoubleLinkedListTests >> setUp [
	super setUp.
	myList := MyDoubleLinkedList new.
]

{ #category : #tests }
MyDoubleLinkedListTests >> testAdd [
	| addLink |
	self assert: myList head isNil.
	self assert: myList tail isNil.
	self assert: myList headValue isNil.
	self assert: myList tailValue isNil.
	
	addLink:= myList add: 5.
	self assert: (myList getLink: 5) equals: addLink.
	
	self assert: myList tailValue equals: 5.
]

{ #category : #tests }
MyDoubleLinkedListTests >> testAddAfter [
	self assert: (myList add: 5 after: 9) isNil.
	
	myList add: 5.
	myList add: 7.
	myList add: 8.
	
	
	myList add: 4 after: 8.
	
	self assert: myList tailValue equals: 4.
	self assert: myList tail previousLink value equals: 8.
	
	self assert: (myList add: 6 after: 5) equals: ((myList getLink: 5) nextLink).
]

{ #category : #tests }
MyDoubleLinkedListTests >> testAddBefore [
	self assert: (myList add: 5 before: 9) isNil.
	
	myList add: 5.
	myList add: 7.
	myList add: 8.
	
	
	myList add: 4 before: 5.
	
	self assert: myList headValue equals: 4.
	self assert: myList head nextLink value equals: 5.
	
	self assert: (myList add: 6 before: 7) equals: ((myList getLink: 7) previousLink).
]

{ #category : #tests }
MyDoubleLinkedListTests >> testAddFirst [ 
	| addLink |
	myList addFirst: 5.
	self assert: myList headValue equals: 5.
	
	myList addFirst: 4.
	self assert: myList headValue equals: 4.
	
	addLink:= myList addFirst: 3.
	self assert: addLink equals: myList head.
]

{ #category : #tests }
MyDoubleLinkedListTests >> testAddLast [
	| addLink |
	myList addLast: 5.
	self assert: myList headValue equals: 5.
	
	myList addLast: 6.
	self assert: myList tailValue equals: 6.
	
	addLink:= myList addLast: 7.
	self assert: addLink equals: myList tail.
]

{ #category : #tests }
MyDoubleLinkedListTests >> testGetLink [
	self assert: (myList getLink: 5) isNil.
	
	myList add: 5.
	
	self assert: (myList getLink: 5) isNotNil.
	self assert: (myList getLink: 5) equals: (myList head).
]

{ #category : #tests }
MyDoubleLinkedListTests >> testGetters [
	| myLink myLinkPrevious myLinkNext |
	myLinkPrevious := MyDoubleLink new value: 5.
	myLinkNext := MyDoubleLink new value: 10.
	
	myLink := MyDoubleLink new.
	self assert: myLink nextLink isNil.
	self assert: myLink previousLink isNil.
	self assert: myLink value isNil.
	
	myLink value: 8.
	myLink previousLink: myLinkPrevious.
	myLink nextLink: myLinkNext.
	
	self assert: (myLink nextLink value) equals: myLinkNext value.
	self assert: (myLink previousLink value) equals: myLinkPrevious value.
	self assert: myLink value equals: 8.
]

{ #category : #tests }
MyDoubleLinkedListTests >> testIncludes [
	myList add: 5.
	myList add: 9.
	
	self assert: (myList includes: 5) isNotNil.
	self assert: (myList includes: 5).
	
	self assert: (myList includes: 6) isNotNil.
	self deny: (myList includes: 6).
]

{ #category : #tests }
MyDoubleLinkedListTests >> testSize [
	self assert: myList size equals: 0.
	myList add: 5.
	myList add: 2.
	
	self assert: myList size equals: 2.

	myList add: 3.
	myList add: 9.
	self assert: myList size equals: 4.
]
