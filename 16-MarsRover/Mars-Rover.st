!classDefinition: #MarsRoverTest category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/13/2021 22:03:17'!
test01
	| marsRover initialPosition initialDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	self assert: (marsRover isAt: initialPosition seeingTo: initialDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/13/2021 22:04:04'!
test02
	| marsRover initialPosition initialDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.

	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: ''.
	
	self assert: (marsRover isAt: initialPosition seeingTo: initialDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/13/2021 22:07:13'!
test03
	| marsRover initialPosition initialDirection expectedPosition |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.
	expectedPosition _ 0 @ 1.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'f'.
	
	self assert: (marsRover isAt: expectedPosition seeingTo: initialDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/13/2021 22:07:24'!
test04
	| marsRover initialPosition initialDirection expectedPosition |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.
	expectedPosition _ 0 @ -1.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'b'.
	
	self assert: (marsRover isAt: expectedPosition seeingTo: initialDirection).
! !


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentDirection currentPosition'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'AW 5/13/2021 21:23:36'!
initializeIn: aInitialPosition seeingTo: aDirectionSymbol 
	
	currentPosition := aInitialPosition.
	currentDirection := aDirectionSymbol.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'AW 5/13/2021 22:02:39'!
isAt: aPosition seeingTo: aDirection

	^currentPosition = aPosition and: [ currentDirection = aDirection ].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AW 5/13/2021 21:40:56'!
receivePackage: aPackage 
	(aPackage = 'f') ifTrue: [
		currentPosition := currentPosition + (0@	1).
	].

	(aPackage = 'b') ifTrue: [
		currentPosition := currentPosition + (0@	-1).
	]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars-Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'AW 5/13/2021 21:15:38'!
in: aInitialPoint seeingTo: aDirectionSymbol 


	^self new initializeIn: aInitialPoint seeingTo: aDirectionSymbol ! !
