!classDefinition: #CheckOutTest category: 'Tus-Libros'!
TestCase subclass: #CheckOutTest
	instanceVariableNames: 'creditCardNumber cardOwner validCreditCard book1 book2 expiredCreditCard currentMonth today expiredThisMonthCreditCard mockAlwaysStolenCardMerchantProcessor mockAlwaysOkMerchantProcessor mockAlwaysFakeCardMerchantProcessor mockAlwaysWithoutCreditCardMerchantProcessor invalidNumberCreditCard emptyOwnerCreditCard emptyOwnerCreditCard2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!CheckOutTest methodsFor: 'valid checkout' stamp: 'nz 6/16/2021 00:40:57'!
test02CheckoutACartWithOneItem

	| aCashier bookPrices cart receipt receiptBook |
	
	bookPrices _ PriceList new.
	bookPrices set: book1 price: 124.
	
	receiptBook _ OrderedCollection new.
	
	aCashier _ Cashier withPrices: bookPrices receiptBook: receiptBook merchantProcessor: mockAlwaysOkMerchantProcessor.
	
	cart _ ShoppingCart new.
	cart add: 1 of: book1.
	
	receipt _ aCashier checkOut: cart payingWith: validCreditCard on: today.
	
	self assert: 124 equals: receipt total.
	
	self assert: receipt isTheOnlyIn: receiptBook.! !

!CheckOutTest methodsFor: 'valid checkout' stamp: 'nz 6/16/2021 00:41:14'!
test03CheckoutACartWithMultipleItems

	| aCashier bookPrices cart receipt receiptBook |
	
	bookPrices _ PriceList new.
	bookPrices set: book1 price: 100.
	bookPrices set: book2 price: 25.
	
	receiptBook _ OrderedCollection new.
	
	aCashier _ Cashier withPrices: bookPrices receiptBook: receiptBook merchantProcessor: mockAlwaysOkMerchantProcessor.
	
	cart _ ShoppingCart new.
	cart add: 1 of: book1.
	cart add: 2 of: book2.
	
	receipt _ aCashier checkOut: cart payingWith: validCreditCard on: today.
	
	self assert: 150 equals: receipt total.

	self assert: receipt isTheOnlyIn: receiptBook.
	! !


!CheckOutTest methodsFor: 'assertions' stamp: 'AW 6/14/2021 21:59:15'!
assert: anItem isTheOnlyIn: aCollection

	self assert: aCollection size equals: 1.
	self assert: aCollection includes: anItem! !


!CheckOutTest methodsFor: 'card validation' stamp: 'nz 6/16/2021 00:42:38'!
test05CheckoutWithExpiredCardShouldRaiseError

	| aCashier bookPrices cart receiptBook |
	
	bookPrices _ PriceList new.
	bookPrices set: book1 price: 50.
	
	receiptBook _ OrderedCollection new.
	
	aCashier _ Cashier withPrices: bookPrices receiptBook: receiptBook merchantProcessor: mockAlwaysOkMerchantProcessor .
	
	cart _ ShoppingCart new.
	cart add: 3 of: book1.
	
	self should: [ aCashier checkOut: cart payingWith: expiredCreditCard on: today. ]
		raise: Error - MessageNotUnderstood
		withMessageText: Cashier cantCheckWithExpiredCardErrorDescription.
		
	self assert: receiptBook isEmpty.! !

!CheckOutTest methodsFor: 'card validation' stamp: 'nz 6/16/2021 00:45:20'!
test06CheckoutWithCardExpiredThisMonthShouldRaiseError

	| aCashier bookPrices cart receiptBook |
	
	bookPrices _ PriceList new.
	bookPrices set: book1 price: 50.
	
	receiptBook _ OrderedCollection new.
	
	aCashier _ Cashier withPrices: bookPrices receiptBook: receiptBook merchantProcessor: mockAlwaysOkMerchantProcessor.
	
	cart _ ShoppingCart new.
	cart add: 3 of: book1.
	
	self should: [ aCashier checkOut: cart payingWith: expiredThisMonthCreditCard on: today. ]
		raise: Error - MessageNotUnderstood
		withMessageText: Cashier cantCheckWithExpiredCardErrorDescription.
		
	self assert: receiptBook isEmpty.! !

