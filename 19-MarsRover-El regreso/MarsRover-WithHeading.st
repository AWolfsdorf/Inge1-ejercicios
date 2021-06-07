!classDefinition: #MarsRoverLogTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverLogTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:48:31'!
test01
	
	| marsRover log |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	log := MarsRoverLog new.
	marsRover addObserver: log. 
	
	marsRover process: 'f'.
		
	self assert: 1 equals: log lines size. 
	self assert: 'Moved to 1@3' equals: log lines first.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:48:31'!
test02
	
	| marsRover window |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	window := MarsRoverWindow new.
	marsRover addObserver: window. 
	
	marsRover process: 'f'.
	
	self assert: 1@3 equals: window position. 
	self assert: #North equals: window heading. ! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:48:31'!
test03
	
	| marsRover log |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	log := MarsRoverLog new.
	marsRover addObserver: log. 
	
	marsRover process: 'r'.
	
	self assert: 1 equals: log lines size. 
	self assert: 'Rotated to face East' equals: log lines first.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:48:31'!
test04
	
	| marsRover window |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	window := MarsRoverWindow new.
	marsRover addObserver: window. 
	
	marsRover process: 'r'.
	
	self assert: 1@2 equals: window position. 
	self assert: #East equals: window heading. ! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:48:31'!
test05
	
	| marsRover log |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	log := MarsRoverLog new.
	marsRover addObserver: log. 
	
	marsRover process: 'b'.
	
	self assert: 1 equals: log lines size. 
	self assert: 'Moved to 1@1' equals: log lines first.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:48:31'!
test06
	
	| marsRover window |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	window := MarsRoverWindow new.
	marsRover addObserver: window. 
	
	marsRover process: 'b'.
	
	self assert: 1@1 equals: window position. 
	self assert: #North equals: window heading. ! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:48:31'!
test07
	
	| marsRover log |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	log := MarsRoverLog new.
	marsRover addObserver: log. 
	
	marsRover process: 'l'.
	
	self assert: 1 equals: log lines size. 
	self assert: 'Rotated to face West' equals: log lines first.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:48:31'!
test08
	
	| marsRover window |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	window := MarsRoverWindow new.
	marsRover addObserver: window. 
	
	marsRover process: 'l'.
	
	self assert: 1@2 equals: window position. 
	self assert: #West equals: window heading. ! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:48:31'!
test09
	
	| marsRover log |
	
	marsRover := MarsRover at: 2@3 heading: #South.
	log := MarsRoverLog new.
	marsRover addObserver: log. 
	
	marsRover process: 'f'.
	
	self assert: 1 equals: log lines size. 
	self assert: 'Moved to 2@2' equals: log lines first.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:48:31'!
test10
	
	| marsRover log |
	
	marsRover := MarsRover at: 2@3 heading: #South.
	log := MarsRoverLog new.
	marsRover addObserver: log. 
	
	marsRover process: 'r'.
	
	self assert: 1 equals: log lines size. 
	self assert: 'Rotated to face West' equals: log lines first.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:48:31'!
test11
	
	| marsRover log |
	
	marsRover := MarsRover at: 1@1 heading: #North.
	log := MarsRoverLog new.
	marsRover addObserver: log. 
	
	marsRover process: 'ff'.
	
	self assert: 2 equals: log lines size. 
	self assert: 'Moved to 1@2' equals: log lines first.
	self assert: 'Moved to 1@3' equals: log lines second.! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:48:31'!
test12
	
	| marsRover window |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	window := MarsRoverWindow new.
	marsRover addObserver: window. 
	
	marsRover process: 'ff'.
	
	self assert: 1@4 equals: window position. 
	self assert: #North equals: window heading. ! !

!MarsRoverLogTest methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:48:31'!
test13
	
	| marsRover log |
	
	marsRover := MarsRover at: 1@1 heading: #North.
	log := MarsRoverLog new.
	marsRover addObserver: log. 
	
	marsRover process: 'rr'.
	
	self assert: 2 equals: log lines size. 
	self assert: 'Rotated to face East' equals: log lines first.
	self assert: 'Rotated to face South' equals: log lines second.! !


