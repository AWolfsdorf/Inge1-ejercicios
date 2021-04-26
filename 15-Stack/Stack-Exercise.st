!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 4/22/2021 17:25:26'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstObject'.
	secondPushedObject := 'secondObject'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topItem size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialize' stamp: 'AW 4/25/2021 17:18:47'!
initializeStack

	size := 0.
	topItem := OOStackItemRoot new.
	
	^self! !


!OOStack methodsFor: 'testing' stamp: 'AW 4/25/2021 17:14:32'!
isEmpty
	^topItem isRoot.! !


!OOStack methodsFor: 'accessing' stamp: 'AW 4/25/2021 18:04:43'!
pop
	| valueToReturn |
	

	valueToReturn _ topItem nodeValue.
	topItem _ topItem lowerNode.
	size := size - 1.
		
	^valueToReturn .! !

!OOStack methodsFor: 'accessing' stamp: 'AW 4/25/2021 18:04:54'!
push: anItemToPush
	

	topItem := OOStackItemNode with: anItemToPush over: topItem.
	size := size + 1.	! !

!OOStack methodsFor: 'accessing' stamp: 'AW 4/25/2021 17:18:11'!
size
	^size.! !

!OOStack methodsFor: 'accessing' stamp: 'AW 4/25/2021 17:42:54'!
top

	^topItem nodeValue .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 4/22/2021 17:22:41'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!!!!!'! !


!OOStack class methodsFor: 'initialize' stamp: 'AW 4/25/2021 16:44:11'!
new

	^super new initializeStack! !


!classDefinition: #OOStackItem category: 'Stack-Exercise'!
Object subclass: #OOStackItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackItem methodsFor: 'accessing' stamp: 'AW 4/25/2021 17:47:56'!
lowerNode

	^self subclassResponsibility.! !

!OOStackItem methodsFor: 'accessing' stamp: 'AW 4/25/2021 17:48:05'!
nodeValue

	^self subclassResponsibility.! !


!OOStackItem methodsFor: 'testing' stamp: 'AW 4/25/2021 17:47:40'!
isRoot
	
	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackItem class' category: 'Stack-Exercise'!
OOStackItem class
	instanceVariableNames: ''!

!OOStackItem class methodsFor: 'initialize' stamp: 'AW 4/25/2021 17:37:21'!
with: aValueToStore over: aStackItem 
	^OOStackItemNode new initializeWith: aValueToStore over: aStackItem ! !


!classDefinition: #OOStackItemNode category: 'Stack-Exercise'!
OOStackItem subclass: #OOStackItemNode
	instanceVariableNames: 'lowerNode nodeValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackItemNode methodsFor: 'initialization' stamp: 'AW 4/25/2021 17:46:07'!
initializeWith: aValueToStore over: aStackItem 

	nodeValue := aValueToStore.
	lowerNode := aStackItem.! !


!OOStackItemNode methodsFor: 'testing' stamp: 'AW 4/25/2021 17:35:19'!
isRoot
	^false.! !


!OOStackItemNode methodsFor: 'accessing' stamp: 'AW 4/25/2021 17:36:56'!
lowerNode

	^lowerNode.! !

!OOStackItemNode methodsFor: 'accessing' stamp: 'AW 4/25/2021 17:41:10'!
nodeValue

	^nodeValue ! !


!classDefinition: #OOStackItemRoot category: 'Stack-Exercise'!
OOStackItem subclass: #OOStackItemRoot
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackItemRoot methodsFor: 'accessing' stamp: 'AW 4/25/2021 18:05:35'!
lowerNode
	self error: OOStack stackEmptyErrorDescription.! !

!OOStackItemRoot methodsFor: 'accessing' stamp: 'AW 4/25/2021 17:43:49'!
nodeValue
	self error: OOStack stackEmptyErrorDescription.! !


!OOStackItemRoot methodsFor: 'testing' stamp: 'AW 4/25/2021 17:23:45'!
isRoot
	^true! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