!CheckOutTest methodsFor: 'card validation' stamp: 'nz 6/16/2021 00:48:37'!
test10CheckoutWithInvalidCardNumberShouldRaiseError

	| aCashier bookPrices cart receiptBook |
	
	bookPrices _ PriceList new.
	bookPrices set: book1 price: 50.
	
	receiptBook _ OrderedCollection new.
	
	aCashier _ Cashier withPrices: bookPrices receiptBook: receiptBook merchantProcessor: mockAlwaysOkMerchantProcessor.
	
	cart _ ShoppingCart new.
	cart add: 3 of: book1.
	
	self should: [ aCashier checkOut: cart payingWith: invalidNumberCreditCard on: today. ]
		raise: Error - MessageNotUnderstood
		withMessageText: Cashier invalidCreditCardNumberErrorDescription.
		
	self assert: receiptBook isEmpty.! !

!CheckOutTest methodsFor: 'card validation' stamp: 'nz 6/16/2021 00:50:15'!
test11CheckoutWithEmptyCardOwnerNameShouldRaiseError

	| aCashier bookPrices cart receiptBook |
	
	bookPrices _ PriceList new.
	bookPrices set: book1 price: 50.
	
	receiptBook _ OrderedCollection new.
	
	aCashier _ Cashier withPrices: bookPrices receiptBook: receiptBook merchantProcessor: mockAlwaysOkMerchantProcessor.
	
	cart _ ShoppingCart new.
	cart add: 3 of: book1.
	
	self should: [ aCashier checkOut: cart payingWith: emptyOwnerCreditCard on: today. ]
		raise: Error - MessageNotUnderstood
		withMessageText: Cashier invalidCreditCardOwnerNameErrorDescription.
		
	self assert: receiptBook isEmpty.! !

!CheckOutTest methodsFor: 'card validation' stamp: 'nz 6/16/2021 00:50:50'!
test12CheckoutWithBlankCardOwnerNameShouldRaiseError

	| aCashier bookPrices cart receiptBook |
	
	bookPrices _ PriceList new.
	bookPrices set: book1 price: 50.
	
	receiptBook _ OrderedCollection new.
	
	aCashier _ Cashier withPrices: bookPrices receiptBook: receiptBook merchantProcessor: mockAlwaysOkMerchantProcessor.
	
	cart _ ShoppingCart new.
	cart add: 3 of: book1.
	
	self should: [ aCashier checkOut: cart payingWith: emptyOwnerCreditCard2 on: today. ]
		raise: Error - MessageNotUnderstood
		withMessageText: Cashier invalidCreditCardOwnerNameErrorDescription.
		
	self assert: receiptBook isEmpty.! !


!CheckOutTest methodsFor: 'shopping cart validation' stamp: 'nz 6/16/2021 00:46:51'!
test01CheckoutEmptyCartShouldRaiseError

	| aCashier bookPrices cart  receiptBook |
	
	bookPrices _ PriceList new.
	
	receiptBook _ OrderedCollection new.
	
	aCashier _ Cashier withPrices: bookPrices receiptBook: receiptBook merchantProcessor: mockAlwaysOkMerchantProcessor .
	
	cart _ ShoppingCart new.
	
	self should: [ aCashier checkOut: cart payingWith: validCreditCard on: today. ]
		raise: Error - MessageNotUnderstood
		withMessageText: Cashier cantCheckoutEmptyCartErrorDescription.
		
	self assert: receiptBook isEmpty.! !

