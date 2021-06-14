!classDefinition: #CheckOutTest category: 'Tus-Libros'!
TestCase subclass: #CheckOutTest
	instanceVariableNames: 'creditCardNumber1 expirationDate1 cardOwner1 validCreditCard1 isbnBook1 book1 isbnBook2 book2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!CheckOutTest methodsFor: 'as yet unclassified' stamp: 'nz 6/10/2021 20:35:05'!
setUp

	creditCardNumber1 _ '4182418241824182'.
	expirationDate1 _ GregorianMonthOfYear mayOf: (GregorianYear number: 2030).
	cardOwner1 _ 'PEPE SANCHEZ'.
	
	validCreditCard1 _ CreditCard
		number: creditCardNumber1
		owner: cardOwner1
		expiration: expirationDate1.
	
	isbnBook1 := 'ISBN1'.
	book1 := Book for: isbnBook1.
	
	isbnBook2 := 'ISBN2'.
	book2 := Book for: isbnBook2.! !

!CheckOutTest methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 20:05:33'!
test01

	| aCashier bookPrices cart  receiptBook |
	
	bookPrices _ PriceList new.
	
	receiptBook _ ReceiptBook new.
	
	aCashier _ Cashier with: bookPrices and: receiptBook.
	
	cart _ ShoppingCart new.
	
	self should: [ aCashier checkOut: cart payingWith: validCreditCard1. ]
		raise: Error - MessageNotUnderstood
		description: Cashier cantCheckoutEmptyCartErrorDescription.
		
	self assert: receiptBook isEmpty.! !

!CheckOutTest methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:07:14'!
test02

	| aCashier bookPrices cart receipt |
	
	bookPrices _ PriceList new.
	bookPrices set: book1 price: 124.
	
	aCashier _ Cashier with: bookPrices.
	
	cart _ ShoppingCart new.
	cart add: 1 of: book1.
	
	receipt _ aCashier checkOut: cart payingWith: validCreditCard1 .
	
	self assert: 124 equals: receipt total.! !

!CheckOutTest methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:07:22'!
test03

	| aCashier bookPrices cart receipt |
	
	bookPrices _ PriceList new.
	bookPrices set: book1 price: 100.
	bookPrices set: book2 price: 25.
	
	aCashier _ Cashier with: bookPrices.
	
	cart _ ShoppingCart new.
	cart add: 1 of: book1.
	cart add: 2 of: book2.
	
	receipt _ aCashier checkOut: cart payingWith: validCreditCard1 .
	
	self assert: 150 equals: receipt total.! !

!CheckOutTest methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:18:39'!
test04

	| aCashier bookPrices cart |
	
	bookPrices _ PriceList new.
	
	aCashier _ Cashier with: bookPrices.
	
	cart _ ShoppingCart new.
	cart add: 3 of: book1.
	
	self should: [ aCashier checkOut: cart payingWith: validCreditCard1. ]
		raise: Error - MessageNotUnderstood
		withMessageText: Cashier cantCheckoutItemWithNoPriceForItErrorDescription.
		
	"TODO: Agregar sales book y testear que no se haya agregado la venta"! !


!classDefinition: #ShoppingCartTest category: 'Tus-Libros'!
TestCase subclass: #ShoppingCartTest
	instanceVariableNames: 'isbnBook1 isbnBook2 book1 book2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:02:37'!
assert: shoppingCart has: quantity of: item

	self assert: (shoppingCart entries anySatisfy: [ :anShoppingCartItem | 
		anShoppingCartItem is: quantity of: item.
	] ).! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'nz 6/10/2021 20:27:49'!
setUp
	
	isbnBook1 := 'ISBN1'.
	book1 := Book for: isbnBook1.
	
	isbnBook2 := 'ISBN2'.
	book2 := Book for: isbnBook2.! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:02:37'!
