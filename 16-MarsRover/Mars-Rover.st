!classDefinition: #MarsRoverTest category: 'Mars-Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:38:08'!
assertMarsRoverIn: aPosition seeingTo: aDirection receiving: aInstructionPackage endsUpAt: expectedPosition seeingTo: expectedDirection
	| marsRover |

	marsRover _ MarsRover in: aPosition seeingTo: aDirection .
	
	marsRover receivePackage: aInstructionPackage .
	
	self assert: (marsRover isAt: expectedPosition seeingTo: expectedDirection).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'nz 5/16/2021 14:51:29'!
test01
	| marsRover initialPosition initialDirection |
	
	initialPosition _ 0 @ 0.
	initialDirection _ #N.
	
	marsRover _ MarsRover in: initialPosition seeingTo: initialDirection.
	
	self assert: (marsRover isAt: initialPosition seeingTo: initialDirection).! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:48:17'!
test02

	self assertMarsRoverIn: 0 @ 0 seeingTo: #N
		receiving: '' endsUpAt: 0 @ 0 seeingTo: #N.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:48:02'!
test03

	self assertMarsRoverIn: 0 @ 0 seeingTo: #N
		receiving: 'f' endsUpAt: 0 @ 1 seeingTo: #N.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:47:43'!
test04

	self assertMarsRoverIn: 0 @ 0 seeingTo: #N
		receiving: 'b' endsUpAt: 0 @ -1 seeingTo: #N.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:47:13'!
test05
	
	self assertMarsRoverIn: 0 @ 0 seeingTo: #N
		receiving: 'l' endsUpAt: 0 @ 0 seeingTo: #W.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:46:57'!
test06

	self assertMarsRoverIn: 0 @ 0 seeingTo: #N
		receiving: 'r' endsUpAt: 0 @ 0 seeingTo: #E.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:46:34'!
test07

	self assertMarsRoverIn: 0 @ 0 seeingTo: #S
		receiving: 'r' endsUpAt: 0 @ 0 seeingTo: #W.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:46:05'!
test08
	
	self assertMarsRoverIn: 0 @ 0 seeingTo: #W
		receiving: 'r' endsUpAt: 0 @ 0 seeingTo: #N.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:45:44'!
test09
	
	self assertMarsRoverIn: 0 @ 0 seeingTo: #E
		receiving: 'r' endsUpAt: 0 @ 0 seeingTo: #S.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:45:19'!
test10
	
	self assertMarsRoverIn: 0 @ 0 seeingTo: #E
		receiving: 'l' endsUpAt: 0 @ 0 seeingTo: #N.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:44:48'!
test11
	
	self assertMarsRoverIn: 0 @ 0 seeingTo: #N
		receiving: 'ff' endsUpAt: 0 @ 2 seeingTo: #N.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:44:17'!
test12

	self assertMarsRoverIn: 0 @ 0 seeingTo: #N
		receiving: 'fff' endsUpAt: 0 @ 3 seeingTo: #N.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:43:14'!
test13
	
	self assertMarsRoverIn: 0 @ 2 seeingTo: #N
		receiving: 'bb' endsUpAt: 0 @ 0 seeingTo: #N.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:42:48'!
test14
	
	self assertMarsRoverIn: 0 @ 0 seeingTo: #N
		receiving: 'bf' endsUpAt: 0 @ 0 seeingTo: #N.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:42:27'!
test15
	
	self assertMarsRoverIn: 0 @ 0 seeingTo: #N
		receiving: 'll' endsUpAt: 0 @ 0 seeingTo: #S.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:41:55'!
test16
	
	self assertMarsRoverIn: 0 @ 0 seeingTo: #N
		receiving: 'rr' endsUpAt: 0 @ 0 seeingTo: #S.
! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:41:22'!
test17
	
	self assertMarsRoverIn: 0 @ 0 seeingTo: #N
		receiving: 'rf' endsUpAt: 1 @ 0 seeingTo: #E.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:40:59'!
test18
	
	self assertMarsRoverIn: 0 @ 0 seeingTo: #N
		receiving: 'lf' endsUpAt: -1 @ 0 seeingTo: #W.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 16:52:22'!
test19
	
	self assertMarsRoverIn: 0 @ 0 seeingTo: #W
		receiving: 'lf' endsUpAt: 0 @ -1 seeingTo: #S.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 17:00:46'!
test20
	
	self assertMarsRoverIn: 0 @ 0 seeingTo: #W
		receiving: 'lb' endsUpAt: 0 @ 1 seeingTo: #S.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 17:27:55'!
test21
	
	self assertMarsRoverIn: 0 @ 0 seeingTo: #W
		receiving: 'xb' endsUpAt: 0 @ 0 seeingTo: #W.! !

!MarsRoverTest methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 17:55:11'!
test22
	
	self assertMarsRoverIn: 0 @ 0 seeingTo: #W
		receiving: 'fxb' endsUpAt: -1 @ 0 seeingTo: #W.
		! !


!classDefinition: #MarsRover category: 'Mars-Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'currentPosition currentDirection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'AW 5/16/2021 18:02:42'!
initializeIn: aInitialPosition seeingTo: aDirectionSymbol 

	currentPosition := aInitialPosition.
	currentDirection := MarsRoverDirection for: aDirectionSymbol.! !