!CheckOutTest methodsFor: 'shopping cart validation' stamp: 'nz 6/16/2021 00:42:03'!
test04CheckoutItemWithoutPricesShouldRaiseError

	| aCashier bookPrices cart receiptBook |
	
	bookPrices _ PriceList new.
	receiptBook _ OrderedCollection new.
	
	aCashier _ Cashier withPrices: bookPrices receiptBook: receiptBook merchantProcessor: mockAlwaysOkMerchantProcessor.
	
	cart _ ShoppingCart new.
	cart add: 3 of: book1.
	
	self should: [ aCashier checkOut: cart payingWith: validCreditCard on: today. ]
		raise: Error - MessageNotUnderstood
		withMessageText: Cashier cantCheckoutItemWithNoPriceForItErrorDescription.
		
	self assert: receiptBook isEmpty.! !


!CheckOutTest methodsFor: 'setUp/tearDown' stamp: 'nz 6/16/2021 01:00:41'!
setUp

	today _ FixedGregorianDate today.
	currentMonth _ today monthOfYear.
	
	creditCardNumber _ '4182418241824182'.
	cardOwner _ 'PEPE SANCHEZ'.

	validCreditCard _ CreditCard
		number: creditCardNumber
		owner: cardOwner
		expiration: currentMonth next.
	
	expiredCreditCard _ CreditCard
		number: creditCardNumber
		owner: cardOwner
		expiration: currentMonth previous.
		
	expiredThisMonthCreditCard _ CreditCard
		number: creditCardNumber
		owner: cardOwner
		expiration: currentMonth.
		
	invalidNumberCreditCard _ CreditCard
		number: '418241'
		owner: cardOwner
		expiration: currentMonth next.
		
	emptyOwnerCreditCard _ CreditCard
		number: creditCardNumber
		owner: ''
		expiration: currentMonth next.
		
	emptyOwnerCreditCard2 _ CreditCard
		number: creditCardNumber
		owner: '            '
		expiration: currentMonth next.
		
	book1 := 'ISBN1'.
	book2 := 'ISBN2'.
	
	mockAlwaysStolenCardMerchantProcessor _ MockAlwaysStolenCardMerchantProcessor new.
	mockAlwaysOkMerchantProcessor _ MockAlwaysOkMerchantProcessor new.
	mockAlwaysFakeCardMerchantProcessor _ MockAlwaysFakeCardMerchantProcessor new.
	mockAlwaysWithoutCreditCardMerchantProcessor _ MockAlwaysWithoutCreditCardMerchantProcessor new.! !


!CheckOutTest methodsFor: 'merchant processor' stamp: 'nz 6/16/2021 00:46:43'!
test07CheckoutWithStolenCardShouldRaiseError

	| aCashier bookPrices cart receiptBook |
	
	bookPrices _ PriceList new.
	bookPrices set: book1 price: 50.
	
	receiptBook _ OrderedCollection new.
	
	aCashier _ Cashier withPrices: bookPrices receiptBook: receiptBook merchantProcessor: mockAlwaysStolenCardMerchantProcessor.
	
	cart _ ShoppingCart new.
	cart add: 3 of: book1.
	
	self should: [ aCashier checkOut: cart payingWith: validCreditCard on: today. ]
		raise: Error - MessageNotUnderstood
		withMessageText: MerchantProcessor stolenCreditCardErrorDescription.
		
	self assert: receiptBook isEmpty.! !

!CheckOutTest methodsFor: 'merchant processor' stamp: 'nz 6/16/2021 00:47:45'!
test08CheckoutWithFakeCardShouldRaiseError

	| aCashier bookPrices cart receiptBook |
	
	bookPrices _ PriceList new.
	bookPrices set: book1 price: 50.
	
	receiptBook _ OrderedCollection new.
	
	aCashier _ Cashier withPrices: bookPrices receiptBook: receiptBook merchantProcessor: mockAlwaysFakeCardMerchantProcessor.
	
	cart _ ShoppingCart new.
	cart add: 3 of: book1.
	
	self should: [ aCashier checkOut: cart payingWith: validCreditCard on: today. ]
		raise: Error - MessageNotUnderstood
		withMessageText: MerchantProcessor fakeCreditCardErrorDescription.
		
	self assert: receiptBook isEmpty.! !