test01EmptyCartHasNoItems

	| shoppingCart |
	shoppingCart := ShoppingCart new.
	
	self assert: shoppingCart entries size equals: 0. ! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:02:37'!
test02AddingAnItemToACart
	| shoppingCart quantity |

	shoppingCart := ShoppingCart new.
	quantity := 1.
	
	shoppingCart add: quantity of: book1.
	
	self assert: shoppingCart entries size equals: 1.
	self assert: shoppingCart has: quantity of: book1.! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:02:37'!
test03AddingMultipleItemsToACart
	| shoppingCart |

	shoppingCart := ShoppingCart new.
	
	shoppingCart add: 1 of: book1.
	shoppingCart add: 2 of: book2.
	
	self assert: shoppingCart entries size equals: 2.
	self assert: shoppingCart has: 1 of: book1.
	self assert: shoppingCart has: 2 of: book2.! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'nz 6/10/2021 20:32:02'!
test04AddingANegativeQuantityRaisesError
	| shoppingCart |

	shoppingCart := ShoppingCart new.
	
	self  should: [ shoppingCart add: -2 of: book1. ]
		raise: Error - MessageNotUnderstood 
		description: ShoppingCart itemQuantityMustBeGreaterThanZeroErrorDescription.
	! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'nz 6/10/2021 20:32:22'!
test05AddingZeroQuantityRaisesError
	| shoppingCart |

	shoppingCart := ShoppingCart new.
	
	self  should: [ shoppingCart add: 0 of: book1. ]
		raise: Error - MessageNotUnderstood 
		description: ShoppingCart itemQuantityMustBeGreaterThanZeroErrorDescription.
	! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'nz 6/10/2021 20:32:34'!
test06AddingNonIntegerQuantityRaisesError
	| shoppingCart |

	shoppingCart := ShoppingCart new.
	
	self  should: [ shoppingCart add: 1.5 of: book1. ]
		raise: Error - MessageNotUnderstood 
		description: ShoppingCart itemQuantityMustBeGreaterThanZeroErrorDescription .
	! !


!classDefinition: #Book category: 'Tus-Libros'!
Object subclass: #Book
	instanceVariableNames: 'isbn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!Book methodsFor: 'initialization' stamp: 'AW 6/9/2021 00:24:32'!
initializeFor: anIsbnString 

	isbn := anIsbnString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Book class' category: 'Tus-Libros'!
Book class
	instanceVariableNames: ''!

!Book class methodsFor: 'instance creation' stamp: 'AW 6/9/2021 00:23:45'!
for: anIsbnString
	
	^self new initializeFor: anIsbnString ! !


!classDefinition: #Cashier category: 'Tus-Libros'!
Object subclass: #Cashier
	instanceVariableNames: 'priceList receiptBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!Cashier methodsFor: 'initialization' stamp: 'nz 6/10/2021 00:19:07'!
initializeWith: aPriceList 
	
	priceList := aPriceList.! !

!Cashier methodsFor: 'initialization' stamp: 'nz 6/14/2021 20:06:28'!
initializeWith: aPriceList and: aReceiptBook 
	
	priceList := aPriceList.
	receiptBook := aReceiptBook.! !


!Cashier methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:30:27'!
areAllItemsInPriceList: aCollectionOfShoppingCartEntries

	^ aCollectionOfShoppingCartEntries allSatisfy: [ :entry | priceList hasPriceFor: entry item ]! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:30:27'!
assertAllItemsInPriceList: aCollectionOfShoppingCartEntries

	(self areAllItemsInPriceList: aCollectionOfShoppingCartEntries)
		ifFalse: [ self error: self class cantCheckoutItemWithNoPriceForItErrorDescription ]
	
	! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:53:49'!
checkOut: aShoppingCart payingWith: aCreditCard 

	| total |

	self assertAllItemsInPriceList: aShoppingCart entries.
	
	total _ aShoppingCart entries sum: [ :entry |
		self priceFor: entry.
	] ifEmpty: [
		^self error: self class cantCheckoutEmptyCartErrorDescription .
	].

	^Receipt withTotal: total.
	! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 18:55:26'!
