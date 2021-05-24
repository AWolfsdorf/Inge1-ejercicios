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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 19:32:09'!
test09
	
	| portfolio anAccount |
	
	portfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	
	Deposit register: 100 on: anAccount.
	
	portfolio registerAsset: anAccount.
	
	self assert: portfolio balance equals: 100.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 19:32:14'!
test10
	
	| portfolio anAccount anotherAccount |
	
	portfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	
	Deposit register: 100 on: anAccount.
	Deposit register: 50 on: anAccount.
	
	portfolio registerAsset: anAccount.
	portfolio registerAsset: anotherAccount .
	
	self assert: portfolio balance equals: 150.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 19:32:41'!
test11
	
	| portfolio anAccount aTransaction |
	
	portfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	
	aTransaction _ Deposit register: 500 on: anAccount.
	
	portfolio registerAsset: anAccount.
	
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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 19:32:29'!
test13
	
	| portfolio anAccount anotherAccount anotherTransaction |
	
	portfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	
	Deposit register: 500 on: anAccount.
	anotherTransaction _ Deposit register: 200 on: anotherAccount.
	
	portfolio registerAsset: anAccount.
	
	self deny: (portfolio hasRegistered: anotherTransaction).

" un portfolio con una cuenta que tiene dos tx
  un portfolio con dos cuenta con una tx cada una
  un portfolio con un portfolio con una cuenta que tiene una tx
"! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 19:32:56'!
test14
	
	| portfolio anAccount anotherAccount aTransaction anotherTransaction |
	
	portfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	anotherAccount _ ReceptiveAccount new.
	
	aTransaction _ Deposit register: 500 on: anAccount.
	anotherTransaction _ Deposit register: 200 on: anotherAccount.
	
	portfolio registerAsset: anAccount.
	portfolio registerAsset: anotherAccount.
	
	self assert: (portfolio hasRegistered: aTransaction).
	self assert: (portfolio hasRegistered: anotherTransaction).

"un portfolio con dos cuenta con una tx cada una
  un portfolio con un portfolio con una cuenta que tiene una tx
"! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 19:33:01'!
test15
	
	| portfolio anotherPortfolio anAccount aTransaction |
	
	portfolio _ Portfolio new.
	anotherPortfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	
	aTransaction _ Deposit register: 500 on: anAccount.
	
	anotherPortfolio registerAsset: anAccount.
	portfolio registerAsset: anotherPortfolio.
	
	self assert: (portfolio hasRegistered: aTransaction).

"
  un portfolio con un portfolio con una cuenta que tiene una tx
"! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 19:31:34'!
test16UnPortfolioAdentroDeOtroPortfolioVacioNoTieneTransacciones
	
	| portfolio anotherPortfolio anAccount aTransaction |
	
	portfolio _ Portfolio new.
	anotherPortfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	
	aTransaction _ Deposit register: 500 on: anAccount.
	
	"anotherPortfolio registerAccount: anAccount."
	portfolio registerAsset: anotherPortfolio.
	
	self deny: (portfolio hasRegistered: aTransaction).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 19:33:06'!
test17
	
	| mainPortfolio secondPortfolio thirdPortfolio anAccount aTransaction |
	
	mainPortfolio _ Portfolio new.
	secondPortfolio _ Portfolio new.
	thirdPortfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	aTransaction _ Deposit register: 500 on: anAccount.
	secondPortfolio registerAsset: anAccount.
	
	mainPortfolio registerAsset: secondPortfolio.
	mainPortfolio registerAsset: thirdPortfolio.
	
	self assert: (mainPortfolio hasRegistered: aTransaction).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 19:33:16'!
test18
	
	| mainPortfolio secondPortfolio thirdPortfolio anotherAccount anAccount aTransaction |
	
	mainPortfolio _ Portfolio new.
	secondPortfolio _ Portfolio new.
	thirdPortfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	Deposit register: 500 on: anAccount.
	secondPortfolio registerAsset: anAccount.
	
	anotherAccount _ ReceptiveAccount new.
	aTransaction _ Deposit register: 300 on: anotherAccount.
	thirdPortfolio registerAsset: anotherAccount.
	
	mainPortfolio registerAsset: secondPortfolio.
	mainPortfolio registerAsset: thirdPortfolio.
	
	self assert: (mainPortfolio hasRegistered: aTransaction).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 19:33:22'!