!CheckOutTest methodsFor: 'merchant processor' stamp: 'nz 6/16/2021 00:47:36'!
test09CheckoutWithInsufficientFundsShouldRaiseError

	| aCashier bookPrices cart receiptBook |
	
	bookPrices _ PriceList new.
	bookPrices set: book1 price: 50.
	
	receiptBook _ OrderedCollection new.
	
	aCashier _ Cashier withPrices: bookPrices receiptBook: receiptBook merchantProcessor: mockAlwaysWithoutCreditCardMerchantProcessor.
	
	cart _ ShoppingCart new.
	cart add: 3 of: book1.
	
	self should: [ aCashier checkOut: cart payingWith: validCreditCard on: today. ]
		raise: Error - MessageNotUnderstood
		withMessageText: MerchantProcessor insufficientFundsCreditCardErrorDescription.
		
	self assert: receiptBook isEmpty.! !


!classDefinition: #PriceListTest category: 'Tus-Libros'!
TestCase subclass: #PriceListTest
	instanceVariableNames: 'book1 book2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!PriceListTest methodsFor: 'price validation' stamp: 'nz 6/16/2021 01:25:23'!
test01AddItemWithNegativePriceShouldRaiseError

	| priceList |
	
	priceList _ PriceList new.
	
	self should: [ priceList set: book1 price: -100.]
		raise: Error - MessageNotUnderstood
		withMessageText: PriceList itemPriceMustBePositiveErrorDescription.! !

!PriceListTest methodsFor: 'price validation' stamp: 'nz 6/16/2021 01:25:37'!
test02AddItemWithZeroPriceShouldRaiseError

	| priceList |
	
	priceList _ PriceList new.
	
	self should: [ priceList set: book1 price: 0.]
		raise: Error - MessageNotUnderstood
		withMessageText: PriceList itemPriceMustBePositiveErrorDescription.! !


!PriceListTest methodsFor: 'setUp/tearDown' stamp: 'nz 6/16/2021 01:15:07'!
setUp
	
	book1 := 'ISBN1'.
	book2 := 'ISBN2'.! !


!classDefinition: #ShoppingCartTest category: 'Tus-Libros'!
TestCase subclass: #ShoppingCartTest
	instanceVariableNames: 'book1 book2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!ShoppingCartTest methodsFor: 'quantity errors' stamp: 'AW 6/14/2021 22:06:29'!
test04AddingANegativeQuantityRaisesError
	| shoppingCart |

	shoppingCart := ShoppingCart new.
	
	self  should: [ shoppingCart add: -2 of: book1. ]
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart itemQuantityMustBeGreaterThanZeroErrorDescription.
	! !

!ShoppingCartTest methodsFor: 'quantity errors' stamp: 'AW 6/14/2021 22:06:35'!
test05AddingZeroQuantityRaisesError
	| shoppingCart |

	shoppingCart := ShoppingCart new.
	
	self  should: [ shoppingCart add: 0 of: book1. ]
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart itemQuantityMustBeGreaterThanZeroErrorDescription.
	! !

!ShoppingCartTest methodsFor: 'quantity errors' stamp: 'AW 6/14/2021 22:08:22'!
test06AddingNonIntegerQuantityRaisesError
	| shoppingCart |

	shoppingCart := ShoppingCart new.
	
	self  should: [ shoppingCart add: 1.5 of: book1. ]
		raise: Error - MessageNotUnderstood 
		withMessageText: ShoppingCart itemQuantyMustBeAnIntegerErrorDescription.
	! !


