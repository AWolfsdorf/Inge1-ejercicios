!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/17/2021 17:29:53'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/17/2021 20:43:18'!
test08
	
	| portfolio |
	
	portfolio _ Portfolio new.
	
	self assert: portfolio balance equals: 0.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'nz 5/20/2021 20:41:40'!
test09
	
	| portfolio anAccount |
	
	portfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	
	Deposit register: 100 on: anAccount.
	
	portfolio registerAccount: anAccount.
	
	self assert: portfolio balance equals: 100.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'nz 5/20/2021 20:41:40'!
test10
	
	| portfolio anAccount anotherAccount |
	
	portfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	
	Deposit register: 100 on: anAccount.
	Deposit register: 50 on: anAccount.
	
	portfolio registerAccount: anAccount.
	portfolio registerAccount: anotherAccount .
	
	self assert: portfolio balance equals: 150.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'nz 5/20/2021 20:41:40'!
test11
	
	| portfolio anAccount aTransaction |
	
	portfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	
	aTransaction _ Deposit register: 500 on: anAccount.
	
	portfolio registerAccount: anAccount.
	
	self assert: (portfolio hasRegistered: aTransaction).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/17/2021 21:10:01'!
test12
	
	| portfolio anAccount aTransaction |
	
	portfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	
	aTransaction _ Deposit register: 500 on: anAccount.
	
	self deny: (portfolio hasRegistered: aTransaction).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'nz 5/20/2021 20:41:40'!
test13
	
	| portfolio anAccount anotherAccount anotherTransaction |
	
	portfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	
	Deposit register: 500 on: anAccount.
	anotherTransaction _ Deposit register: 200 on: anotherAccount.
	
	portfolio registerAccount: anAccount.
	
	self deny: (portfolio hasRegistered: anotherTransaction).

" un portfolio con una cuenta que tiene dos tx
  un portfolio con dos cuenta con una tx cada una
  un portfolio con un portfolio con una cuenta que tiene una tx
"! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'nz 5/20/2021 20:41:40'!
test14
	
	| portfolio anAccount anotherAccount aTransaction anotherTransaction |
	
	portfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	
	aTransaction _ Deposit register: 500 on: anAccount.
	anotherTransaction _ Deposit register: 200 on: anotherAccount.
	
	portfolio registerAccount: anAccount.
	portfolio registerAccount: anotherAccount.
	
	self assert: (portfolio hasRegistered: aTransaction).
	self assert: (portfolio hasRegistered: anotherTransaction).

"un portfolio con dos cuenta con una tx cada una
  un portfolio con un portfolio con una cuenta que tiene una tx
"! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'nz 5/20/2021 20:43:18'!
test15
	
	| portfolio anotherPortfolio anAccount aTransaction |
	
	portfolio _ Portfolio new.
	anotherPortfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	
	aTransaction _ Deposit register: 500 on: anAccount.
	
	anotherPortfolio registerAccount: anAccount.
	portfolio registerPortfolio: anotherPortfolio.
	
	self assert: (portfolio hasRegistered: aTransaction).

"
  un portfolio con un portfolio con una cuenta que tiene una tx
"! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'nz 5/20/2021 20:48:55'!
test16UnPortfolioAdentroDeOtroPortfolioVacioNoTieneTransacciones
	
	| portfolio anotherPortfolio anAccount aTransaction |
	
	portfolio _ Portfolio new.
	anotherPortfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	
	aTransaction _ Deposit register: 500 on: anAccount.
	
	"anotherPortfolio registerAccount: anAccount."
	portfolio registerPortfolio: anotherPortfolio.
	
	self deny: (portfolio hasRegistered: aTransaction).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'nz 5/20/2021 20:59:13'!
test17
	
	| mainPortfolio secondPortfolio thirdPortfolio anAccount aTransaction |
	
	mainPortfolio _ Portfolio new.
	secondPortfolio _ Portfolio new.
	thirdPortfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	aTransaction _ Deposit register: 500 on: anAccount.
	secondPortfolio registerAccount: anAccount.
	
	mainPortfolio registerPortfolio: secondPortfolio.
	mainPortfolio registerPortfolio: thirdPortfolio.
	
	self assert: (mainPortfolio hasRegistered: aTransaction).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'nz 5/20/2021 21:01:51'!
test18
	
	| mainPortfolio secondPortfolio thirdPortfolio anotherAccount anAccount aTransaction |
	
	mainPortfolio _ Portfolio new.
	secondPortfolio _ Portfolio new.
	thirdPortfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	Deposit register: 500 on: anAccount.
	secondPortfolio registerAccount: anAccount.
	
	anotherAccount _ ReceptiveAccount new.
	aTransaction _ Deposit register: 300 on: anotherAccount.
	thirdPortfolio registerAccount: anotherAccount.
	
	mainPortfolio registerPortfolio: secondPortfolio.
	mainPortfolio registerPortfolio: thirdPortfolio.
	
	self assert: (mainPortfolio hasRegistered: aTransaction).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'nz 5/20/2021 21:03:54'!
test19
	
	| mainPortfolio secondPortfolio anAccount aTransaction |
	
	mainPortfolio _ Portfolio new.
	
	secondPortfolio _ Portfolio new.
	mainPortfolio registerPortfolio: secondPortfolio.
	
	anAccount _ ReceptiveAccount new.
	mainPortfolio registerAccount: anAccount.
	
	aTransaction _ Deposit register: 500 on: anAccount.
	
	self assert: (mainPortfolio hasRegistered: aTransaction).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'AW 5/17/2021 20:34:53'!
applyOnBalance: aBalance

	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'nz 5/20/2021 20:41:40'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account registerAccount: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'AW 5/17/2021 20:35:53'!
applyOnBalance: aBalance

	^aBalance + self value.! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'AW 5/17/2021 20:36:06'!
applyOnBalance: aBalance

	^aBalance - self value.! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts portfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'nz 5/20/2021 20:42:04'!
balance
	
	^ accounts sum: [ :financialAsset | financialAsset balance ] ifEmpty: [ 0 ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'nz 5/20/2021 21:04:49'!
hasRegistered: aTransaction 
	
	^(portfolios anySatisfy: [ :aPortfolio | aPortfolio hasRegistered: aTransaction ])
	or: [ accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ] ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'nz 5/20/2021 20:57:49'!
initialize

	accounts _ OrderedCollection new.
	portfolios _ OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'nz 5/20/2021 20:42:04'!
registerAccount: afinancialAsset 
	
	accounts add: afinancialAsset.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'nz 5/20/2021 20:58:03'!
registerPortfolio: aPortfolio 

	portfolios add: aPortfolio.! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'nz 5/20/2021 20:41:40'!
registerAccount: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'AW 5/17/2021 20:37:02'!
balance

	^transactions inject: 0 into: [ :currentBalance :aTransaction | aTransaction applyOnBalance: currentBalance  ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
