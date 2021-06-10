!classDefinition: #CheckOutTest category: 'Tus-Libros'!
TestCase subclass: #CheckOutTest
	instanceVariableNames: 'creditCardNumber1 expirationDate1 cardOwner1 validCreditCard1'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!CheckOutTest methodsFor: 'as yet unclassified' stamp: 'nz 6/10/2021 00:28:05'!
setUp

	creditCardNumber1 _ '4182418241824182'.
	expirationDate1 _ GregorianMonthOfYear mayOf: (GregorianYear number: 2030).
	cardOwner1 _ 'PEPE SANCHEZ'.
	
	validCreditCard1 _ CreditCard
		number: creditCardNumber1
		owner: cardOwner1
		expiration: expirationDate1.
	! !

!CheckOutTest methodsFor: 'as yet unclassified' stamp: 'nz 6/10/2021 00:26:31'!
test01

	| aCashier bookPrices cart  |
	
	bookPrices _ PriceList new.
	
	aCashier _ Cashier with: bookPrices.
	
	cart _ ShoppingCart new.
	
	self should: [ aCashier checkOut: cart payingWith: validCreditCard1. ]
		raise: Error - MessageNotUnderstood
		description: Cashier cantCheckoutEmptyCartErrorDescription.! !

!CheckOutTest methodsFor: 'as yet unclassified' stamp: 'nz 6/10/2021 00:35:19'!
test02

	| aCashier book bookPrices cart isbn1 transaction |
	
	isbn1 _ '12938102398'.
	book _ Book for: isbn1.
	
	bookPrices _ PriceList new.
	bookPrices set: book price: 124.
	
	aCashier _ Cashier with: bookPrices.
	
	cart _ ShoppingCart new.
	cart add: 1 of: book.
	
	transaction _ aCashier checkOut: cart payingWith: validCreditCard1 .
	
	self assert: 124 equals: transaction total.! !


!classDefinition: #ShoppingCartTest category: 'Tus-Libros'!
TestCase subclass: #ShoppingCartTest
	instanceVariableNames: 'isbnBook1 isbnBook2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:10:12'!
assert: shoppingCart has: quantity of: item

	self assert: (shoppingCart items anySatisfy: [ :anShoppingCartItem | 
		anShoppingCartItem is: quantity of: item.
	] ).! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/9/2021 00:36:01'!
setUp
	
	isbnBook1 := 'ISBN1'.
	isbnBook2 := 'ISBN2'.! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:10:12'!
test01

	| shoppingCart |
	shoppingCart := ShoppingCart new.
	
	self assert: shoppingCart items size equals: 0. ! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:10:12'!
test02
	| shoppingCart book quantity |

	shoppingCart := ShoppingCart new.
	quantity := 1.
	book := Book for: isbnBook1.
	
	shoppingCart add: quantity of: book.
	
	self assert: shoppingCart items size equals: 1.
	self assert: shoppingCart has: quantity of: book.! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:10:12'!
test03
	| shoppingCart book1 book2 |

	shoppingCart := ShoppingCart new.
	book1 := Book for: isbnBook1.
	book2 := Book for: isbnBook2.
	
	shoppingCart add: 1 of: book1.
	shoppingCart add: 2 of: book2.
	
	self assert: shoppingCart items size equals: 2.
	self assert: shoppingCart has: 1 of: book1.
	self assert: shoppingCart has: 2 of: book2.! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 19:58:51'!
test04
	| shoppingCart book1 |

	shoppingCart := ShoppingCart new.
	book1 := Book for: isbnBook1.
	
	self  should: [ shoppingCart add: -2 of: book1. ]
		raise: Error - MessageNotUnderstood 
		description: ShoppingCart itemQuantityMustBeGreaterThanZeroErrorDescription.
	! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 19:58:45'!
test05
	| shoppingCart book1 |

	shoppingCart := ShoppingCart new.
	book1 := Book for: isbnBook1.
	
	self  should: [ shoppingCart add: 0 of: book1. ]
		raise: Error - MessageNotUnderstood 
		description: ShoppingCart itemQuantityMustBeGreaterThanZeroErrorDescription.
	! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:06:15'!
test06
	| shoppingCart book1 |

	shoppingCart := ShoppingCart new.
	book1 := Book for: isbnBook1.
	
	self  should: [ shoppingCart add: 1.5 of: book1. ]
		raise: Error - MessageNotUnderstood 
		description: ShoppingCart itemQuantityMustBeGreaterThanZeroErrorDescription .
	! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:16:04'!