!ShoppingCartTest methodsFor: 'assertions' stamp: 'nz 6/14/2021 19:02:37'!
assert: shoppingCart has: quantity of: item

	self assert: (shoppingCart entries anySatisfy: [ :anShoppingCartItem | 
		anShoppingCartItem is: quantity of: item.
	] ).! !


!ShoppingCartTest methodsFor: 'adding items' stamp: 'nz 6/14/2021 19:02:37'!
test01EmptyCartHasNoItems

	| shoppingCart |
	shoppingCart := ShoppingCart new.
	
	self assert: shoppingCart entries size equals: 0. ! !

!ShoppingCartTest methodsFor: 'adding items' stamp: 'nz 6/14/2021 19:02:37'!
test02AddingAnItemToACart
	| shoppingCart quantity |

	shoppingCart := ShoppingCart new.
	quantity := 1.
	
	shoppingCart add: quantity of: book1.
	
	self assert: shoppingCart entries size equals: 1.
	self assert: shoppingCart has: quantity of: book1.! !

!ShoppingCartTest methodsFor: 'adding items' stamp: 'nz 6/14/2021 19:02:37'!
test03AddingMultipleItemsToACart
	| shoppingCart |

	shoppingCart := ShoppingCart new.
	
	shoppingCart add: 1 of: book1.
	shoppingCart add: 2 of: book2.
	
	self assert: shoppingCart entries size equals: 2.
	self assert: shoppingCart has: 1 of: book1.
	self assert: shoppingCart has: 2 of: book2.! !


!ShoppingCartTest methodsFor: 'setUp/tearDown' stamp: 'nz 6/16/2021 00:52:20'!
setUp
	
	book1 := 'ISBN1'.
	book2 := 'ISBN2'.! !


!classDefinition: #Cashier category: 'Tus-Libros'!
Object subclass: #Cashier
	instanceVariableNames: 'priceList receiptBook merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!Cashier methodsFor: 'initialization' stamp: 'AW 6/15/2021 23:05:59'!
initializePrices: aPriceList receiptBook: aReceiptBook merchantProcessor: aMerchantProcessor  
	
	priceList := aPriceList.
	receiptBook := aReceiptBook.
	merchantProcessor := aMerchantProcessor.! !


!Cashier methodsFor: 'private' stamp: 'nz 6/15/2021 23:47:15'!
calculateShoppingCartTotal: aShoppingCart

	^ aShoppingCart entries sum: [ :entry |
		self priceFor: entry.
	] ifEmpty: [
		self error: self class cantCheckoutEmptyCartErrorDescription .
	]! !

!Cashier methodsFor: 'private' stamp: 'nz 6/15/2021 23:45:29'!
createReceiptWithTotal: anAmountOfMoney

	| receipt |
	
	receipt _ Receipt withTotal: anAmountOfMoney.
	receiptBook add: receipt.
	
	^receipt .! !

!Cashier methodsFor: 'private' stamp: 'nz 6/14/2021 18:55:26'!
priceFor: aShoppingCartEntry
	
	^(priceList priceFor: aShoppingCartEntry item) * (aShoppingCartEntry quantity).! !


!Cashier methodsFor: 'checkout' stamp: 'nz 6/15/2021 23:47:15'!
checkOut: aShoppingCart payingWith: aCreditCard on: aGregorianDate  

	| total |

	self assertCanCheckout: aShoppingCart payingWith: aCreditCard on: aGregorianDate.
	
	total _ self calculateShoppingCartTotal: aShoppingCart.

	merchantProcessor debit: total from: aCreditCard. 

	^ self createReceiptWithTotal: total.
	! !


!Cashier methodsFor: 'validation' stamp: 'nz 6/14/2021 19:30:27'!
areAllItemsInPriceList: aCollectionOfShoppingCartEntries

	^ aCollectionOfShoppingCartEntries allSatisfy: [ :entry | priceList hasPriceFor: entry item ]! !