test19
	
	| mainPortfolio secondPortfolio anAccount aTransaction |
	
	mainPortfolio _ Portfolio new.
	
	secondPortfolio _ Portfolio new.
	mainPortfolio registerAsset: secondPortfolio.
	
	anAccount _ ReceptiveAccount new.
	mainPortfolio registerAsset: anAccount.
	
	aTransaction _ Deposit register: 500 on: anAccount.
	
	self assert: (mainPortfolio hasRegistered: aTransaction).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 21:53:22'!
test20
	
	| mainPortfolio anAccount |
	
	mainPortfolio _ Portfolio new.
	
	anAccount _ ReceptiveAccount new.
	mainPortfolio registerAsset: anAccount.
	
	self should: [mainPortfolio registerAsset: anAccount.]
		raise: Error
		withMessageText: Portfolio duplicatedAssetErrorDescription.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 21:53:22'!
test21
	
	| mainPortfolio |
	
	mainPortfolio _ Portfolio new.
		
	self should: [ 	mainPortfolio registerAsset: mainPortfolio. ]
		raise: Error
		withMessageText: Portfolio duplicatedAssetErrorDescription.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 21:53:22'!
test22
	
	| mainPortfolio innerPortfolio anAccount |
	
	mainPortfolio _ Portfolio new.
	innerPortfolio _ Portfolio new.
	anAccount _ ReceptiveAccount new.
	
	mainPortfolio registerAsset: innerPortfolio.
	innerPortfolio registerAsset: anAccount.
		
	self should: [ 	mainPortfolio registerAsset: anAccount. ]
		raise: Error
		withMessageText: Portfolio duplicatedAssetErrorDescription.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 21:53:22'!
test23
	
	| mainPortfolio innerPortfolio anAccount |
	
	mainPortfolio _ Portfolio new.
	innerPortfolio _ Portfolio new.
	anAccount _ ReceptiveAccount new.
	
	mainPortfolio registerAsset: innerPortfolio.
	mainPortfolio registerAsset: anAccount.
		
	self should: [ 		innerPortfolio registerAsset: anAccount. ]
		raise: Error
		withMessageText: Portfolio duplicatedAssetErrorDescription.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 21:53:22'!
test24
	
	| parentPortfolio otherParentPortfolio innerPortfolio anAccount |
	
	parentPortfolio _ Portfolio new.
	otherParentPortfolio _ Portfolio new.
	innerPortfolio _ Portfolio new.
	anAccount _ ReceptiveAccount new.
	
	parentPortfolio registerAsset: innerPortfolio.
	parentPortfolio registerAsset: anAccount.
	otherParentPortfolio registerAsset: innerPortfolio.
		
	self should: [ 		innerPortfolio registerAsset: anAccount. ]
		raise: Error
		withMessageText: Portfolio duplicatedAssetErrorDescription.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 21:53:22'!
test25
	
	| rootPortfolio childPortfolio grandChildPortfolio anAccount |
	
	rootPortfolio _ Portfolio new.
	childPortfolio _ Portfolio new.
	grandChildPortfolio _ Portfolio new.
	anAccount _ ReceptiveAccount new.
	
	rootPortfolio registerAsset: childPortfolio .
	rootPortfolio registerAsset: anAccount.
	childPortfolio registerAsset: grandChildPortfolio.
		
	self should: [ 		grandChildPortfolio registerAsset: anAccount. ]
		raise: Error
		withMessageText: Portfolio duplicatedAssetErrorDescription.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 21:53:22'!
test26
	
	| rootPortfolio leftPortfolio rightPortfolio anAccount |
	
	rootPortfolio _ Portfolio new.
	leftPortfolio _ Portfolio new.
	rightPortfolio _ Portfolio new.
	anAccount _ ReceptiveAccount new.
		
	rootPortfolio registerAsset: leftPortfolio.
	leftPortfolio registerAsset: anAccount.
	rightPortfolio registerAsset: anAccount.
		
	self should: [ rootPortfolio registerAsset: rightPortfolio. ]
		raise: Error
		withMessageText: Portfolio duplicatedAssetErrorDescription.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 22:10:32'!
