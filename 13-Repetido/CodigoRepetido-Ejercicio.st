!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerCanNotBeEmpty category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CustomerCanNotBeEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!
!CustomerCanNotBeEmpty commentStamp: '<historical>' prior: 0!
Vimos que crear esta clase de error era una buena oportunidad de mejorar el codigo de los tests y no andar verificando strings.!


!CustomerCanNotBeEmpty methodsFor: 'as yet unclassified' stamp: 'nz 4/14/2021 22:26:03'!
messageText
	^CustomerBook customerCanNotBeEmptyErrorMessage! !


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'nz 4/14/2021 21:45:32'!
assertCustomerAmountsOf: aCustomerBook active: anAmountOfActiveCustomers suspended: anAmountOfSuspendedCustomers total: anAmountOfCustomers
	
	self assert: anAmountOfCustomers equals: aCustomerBook numberOfCustomers.
	self assert: anAmountOfActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: anAmountOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nz 4/14/2021 22:41:44'!
assertThat: aCustomerBook canNotSuspend: aCustomer

	self assertThat: [ aCustomerBook suspendCustomerNamed: aCustomer. ]
		failsWith: CantSuspend 
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nz 4/14/2021 22:39:39'!
assertThat: aClosureToEvaluate failsWith: anErrorClass 

	self assertThat: aClosureToEvaluate failsWith: anErrorClass andThenDo: nil.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nz 4/14/2021 21:06:48'!
assertThat: aClosureToEvaluate failsWith: anErrorClass andThenDo: aClosureToEvaluatePostConditions

	[ aClosureToEvaluate value.
	self fail ]
		on: anErrorClass
		do: aClosureToEvaluatePostConditions.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nz 4/14/2021 22:01:34'!
assertThat: aCustomerBook hasOnly: aLonelyCustomer
	self assert: aCustomerBook numberOfCustomers = 1.
	self assert: (aCustomerBook includesCustomerNamed: aLonelyCustomer).
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nz 4/12/2021 21:35:09'!
assertThat: aBlockClosure runsInLessThan: anAmountOfTime

	self assert: (aBlockClosure timeToRun < anAmountOfTime)
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nz 4/14/2021 22:52:23'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assertThat: [ customerBook addCustomerNamed: 'John Lennon' ] runsInLessThan: (50 * millisecond).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nz 4/14/2021 22:49:31'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney |
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	self assertThat: [ customerBook removeCustomerNamed: paulMcCartney ] runsInLessThan: (100 * millisecond).
	  ! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nz 4/14/2021 22:40:33'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self assertThat: [ customerBook addCustomerNamed: '' ] failsWith: CustomerCanNotBeEmpty.
	self assert: customerBook isEmpty.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nz 4/14/2021 22:41:02'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self assertThat: 	[ customerBook removeCustomerNamed: 'Paul McCartney'. ] failsWith: NotFound.
	self assertThat: customerBook hasOnly: johnLennon.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nz 4/14/2021 21:45:54'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertCustomerAmountsOf: customerBook active: 0 suspended: 1 total: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nz 4/14/2021 21:46:12'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertCustomerAmountsOf: customerBook active: 0 suspended: 0 total: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nz 4/14/2021 22:41:51'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self assertThat: 	customerBook canNotSuspend: 'George Harrison'.
	self assertThat: customerBook hasOnly: johnLennon.
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nz 4/14/2021 22:43:38'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self assertThat: customerBook canNotSuspend: johnLennon.
	self assertThat: customerBook hasOnly: johnLennon.
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'nz 4/14/2021 22:29:20'!
signalCustomerNameCannotBeEmpty 

	CustomerCanNotBeEmpty signal.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/12/2021 16:39:13'!
customerAlreadyExistsErrorMessage

	^'customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/12/2021 16:39:09'!
customerCanNotBeEmptyErrorMessage

	^'customer name cannot be empty!!!!!!'! !