!Cashier methodsFor: 'validation' stamp: 'nz 6/14/2021 19:30:27'!
assertAllItemsInPriceList: aCollectionOfShoppingCartEntries

	(self areAllItemsInPriceList: aCollectionOfShoppingCartEntries)
		ifFalse: [ self error: self class cantCheckoutItemWithNoPriceForItErrorDescription ]
	
	! !

!Cashier methodsFor: 'validation' stamp: 'nz 6/16/2021 00:12:02'!
assertCanCheckout: aShoppingCart payingWith: aCreditCard on: aGregorianDate

	self assertAllItemsInPriceList: aShoppingCart entries.
	self assertCardIsValid: aCreditCard on: aGregorianDate.! !

!Cashier methodsFor: 'validation' stamp: 'nz 6/16/2021 00:21:41'!
assertCardIsValid: aCreditCard on: aGregorianDate 
	
	(aCreditCard isExpiredOn: aGregorianDate) ifTrue: [
		self error: self class cantCheckWithExpiredCardErrorDescription.	
	].
	aCreditCard hasValidNumber ifFalse: [
		self error: self class invalidCreditCardNumberErrorDescription.	
	].
	aCreditCard hasValidOwnerName ifFalse: [
		self error: self class invalidCreditCardOwnerNameErrorDescription.	
	].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'Tus-Libros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'AW 6/15/2021 23:06:29'!
withPrices: aPriceList receiptBook: aReceiptBook merchantProcessor: aMerchantProcessor  
	^self new initializePrices: aPriceList receiptBook: aReceiptBook merchantProcessor: aMerchantProcessor ! !


!Cashier class methodsFor: 'errors' stamp: 'AW 6/14/2021 22:11:12'!
cantCheckWithExpiredCardErrorDescription
	^'The card is expired!!'! !

!Cashier class methodsFor: 'errors' stamp: 'nz 6/10/2021 00:21:44'!
cantCheckoutEmptyCartErrorDescription
	^'Cannot checkout an empty shopping cart!!'.! !

!Cashier class methodsFor: 'errors' stamp: 'nz 6/14/2021 19:17:37'!
cantCheckoutItemWithNoPriceForItErrorDescription
	^'Cant checkout item with no price for it!!'.! !

!Cashier class methodsFor: 'errors' stamp: 'nz 6/15/2021 23:55:55'!
invalidCreditCardNumberErrorDescription
	^'The credit card number is invalid!!'.! !

!Cashier class methodsFor: 'errors' stamp: 'nz 6/16/2021 00:21:09'!
invalidCreditCardOwnerNameErrorDescription
	^'Invalid credit card owner name!!'.! !


!classDefinition: #CreditCard category: 'Tus-Libros'!
Object subclass: #CreditCard
	instanceVariableNames: 'number owner expiration'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!CreditCard methodsFor: 'initialization' stamp: 'nz 6/10/2021 00:21:00'!
initializeNumber: aCreditCardNumber owner: anOwnerName expiration: anExpirationMonthOfYear 

	number := aCreditCardNumber.
	owner := anOwnerName.
	expiration := anExpirationMonthOfYear.! !


!CreditCard methodsFor: 'validations' stamp: 'nz 6/16/2021 00:17:53'!
hasValidNumber
	^number size = 16.! !

!CreditCard methodsFor: 'validations' stamp: 'nz 6/16/2021 00:32:49'!
hasValidOwnerName
	^owner withBlanksTrimmed isEmpty not.! !

!CreditCard methodsFor: 'validations' stamp: 'AW 6/14/2021 23:03:42'!
isExpiredOn: aGregorianDate 
	
	^expiration <= aGregorianDate monthOfYear.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'Tus-Libros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'nz 6/10/2021 00:20:07'!
number: aCreditCardNumber owner: anOwnerName expiration: anExpirationMonthOfYear 

	^self new initializeNumber: aCreditCardNumber owner: anOwnerName expiration: anExpirationMonthOfYear ! !