priceFor: aShoppingCartEntry
	
	^(priceList priceFor: aShoppingCartEntry item) * (aShoppingCartEntry quantity).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'Tus-Libros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'nz 6/10/2021 00:18:44'!
with: aPriceList 
	
	^self new initializeWith: aPriceList ! !

!Cashier class methodsFor: 'instance creation' stamp: 'nz 6/14/2021 20:06:15'!
with: aPriceList and: aReceiptBook 
	^self new initializeWith: aPriceList and: aReceiptBook ! !


!Cashier class methodsFor: 'as yet unclassified' stamp: 'nz 6/10/2021 00:21:44'!
cantCheckoutEmptyCartErrorDescription
	^'Cannot checkout an empty shopping cart!!'.! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:17:37'!
cantCheckoutItemWithNoPriceForItErrorDescription
	^'Cant checkout item with no price for it!!'.! !


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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'Tus-Libros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'nz 6/10/2021 00:20:07'!
number: aCreditCardNumber owner: anOwnerName expiration: anExpirationMonthOfYear 

	^self new initializeNumber: aCreditCardNumber owner: anOwnerName expiration: anExpirationMonthOfYear ! !


!classDefinition: #PriceList category: 'Tus-Libros'!
Object subclass: #PriceList
	instanceVariableNames: 'prices'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!PriceList methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:29:04'!
hasPriceFor: aBook 
	
	^prices includesKey: aBook.! !

!PriceList methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 18:59:05'!
initialize

	prices _ Dictionary new.! !

!PriceList methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:00:48'!
priceFor: aBook 
	
	^prices at: aBook.! !

!PriceList methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 18:59:21'!
set: aBook price: aPrice 
	prices at: aBook put: aPrice.! !


!classDefinition: #Receipt category: 'Tus-Libros'!
Object subclass: #Receipt
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!Receipt methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 18:49:08'!
total
	^total.! !


!Receipt methodsFor: 'initialization' stamp: 'nz 6/14/2021 18:48:47'!
initializeWithTotal: aTransactionTotal 
	
	total := aTransactionTotal.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Receipt class' category: 'Tus-Libros'!
Receipt class
	instanceVariableNames: ''!

!Receipt class methodsFor: 'instance creation' stamp: 'nz 6/14/2021 18:48:27'!
withTotal: aTransactionTotal 

	^self new initializeWithTotal: aTransactionTotal ! !


!classDefinition: #ReceiptBook category: 'Tus-Libros'!
Object subclass: #ReceiptBook
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!ReceiptBook methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 20:07:59'!
isEmpty
	^true.! !


!classDefinition: #ShoppingCart category: 'Tus-Libros'!
Object subclass: #ShoppingCart
	instanceVariableNames: 'entries lastUpdate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!ShoppingCart methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:42:41'!
add: aQuantity of: anItem 

	self assertQuantityIsValid: aQuantity.
	
	entries add: (ShoppingCartEntry for: anItem quantity: aQuantity).! !

!ShoppingCart methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:09:49'!
assertQuantityIsValid: aQuantity

	aQuantity strictlyPositive
		ifFalse: [ self error: self class itemQuantityMustBeGreaterThanZeroErrorDescription ].
	
	aQuantity isInteger
		ifFalse: [ self error: self class itemQuantyMustBeAnIntegerErrorDescription ]! !

!ShoppingCart methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:02:37'!
entries
	^entries.! !

!ShoppingCart methodsFor: 'as yet unclassified' stamp: 'nz 6/14/2021 19:42:36'!
initialize

	entries := OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ShoppingCart class' category: 'Tus-Libros'!
ShoppingCart class
	instanceVariableNames: ''!

!ShoppingCart class methodsFor: 'as yet unclassified' stamp: 'nz 6/9/2021 23:47:56'!
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