test27
	
	| aPortfolio |
	
	aPortfolio _ Portfolio new.
	
	self assert: aPortfolio transactions isEmpty.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'AW 5/23/2021 22:22:47'!
test28
	
	| aPortfolio anAccount aTransaction |
	
	aPortfolio _ Portfolio new.
	anAccount _ ReceptiveAccount new.
	aPortfolio registerAsset: anAccount.
	
	aTransaction _ Deposit register: 200 on: anAccount.
	
	self assert: aPortfolio transactions size equals: 1.
	self assert: aPortfolio transactions first equals: aTransaction.! !



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

!AccountTransaction class methodsFor: 'instance creation' stamp: 'AW 5/23/2021 19:36:17'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account registerTransaction: transaction.
		
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


!classDefinition: #FinancialAsset category: 'Portfolio-Ejercicio'!
Object subclass: #FinancialAsset
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!FinancialAsset methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 20:12:07'!
balance
	self subclassResponsibility.! !

!FinancialAsset methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 20:11:34'!
hasAsset: anAsset
	self subclassResponsibility.! !

!FinancialAsset methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 20:12:41'!
hasRegistered: aTransaction

	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
FinancialAsset subclass: #Portfolio
	instanceVariableNames: 'financialAssets rootPortfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 21:08:05'!
addedToPortfolio: aPortfolio 
	
	rootPortfolios addAll: aPortfolio rootPorfolios.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 19:30:12'!
balance
	
	^ financialAssets sum: [ :financialAsset | financialAsset balance ] ifEmpty: [ 0 ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 20:03:14'!
hasAsset: aFinancialAsset

	^(financialAssets includes: aFinancialAsset) or: [ financialAssets anySatisfy: [ :anAsset | anAsset hasAsset: aFinancialAsset ] ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 19:28:55'!
hasRegistered: aTransaction 
	
	^financialAssets anySatisfy: [ :anAsset | anAsset hasRegistered: aTransaction ].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 21:08:05'!
initialize

	financialAssets _ OrderedCollection new.
	rootPortfolios _ OrderedCollection with: self.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 21:24:34'!
isOnAnyRootPortfolio: aFinancialAsset

	^ rootPortfolios anySatisfy: [ :aPortfolio | aPortfolio isSelfOrIsInPortfolio: aFinancialAsset ]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 21:24:33'!
isSelfOrIsInPortfolio: aFinancialAsset 

	^(self = aFinancialAsset) or: [ self hasAsset: aFinancialAsset ]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 22:30:06'!
leaves
	^financialAssets 
		ifEmpty: [ OrderedCollection with: self ] 
		ifNotEmpty: [ (financialAssets collect: [ :asset | asset leaves ]) flatten ]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 20:41:05'!
registerAsset: aFinancialAsset 
	
	self validateAddAsset: aFinancialAsset.

	aFinancialAsset addedToPortfolio: self.
	financialAssets add: aFinancialAsset.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 21:08:05'!
rootPorfolios
	^rootPortfolios .! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 22:29:28'!
transactions
	^(financialAssets collect: [ :anAsset | anAsset transactions. ]) flatten.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 21:53:22'!
validateAddAsset: aFinancialAsset
	
	(aFinancialAsset leaves anySatisfy: [ :leave | self isOnAnyRootPortfolio: leave ])
		ifTrue: [^self error: self class duplicatedAssetErrorDescription ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'errors' stamp: 'AW 5/23/2021 21:58:40'!
duplicatedAssetErrorDescription
	^'This leads to an asset being duplicated in a portfolio.'.! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
FinancialAsset subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'AW 5/23/2021 19:35:54'!
registerTransaction: aTransaction

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


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 20:31:42'!
addedToPortfolio: aPortfolio ! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 20:05:05'!
hasAsset: anAsset 
	^false.! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'AW 5/23/2021 21:51:29'!
leaves
	^OrderedCollection with: self.! !