!classDefinition: #MerchantProcessor category: 'Tus-Libros'!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!MerchantProcessor methodsFor: 'debit' stamp: 'AW 6/15/2021 23:11:55'!
debit: anAmountOfMoney from: aCreditCard
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessor class' category: 'Tus-Libros'!
MerchantProcessor class
	instanceVariableNames: ''!

!MerchantProcessor class methodsFor: 'errors' stamp: 'AW 6/15/2021 23:15:42'!
fakeCreditCardErrorDescription
	^'Cannot debit from a fake card!!'.! !

!MerchantProcessor class methodsFor: 'errors' stamp: 'nz 6/16/2021 01:04:01'!
insufficientFundsCreditCardErrorDescription
	^'Cannot debit from a credit card with insufficient funds!!'.! !

!MerchantProcessor class methodsFor: 'errors' stamp: 'nz 6/16/2021 01:04:04'!
stolenCreditCardErrorDescription
	^'Cannot debit from stolen credit card!!'.! !


!classDefinition: #MockAlwaysFakeCardMerchantProcessor category: 'Tus-Libros'!
MerchantProcessor subclass: #MockAlwaysFakeCardMerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!MockAlwaysFakeCardMerchantProcessor methodsFor: 'debit' stamp: 'AW 6/15/2021 23:16:20'!
debit: anAmountOfMoney from: aCreditCard 
	
	^self error: self class fakeCreditCardErrorDescription .! !


!classDefinition: #MockAlwaysOkMerchantProcessor category: 'Tus-Libros'!
MerchantProcessor subclass: #MockAlwaysOkMerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!MockAlwaysOkMerchantProcessor methodsFor: 'debit' stamp: 'AW 6/15/2021 23:10:31'!
debit: anAmountOfMoney from: aCreditCard ! !


!classDefinition: #MockAlwaysStolenCardMerchantProcessor category: 'Tus-Libros'!
MerchantProcessor subclass: #MockAlwaysStolenCardMerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!MockAlwaysStolenCardMerchantProcessor methodsFor: 'debit' stamp: 'AW 6/15/2021 23:07:32'!
debit: anAmountOfMoney from: aCreditCard 
	
	^self error: self class stolenCreditCardErrorDescription.! !


!classDefinition: #MockAlwaysWithoutCreditCardMerchantProcessor category: 'Tus-Libros'!
MerchantProcessor subclass: #MockAlwaysWithoutCreditCardMerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!MockAlwaysWithoutCreditCardMerchantProcessor methodsFor: 'debit' stamp: 'AW 6/15/2021 23:30:15'!
debit: anAmountOfMoney from: aCreditCard 
	
	^self error: self class insufficientFundsCreditCardErrorDescription .! !


!classDefinition: #PriceList category: 'Tus-Libros'!
Object subclass: #PriceList
	instanceVariableNames: 'prices'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!PriceList methodsFor: 'initialization' stamp: 'nz 6/14/2021 18:59:05'!
initialize

	prices _ Dictionary new.! !


!PriceList methodsFor: 'accessing' stamp: 'nz 6/14/2021 19:29:04'!
hasPriceFor: aBook 
	
	^prices includesKey: aBook.! !

!PriceList methodsFor: 'accessing' stamp: 'nz 6/14/2021 19:00:48'!
priceFor: aBook 
	
	^prices at: aBook.! !


!PriceList methodsFor: 'set prices' stamp: 'nz 6/16/2021 01:24:12'!
set: aBook price: aPrice 
	self assertPriceIsValid: aPrice.
	prices at: aBook put: aPrice.! !


