!classDefinition: #AlanKay category: 'Ejercicios-IS1'!
DenotativeObject subclass: #AlanKay
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicios-IS1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlanKay class' category: 'Ejercicios-IS1'!
AlanKay class
	instanceVariableNames: 'currentCompany'!

!AlanKay class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 13:14:03'!
dateOfBirth
	^ May / 17 / 1940! !

!AlanKay class methodsFor: 'as yet unclassified' stamp: 'nz 4/1/2021 15:35:59'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	currentCompany := 'VPRI'.! !


!classDefinition: #AlanTuring category: 'Ejercicios-IS1'!
DenotativeObject subclass: #AlanTuring
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicios-IS1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlanTuring class' category: 'Ejercicios-IS1'!
AlanTuring class
	instanceVariableNames: ''!

!AlanTuring class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 13:01:49'!
dateOfBirth
	^June/23/1912! !

!AlanTuring class methodsFor: 'as yet unclassified' stamp: 'AW 3/27/2021 17:41:45'!
doesNotUnderstand: aMessage
	
	^'No entiendo lo que me decis con ' 	, aMessage printString! !


!classDefinition: #AlonsoChurch category: 'Ejercicios-IS1'!
DenotativeObject subclass: #AlonsoChurch
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicios-IS1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AlonsoChurch class' category: 'Ejercicios-IS1'!
AlonsoChurch class
	instanceVariableNames: ''!

!AlonsoChurch class methodsFor: 'as yet unclassified' stamp: 'AW 3/27/2021 18:32:44'!
ageDifferenceWith: aPerson
	^ self dateOfBirth year distanceTo: aPerson dateOfBirth year
	"lo anterior no considera el momento del año en el que nacieron"! !

!AlonsoChurch class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 13:46:29'!
ageDifferenceWithAlanKay
	^ self dateOfBirth year distanceTo: AlanKay dateOfBirth year
	"lo anterior no considera el momento del año en el que nacieron"! !

!AlonsoChurch class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 13:46:38'!
ageDifferenceWithAlanTuring
	^ self dateOfBirth year distanceTo: AlanTuring dateOfBirth year
	"lo anterior no considera el momento del año en el que nacieron"! !

!AlonsoChurch class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 13:46:41'!
ageDifferenceWithDanIngalls
	^ self dateOfBirth year distanceTo: DanIngalls dateOfBirth year
	"lo anterior no considera el momento del año en el que nacieron"! !

!AlonsoChurch class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 13:06:26'!
dateOfBirth
	^June/14/1903! !

!AlonsoChurch class methodsFor: 'as yet unclassified' stamp: 'nz 4/1/2021 15:25:10'!
isOlderThan: aPerson

    ^(self ageDifferenceWith: aPerson) positive! !

!AlonsoChurch class methodsFor: 'as yet unclassified' stamp: 'nz 4/1/2021 15:25:37'!
m1: collaborator1

   | temp1 |

   ^thisContext! !


!classDefinition: #Auto1 category: 'Ejercicios-IS1'!
DenotativeObject subclass: #Auto1
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicios-IS1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Auto1 class' category: 'Ejercicios-IS1'!
Auto1 class
	instanceVariableNames: ''!

!Auto1 class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 12:32:02'!
asHtml! !

!Auto1 class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 12:32:13'!
asJson! !

!Auto1 class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 12:21:55'!
break! !

!Auto1 class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 12:22:15'!
openTrunk! !

!Auto1 class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 12:32:08'!
save! !

!Auto1 class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 12:21:50'!
speedUp! !

!Auto1 class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 12:21:44'!
turnOff! !

!Auto1 class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 12:21:30'!
turnOn! !


!classDefinition: #DanIngalls category: 'Ejercicios-IS1'!
DenotativeObject subclass: #DanIngalls
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicios-IS1'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DanIngalls class' category: 'Ejercicios-IS1'!
DanIngalls class
	instanceVariableNames: ''!

!DanIngalls class methodsFor: 'as yet unclassified' stamp: 'nz 3/27/2021 13:17:40'!
dateOfBirth
	^ April / 10 / 1944! !

AlanKay initializeAfterFileIn!