!classDefinition: #MarsRoverTest category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 14:51:29'!
test01
	| marsRover initialPosition initialDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	self assert: (marsRover isAt: initialPosition seeingTo: initialDirection).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 14:56:34'!
test02
	| marsRover initialPosition initialDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.

	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: ''.
	
	self assert: (marsRover isAt: initialPosition seeingTo: initialDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 14:58:38'!
test03
	| marsRover initialPosition initialDirection expectedPosition |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.
	expectedPosition _ 0 @ 1.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'f'.
	
	self deny: (marsRover isAt: initialPosition seeingTo: initialDirection).
	self assert: (marsRover isAt: expectedPosition seeingTo: initialDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 15:02:18'!
test04
	| marsRover initialPosition initialDirection expectedPosition |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.
	expectedPosition _ 0 @ -1.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'b'.
	
	self deny: (marsRover isAt: initialPosition seeingTo: initialDirection).
	self assert: (marsRover isAt: expectedPosition seeingTo: initialDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 15:26:49'!
test05
	| marsRover initialPosition initialDirection expectedDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.
	expectedDirection _ #W.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'l'.
	
	self deny: (marsRover isAt: initialPosition seeingTo: initialDirection).
	self assert: (marsRover isAt: initialPosition seeingTo: expectedDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 15:27:02'!
test06
	| marsRover initialPosition initialDirection expectedDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.
	expectedDirection _ #E.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'r'.
	
	self deny: (marsRover isAt: initialPosition seeingTo: initialDirection).
	self assert: (marsRover isAt: initialPosition seeingTo: expectedDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 15:27:42'!
test07
	| marsRover initialPosition initialDirection expectedDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #S.
	expectedDirection _ #W.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'r'.
	
	self deny: (marsRover isAt: initialPosition seeingTo: initialDirection).
	self assert: (marsRover isAt: initialPosition seeingTo: expectedDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 15:30:07'!
test08
	| marsRover initialPosition initialDirection expectedDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #W.
	expectedDirection _ #N.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'r'.
	
	self deny: (marsRover isAt: initialPosition seeingTo: initialDirection).
	self assert: (marsRover isAt: initialPosition seeingTo: expectedDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 15:33:21'!
test09
	| marsRover initialPosition initialDirection expectedDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #E.
	expectedDirection _ #S.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'r'.
	
	self deny: (marsRover isAt: initialPosition seeingTo: initialDirection).
	self assert: (marsRover isAt: initialPosition seeingTo: expectedDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 15:43:15'!
test10
	| marsRover initialPosition initialDirection expectedDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #E.
	expectedDirection _ #N.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'l'.
	
	self deny: (marsRover isAt: initialPosition seeingTo: initialDirection).
	self assert: (marsRover isAt: initialPosition seeingTo: expectedDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 15:54:55'!
test11
	| marsRover initialPosition initialDirection expectedPosition expectedDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.
	expectedPosition _ 0 @ 2.
	expectedDirection _ #N.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'ff'.
	
	self deny: (marsRover isAt: initialPosition seeingTo: initialDirection).
	self assert: (marsRover isAt: expectedPosition seeingTo: expectedDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 15:55:58'!
test12
	| marsRover initialPosition initialDirection expectedPosition expectedDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.
	expectedPosition _ 0 @ 3.
	expectedDirection _ #N.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'fff'.
	
	self deny: (marsRover isAt: initialPosition seeingTo: initialDirection).
	self assert: (marsRover isAt: expectedPosition seeingTo: expectedDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 16:05:29'!
test13
	| marsRover initialPosition initialDirection expectedPosition expectedDirection |
	
	initialPosition _ 0 @ 2.
	initialDirection _ #N.
	expectedPosition _ 0 @ 0.
	expectedDirection _ #N.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'bb'.
	
	self deny: (marsRover isAt: initialPosition seeingTo: initialDirection).
	self assert: (marsRover isAt: expectedPosition seeingTo: expectedDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 16:08:55'!
test14
	| marsRover initialPosition initialDirection expectedPosition expectedDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.
	expectedPosition _ 0 @ 0.
	expectedDirection _ #N.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'bf'.
	
	self assert: (marsRover isAt: expectedPosition seeingTo: expectedDirection).
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 16:10:38'!
test15
	| marsRover initialPosition initialDirection expectedPosition expectedDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.
	expectedPosition _ 0 @ 0.
	expectedDirection _ #S.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	marsRover receivePackage: 'll'.
	
	self assert: (marsRover isAt: expectedPosition seeingTo: expectedDirection).
! !


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition currentDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'nz 5/16/2021 14:55:20'!
initializeIn: aInitialPosition seeingTo: aDirectionSymbol 

	currentPosition := aInitialPosition.
	currentDirection := aDirectionSymbol.! !


!MarsRover methodsFor: 'testing' stamp: 'nz 5/16/2021 14:59:54'!
isAt: aPosition seeingTo: aDirection 
	^currentPosition = aPosition and: [ currentDirection = aDirection ].! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 15:44:46'!
directionToTheLeftOf: aDirection 
	
	(aDirection = #S) ifTrue: [		^#E.	].
	(aDirection = #E) ifTrue: [		^#N.].
	(aDirection = #N) ifTrue: [		^#W.	].
	(aDirection = #W) ifTrue: [		^#S.	].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 15:42:23'!
directionToTheRightOf: aDirection

	(aDirection = #S) ifTrue: [		^#W.	].
	(aDirection = #E) ifTrue: [		^#S.].
	(aDirection = #N) ifTrue: [		^#E.	].
	(aDirection = #W) ifTrue: [		^#N.	].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 16:06:40'!
goBackward

	^ currentPosition := currentPosition + (0@	-1)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 16:03:25'!
goForward
	
	currentPosition := currentPosition + (0@	1).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 16:11:01'!
receivePackage: aPackage 
	aPackage do: [:instruction | 
		(instruction = $f) ifTrue: [
			self goForward.
		].
		(instruction = $b) ifTrue: [
			self goBackward.
		].
	].
	(aPackage = 'l') ifTrue: [
		currentDirection := self directionToTheLeftOf: currentDirection.
	].
	(aPackage = 'll') ifTrue: [
		currentDirection := self directionToTheLeftOf: currentDirection.
		currentDirection := self directionToTheLeftOf: currentDirection.
	].
	(aPackage = 'r') ifTrue: [
		currentDirection := self directionToTheRightOf: currentDirection.
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars-Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'nz 5/16/2021 14:54:28'!
in: aInitialPosition seeingTo: aDirectionSymbol 

	^self new initializeIn: aInitialPosition seeingTo: aDirectionSymbol ! !