!PriceList methodsFor: 'validation' stamp: 'nz 6/16/2021 01:24:12'!
assertPriceIsValid: aPrice

	^ (aPrice > 0) ifFalse: [ self error: self class itemPriceMustBePositiveErrorDescription. ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PriceList class' category: 'Tus-Libros'!
PriceList class
	instanceVariableNames: ''!

!PriceList class methodsFor: 'errors' stamp: 'nz 6/16/2021 01:21:09'!
itemPriceMustBePositiveErrorDescription
	^'Item price must be positive!!'.! !


!classDefinition: #Receipt category: 'Tus-Libros'!
Object subclass: #Receipt
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!Receipt methodsFor: 'initialization' stamp: 'nz 6/14/2021 18:48:47'!
initializeWithTotal: aTransactionTotal 
	
	total := aTransactionTotal.! !


!Receipt methodsFor: 'accessing' stamp: 'nz 6/14/2021 18:49:08'!
total
	^total.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Receipt class' category: 'Tus-Libros'!
Receipt class
	instanceVariableNames: ''!

!Receipt class methodsFor: 'instance creation' stamp: 'nz 6/14/2021 18:48:27'!
withTotal: aTransactionTotal 

	^self new initializeWithTotal: aTransactionTotal ! !


!classDefinition: #ShoppingCart category: 'Tus-Libros'!
Object subclass: #ShoppingCart
	instanceVariableNames: 'entries'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!ShoppingCart methodsFor: 'accessing' stamp: 'nz 6/14/2021 19:02:37'!
entries
	^entries.! !


!ShoppingCart methodsFor: 'adding' stamp: 'nz 6/14/2021 19:42:41'!
add: aQuantity of: anItem 

	self assertQuantityIsValid: aQuantity.
	
	entries add: (ShoppingCartEntry for: anItem quantity: aQuantity).! !


!ShoppingCart methodsFor: 'validations' stamp: 'AW 6/10/2021 20:09:49'!
assertQuantityIsValid: aQuantity

	aQuantity strictlyPositive
		ifFalse: [ self error: self class itemQuantityMustBeGreaterThanZeroErrorDescription ].
	
	aQuantity isInteger
		ifFalse: [ self error: self class itemQuantyMustBeAnIntegerErrorDescription ]! !


!ShoppingCart methodsFor: 'initialization' stamp: 'nz 6/14/2021 19:42:36'!
initialize

	entries := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ShoppingCart class' category: 'Tus-Libros'!
ShoppingCart class
	instanceVariableNames: ''!

!ShoppingCart class methodsFor: 'errors' stamp: 'nz 6/9/2021 23:47:56'!
itemQuantityMustBeGreaterThanZeroErrorDescription
	^'Cannot add item with negative quantity!!'.! !

!ShoppingCart class methodsFor: 'errors' stamp: 'AW 6/10/2021 20:05:50'!
itemQuantyMustBeAnIntegerErrorDescription
	^'Quanty must be an integer!!'! !


!classDefinition: #ShoppingCartEntry category: 'Tus-Libros'!
Object subclass: #ShoppingCartEntry
	instanceVariableNames: 'item quantity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!ShoppingCartEntry methodsFor: 'initialization' stamp: 'AW 6/9/2021 00:31:25'!
initializeFor: anItem quantity: aQuantity 
	
	item := anItem.
	quantity := aQuantity.! !


!ShoppingCartEntry methodsFor: 'accessing' stamp: 'AW 6/9/2021 00:32:01'!
item
	
	^item! !

!ShoppingCartEntry methodsFor: 'accessing' stamp: 'AW 6/9/2021 00:32:11'!
quantity
	
	^quantity! !


!ShoppingCartEntry methodsFor: 'testing' stamp: 'AW 6/9/2021 00:54:31'!
is: aQuantity of: anItem 
	^(item = anItem) and: [ quantity = aQuantity ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ShoppingCartEntry class' category: 'Tus-Libros'!
ShoppingCartEntry class
	instanceVariableNames: ''!

!ShoppingCartEntry class methodsFor: 'instance creation' stamp: 'AW 6/9/2021 00:31:03'!
for: anItem quantity: aQuantity 

	^self new initializeFor: anItem quantity: aQuantity ! !