!MarsRover methodsFor: 'testing' stamp: 'AW 5/16/2021 18:15:57'!
isAt: aPosition seeingTo: aDirection 
	^currentPosition = aPosition and: [ currentDirection = (MarsRoverDirection for: aDirection) ].! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:24:31'!
goBackward

	^ currentPosition := currentPosition + (currentDirection getBackwardVector)! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:13:34'!
goForward
	currentPosition := currentPosition + currentDirection getForwardVector.
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 17:54:44'!
processInstruction: aInstruction onInvalidInstruction: anErrorBlock
	(aInstruction = $f) ifTrue: [
		^self goForward.
	].
	(aInstruction = $b) ifTrue: [
		^self goBackward.
	].
	(aInstruction = $l) ifTrue: [
		^self turnLeft.		
	].
	(aInstruction = $r) ifTrue: [
		^self turnRight.
	].
	
	^anErrorBlock value.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 17:52:31'!
receivePackage: aPackage 
	aPackage do: [:instruction | 
		self processInstruction: instruction
			onInvalidInstruction: [ ^nil. ]
	].
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:33:00'!
turnLeft

	currentDirection _ currentDirection directionToTheLeft.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:29:54'!
turnRight

	currentDirection _ currentDirection directionToTheRight.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars-Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'nz 5/16/2021 14:54:28'!
in: aInitialPosition seeingTo: aDirectionSymbol 

	^self new initializeIn: aInitialPosition seeingTo: aDirectionSymbol ! !


!classDefinition: #MarsRoverDirection category: 'Mars-Rover'!
Object subclass: #MarsRoverDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:23:56'!
= otherDirection

	^self class = otherDirection class.! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:36:43'!
directionToTheLeft
	
	self subclassResponsibility.! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:36:37'!
directionToTheRight
	
	self subclassResponsibility.! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:25:23'!
getBackwardVector
	
	^self getForwardVector negated.! !

!MarsRoverDirection methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:26:13'!
getForwardVector
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverDirection class' category: 'Mars-Rover'!
MarsRoverDirection class
	instanceVariableNames: ''!

!MarsRoverDirection class methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:08:40'!
for: aDirection 
	
	(aDirection = #S) ifTrue: [		^MarsRoverSouthDirection new.	].
	(aDirection = #E) ifTrue: [		^MarsRoverEastDirection new. ].
	(aDirection = #N) ifTrue: [		^MarsRoverNorthDirection new. ].
	(aDirection = #W) ifTrue: [		^MarsRoverWestDirection new.	].
	
	^self error: self invalidDirectionDescription.	! !

!MarsRoverDirection class methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:09:14'!
invalidDirectionDescription

	^'Direccion invalida, intente de nuevo por favor'.! !


!classDefinition: #MarsRoverEastDirection category: 'Mars-Rover'!
MarsRoverDirection subclass: #MarsRoverEastDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverEastDirection methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:26:37'!
getForwardVector

	^1 @ 0! !


!MarsRoverEastDirection methodsFor: '*DenotativeObject' stamp: 'AW 5/16/2021 18:35:57'!
directionToTheLeft
	^MarsRoverDirection for: #N.! !

!MarsRoverEastDirection methodsFor: '*DenotativeObject' stamp: 'AW 5/16/2021 18:35:37'!
directionToTheRight
	^MarsRoverDirection for: #S.! !


!classDefinition: #MarsRoverNorthDirection category: 'Mars-Rover'!
MarsRoverDirection subclass: #MarsRoverNorthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverNorthDirection methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:33:40'!
directionToTheLeft
	
	^MarsRoverDirection for: #W.! !

!MarsRoverNorthDirection methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:32:04'!
directionToTheRight
	^MarsRoverDirection for: #E.! !

!MarsRoverNorthDirection methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:26:48'!
getForwardVector

	^0 @ 1! !


!classDefinition: #MarsRoverSouthDirection category: 'Mars-Rover'!
MarsRoverDirection subclass: #MarsRoverSouthDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverSouthDirection methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:27:07'!
getForwardVector

	^0 @ -1! !


!MarsRoverSouthDirection methodsFor: '*DenotativeObject' stamp: 'AW 5/16/2021 18:37:15'!
directionToTheLeft
	^MarsRoverDirection for: #E.! !

!MarsRoverSouthDirection methodsFor: '*DenotativeObject' stamp: 'AW 5/16/2021 18:34:27'!
directionToTheRight
	^MarsRoverDirection for: #W.! !


!classDefinition: #MarsRoverWestDirection category: 'Mars-Rover'!
MarsRoverDirection subclass: #MarsRoverWestDirection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars-Rover'!

!MarsRoverWestDirection methodsFor: 'as yet unclassified' stamp: 'AW 5/16/2021 18:27:15'!
getForwardVector

	^-1 @ 0! !


!MarsRoverWestDirection methodsFor: 'accessing' stamp: 'AW 5/16/2021 18:34:00'!
directionToTheLeft
	^MarsRoverDirection for: #S.! !


!MarsRoverWestDirection methodsFor: '*DenotativeObject' stamp: 'AW 5/16/2021 18:34:54'!
directionToTheRight
	^MarsRoverDirection for: #N.! !