!classDefinition: #MarsRoverTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:26'!
test01

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: ''.
	
	self assert: (marsRover isAt: 1@2 heading: #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:31'!
test02

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 1@3 heading: #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:34'!
test03

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'b'.
	
	self assert: (marsRover isAt: 1@1 heading: #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:38'!
test04

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'r'.
	
	self assert: (marsRover isAt: 1@2 heading: #East)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:45'!
test05

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 1@2 heading: #West)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:50'!
test06

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: #North) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:54'!
test07

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #North.
	
	marsRover process: 'ff'.
	
	self assert: (marsRover isAt: 1@4 heading: #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:23:59'!
test08

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'f'.
	
	self assert: (marsRover isAt: 2@2 heading: #East)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:24:06'!
test09

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'b'.
	
	self assert: (marsRover isAt: 0@2 heading: #East)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:24:12'!
test10

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'r'.
	
	self assert: (marsRover isAt: 1@2 heading: #South)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:24:20'!
test11

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #East.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 1@2 heading: #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:24:25'!
test12

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #South.
	
	marsRover process: 'ffbr'.
	
	self assert: (marsRover isAt: 1@1 heading: #West)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:24:29'!
test13

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #South.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 1@2 heading: #East)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:24:33'!
test14

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #West.
	
	marsRover process: 'ffbr'.
	
	self assert: (marsRover isAt: 0@2 heading: #North)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/1/2018 14:24:37'!
test15

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: #West.
	
	marsRover process: 'l'.
	
	self assert: (marsRover isAt: 1@2 heading: #South)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 7/2/2018 16:27:43'!
test16

	self 
		should: [MarsRover at: 1@2 heading: #X ]
		raise: Error
		withExceptionDo: [:anError |
			self assert: MarsRover invalidCardinalPointErrorDescription equals: anError messageText ]! !


!classDefinition: #MarsRover category: 'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'AW 6/6/2021 21:43:22'!
initializeAt: aPosition heading: aHeading

	position := aPosition.
	head := aHeading.
	observers := OrderedCollection new.! !


!MarsRover methodsFor: 'heading' stamp: 'AW 6/6/2021 21:44:15'!
headEast
	
	head := MarsRoverHeadingEast new.
	observers do: [ :observer | observer changeHeading: #East. ]! !

!MarsRover methodsFor: 'heading' stamp: 'AW 6/6/2021 21:45:00'!
headNorth
	
	head := MarsRoverHeadingNorth new.
	observers do: [ :observer | observer changeHeading: #North ].! !

!MarsRover methodsFor: 'heading' stamp: 'AW 6/6/2021 21:45:15'!
headSouth
	
	head := MarsRoverHeadingSouth new.
	observers do: [ :observer | observer changeHeading: #South ].! !

!MarsRover methodsFor: 'heading' stamp: 'AW 6/6/2021 21:45:25'!
headWest
	
	head := MarsRoverHeadingWest new.
	observers do: [ :observer | observer changeHeading: #West ].! !

!MarsRover methodsFor: 'heading' stamp: 'AW 6/6/2021 21:08:21'!
rotateLeft
	
	head rotateLeft: self.! !

!MarsRover methodsFor: 'heading' stamp: 'AW 6/6/2021 21:08:15'!
rotateRight
	
	head rotateRight: self.! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 8/22/2019 12:00:30'!
isAt: aPosition heading: aCardinalPoint

	^position = aPosition and: [ head isHeading: aCardinalPoint ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'AW 6/6/2021 21:45:45'!
moveBackward
	
	head moveBackward: self.
	observers do: [ :observer | observer changePosition: position ].! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:15:01'!
moveEast
	
	position := position + (1@0)! !

!MarsRover methodsFor: 'moving' stamp: 'AW 6/6/2021 21:45:59'!
moveForward
	
	head moveForward: self.
	observers do: [ :observer | observer changePosition: position ].	! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:13:12'!
moveNorth
	
	position := position + (0@1)! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:13:34'!
moveSouth
	
	position := position + (0@-1)! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:15:32'!
moveWest
	
	position := position + (-1@0)! !


!MarsRover methodsFor: 'command processing' stamp: 'AW 6/6/2021 21:02:35'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | 
		self processCommand: aCommand.
	].
! !

!MarsRover methodsFor: 'command processing' stamp: 'nz 6/3/2021 21:24:57'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^self moveForward. ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'log' stamp: 'AW 6/6/2021 21:48:31'!
addObserver: aObserver 
	observers add: aObserver! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 8/22/2019 12:01:48'!
at: aPosition heading: aCardinalPoint
	
	^self new initializeAt: aPosition heading: (MarsRoverHeading heading: aCardinalPoint)! !

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 7/2/2018 16:26:14'!
invalidCardinalPointErrorDescription
	
	^'Invalid cardinal point'! !


!classDefinition: #MarsRoverHeading category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:06:17'!
rotateLeft: aMarsRover

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:08:23'!
rotateRight: aMarsRover

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 7/2/2018 19:07:42'!
isHeading: aCardinalPoint

	^self class isFor: aCardinalPoint! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:05:20'!
moveBackward: aMarsRover

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:05:54'!
moveForward: aMarsRover

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: 'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'cardinal point' stamp: 'HAW 7/2/2018 19:07:01'!
cardinalPoint

	self subclassResponsibility ! !


!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 8/22/2019 12:02:00'!
heading: aCardinalPoint

	^self subclasses 
		detect: [ :aMarsRoverPositionClass | aMarsRoverPositionClass isFor: aCardinalPoint ]
		ifFound: [ :aMarsRoverPositionClass | aMarsRoverPositionClass new ]
		ifNone: [ self error: MarsRover invalidCardinalPointErrorDescription ]! !


!MarsRoverHeading class methodsFor: 'testing' stamp: 'HAW 7/2/2018 17:01:33'!
isFor: aCardinalPoint

	^self cardinalPoint = aCardinalPoint ! !


!classDefinition: #MarsRoverHeadingEast category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:09:19'!
moveBackward: aMarsRover
	
	^aMarsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:09:28'!
moveForward: aMarsRover
	
	^aMarsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:09:42'!
rotateLeft: aMarsRover
	
	^aMarsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:09:54'!
rotateRight: aMarsRover
	
	^aMarsRover headSouth! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadingEast class' category: 'MarsRover-WithHeading'!
MarsRoverHeadingEast class
	instanceVariableNames: ''!

!MarsRoverHeadingEast class methodsFor: 'as yet unclassified' stamp: 'HAW 7/2/2018 17:01:53'!
cardinalPoint

	^#East! !


!classDefinition: #MarsRoverHeadingNorth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:10:12'!
moveBackward: aMarsRover
	
	^aMarsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:10:23'!
moveForward: aMarsRover
	
	^aMarsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:10:40'!
rotateLeft: aMarsRover
	
	^aMarsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:10:51'!
rotateRight: aMarsRover
	
	^aMarsRover headEast! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadingNorth class' category: 'MarsRover-WithHeading'!
MarsRoverHeadingNorth class
	instanceVariableNames: ''!

!MarsRoverHeadingNorth class methodsFor: 'as yet unclassified' stamp: 'HAW 7/2/2018 17:03:11'!
cardinalPoint

	^#North! !


!classDefinition: #MarsRoverHeadingSouth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:11:15'!
moveBackward: aMarsRover
	
	^aMarsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:11:25'!
moveForward: aMarsRover
	
	^aMarsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:11:55'!
rotateLeft: aMarsRover
	
	^aMarsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:11:50'!
rotateRight: aMarsRover
	
	^aMarsRover headWest! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadingSouth class' category: 'MarsRover-WithHeading'!
MarsRoverHeadingSouth class
	instanceVariableNames: ''!

!MarsRoverHeadingSouth class methodsFor: 'as yet unclassified' stamp: 'HAW 7/2/2018 17:03:17'!
cardinalPoint

	^#South! !


!classDefinition: #MarsRoverHeadingWest category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:12:07'!
moveBackward: aMarsRover

	^aMarsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 8/22/2019 12:12:15'!
moveForward: aMarsRover
	
	^aMarsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:12:26'!
rotateLeft: aMarsRover
	
	^aMarsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 8/22/2019 12:12:41'!
rotateRight: aMarsRover
	
	^aMarsRover headNorth! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeadingWest class' category: 'MarsRover-WithHeading'!
MarsRoverHeadingWest class
	instanceVariableNames: ''!

!MarsRoverHeadingWest class methodsFor: 'as yet unclassified' stamp: 'HAW 7/2/2018 17:03:23'!
cardinalPoint

	^#West! !


!classDefinition: #MarsRoverObserver category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverObserver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverObserver methodsFor: 'nil' stamp: 'AW 6/6/2021 21:50:09'!
changePosition: aPosition
	
	self subclassResponsibility.! !


!MarsRoverObserver methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:50:31'!
changeHeading: aHeadingSymbol
	
	self subclassResponsibility.! !


!classDefinition: #MarsRoverLog category: 'MarsRover-WithHeading'!
MarsRoverObserver subclass: #MarsRoverLog
	instanceVariableNames: 'lines'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:38:53'!
changeHeading: aHeadingSymbol 

	lines add: 'Rotated to face ', aHeadingSymbol asString.! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:34:32'!
changePosition: aPosition 
	lines add: 'Moved to ', aPosition asString.! !

!MarsRoverLog methodsFor: 'as yet unclassified' stamp: 'AW 6/6/2021 21:34:32'!
lines
	^lines.! !


!MarsRoverLog methodsFor: 'nil' stamp: 'AW 6/6/2021 21:34:32'!
initialize

	lines := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverLog class' category: 'MarsRover-WithHeading'!
MarsRoverLog class
	instanceVariableNames: ''!

!MarsRoverLog class methodsFor: 'nil' stamp: 'AW 6/6/2021 21:18:06'!
new


	^self basicNew initialize.
	
	! !


!classDefinition: #MarsRoverWindow category: 'MarsRover-WithHeading'!
MarsRoverObserver subclass: #MarsRoverWindow
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'nz 6/3/2021 20:54:53'!
changeHeading: aDirection
	heading := aDirection.! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'nz 6/3/2021 20:57:39'!
changePosition: aPosition 
	position:= aPosition! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'nz 6/3/2021 20:56:43'!
heading
	^heading! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'nz 6/3/2021 20:56:35'!
initialize

	position := 1@2.
	heading := #North.! !

!MarsRoverWindow methodsFor: 'as yet unclassified' stamp: 'nz 6/3/2021 20:53:17'!
position
	^ position! !