test07
	| shoppingCart afterUpdateTimestamp beforeUpdateTimestamp |

	beforeUpdateTimestamp := DateAndTime now.
	shoppingCart := ShoppingCart new.
	afterUpdateTimestamp := DateAndTime now.
	
	self assert: (shoppingCart lastUpdateTimeStamp 
		between: beforeUpdateTimestamp and: afterUpdateTimestamp).! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:19:05'!
test08
	| shoppingCart afterUpdateTimestamp beforeUpdateTimestamp |
	
	shoppingCart := ShoppingCart new.
		
	beforeUpdateTimestamp := DateAndTime now.
	shoppingCart add: 4 of: (Book for: isbnBook1).
	afterUpdateTimestamp := DateAndTime now.
	
	self assert: (shoppingCart lastUpdateTimeStamp 
		between: beforeUpdateTimestamp and: afterUpdateTimestamp).! !


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
	instanceVariableNames: 'priceList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!Cashier methodsFor: 'initialization' stamp: 'nz 6/10/2021 00:19:07'!
initializeWith: aPriceList 
	
	priceList := aPriceList.! !


!Cashier methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:10:12'!
checkOut: aShoppingCart payingWith: aCreditCard 

	aShoppingCart items ifEmpty: [
		^self error: self class cantCheckoutEmptyCartErrorDescription .
	].

	^Transaction new.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'Tus-Libros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'nz 6/10/2021 00:18:44'!
with: aPriceList 
	
	^self new initializeWith: aPriceList ! !


!Cashier class methodsFor: 'as yet unclassified' stamp: 'nz 6/10/2021 00:21:44'!
cantCheckoutEmptyCartErrorDescription
	^'Cannot checkout an empty shopping cart!!'.! !


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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!PriceList methodsFor: 'as yet unclassified' stamp: 'nz 6/10/2021 00:32:24'!
set: aBook price: aPrice 
	! !


!classDefinition: #ShoppingCart category: 'Tus-Libros'!
Object subclass: #ShoppingCart
	instanceVariableNames: 'items lastUpdate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!ShoppingCart methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:21:01'!
add: aQuantity of: anItem 

	self assertQuantityIsValid: aQuantity.
	
	items add: (ShoppingCartItem for: anItem quantity: aQuantity).
	self updateTimestamp.! !

!ShoppingCart methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:09:49'!
assertQuantityIsValid: aQuantity

	aQuantity strictlyPositive
		ifFalse: [ self error: self class itemQuantityMustBeGreaterThanZeroErrorDescription ].
	
	aQuantity isInteger
		ifFalse: [ self error: self class itemQuantyMustBeAnIntegerErrorDescription ]! !

!ShoppingCart methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:20:43'!
initialize

	items := OrderedCollection new.
	self updateTimestamp.! !

!ShoppingCart methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:10:12'!
items
	^items.! !

!ShoppingCart methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:17:01'!
lastUpdateTimeStamp
	
	^lastUpdate! !

!ShoppingCart methodsFor: 'as yet unclassified' stamp: 'AW 6/10/2021 20:20:43'!
updateTimestamp

	^ lastUpdate := DateAndTime now! !

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


!classDefinition: #ShoppingCartItem category: 'Tus-Libros'!
Object subclass: #ShoppingCartItem
	instanceVariableNames: 'item quantity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!ShoppingCartItem methodsFor: 'initialization' stamp: 'AW 6/9/2021 00:31:25'!
initializeFor: anItem quantity: aQuantity 
	
	item := anItem.
	quantity := aQuantity.! !


!ShoppingCartItem methodsFor: 'accessing' stamp: 'AW 6/9/2021 00:32:01'!
item
	
	^item! !

!ShoppingCartItem methodsFor: 'accessing' stamp: 'AW 6/9/2021 00:32:11'!
quantity
	
	^quantity! !


!ShoppingCartItem methodsFor: 'testing' stamp: 'AW 6/9/2021 00:54:31'!
is: aQuantity of: anItem 
	^(item = anItem) and: [ quantity = aQuantity ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ShoppingCartItem class' category: 'Tus-Libros'!
ShoppingCartItem class
	instanceVariableNames: ''!

!ShoppingCartItem class methodsFor: 'instance creation' stamp: 'AW 6/9/2021 00:31:03'!
for: anItem quantity: aQuantity 

	^self new initializeFor: anItem quantity: aQuantity ! !


!classDefinition: #Transaction category: 'Tus-Libros'!
Object subclass: #Transaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!Transaction methodsFor: 'as yet unclassified' stamp: 'nz 6/10/2021 00:34:26'!
total
	^124.! !
