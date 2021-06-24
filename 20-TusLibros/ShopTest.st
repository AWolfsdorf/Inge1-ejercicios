'From Cuis 5.0 [latest update: #4532] on 24 June 2021 at 1:43:54 am'!
!classDefinition: #ShopTest category: 'Tus-Libros'!
TestCase subclass: #ShopTest
	instanceVariableNames: 'creditCard1 stubs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!ShopTest methodsFor: 'as yet unclassified' stamp: 'nz 6/23/2021 00:46:42'!
setUp

	stubs := TestStubs new.! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 01:32:59'!
test01InvalidClientShallNotPass
	
	| shop |
	
	shop := Shop
		withUserAuthenticator: (MockUserAuthenticator alwaysReturning: false) 
		prices: stubs priceList
		merchantProcessor: stubs mockAlwaysOkMerchantProcessor 
		timeProvider: stubs timeProvider.
	
	self should: [ shop createCartClientId: 3 password: '123'. ]
		raise: Error - MessageNotUnderstood
		withMessageText: Shop incorrectPasswordOrClientIdErrorDescription.	
	
	! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 01:37:38'!
test02NewCartsAreEmpty
	
	| shop cartId cartItems |
	
	shop := Shop 
		withUserAuthenticator: (MockUserAuthenticator alwaysReturning: true) 
		prices: stubs priceList 
		merchantProcessor: stubs mockAlwaysOkMerchantProcessor 
		timeProvider: stubs timeProvider.
	
	cartId := shop createCartClientId: 3 password: '1234'.
	
	cartItems := shop listCart: cartId.
	
	self assert: cartItems isEmpty.! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 01:38:17'!
test03ListCartWithOneItem
	
	| shop cartId cartItems bookIsbn quantity |
	
	shop := Shop 
		withUserAuthenticator: (MockUserAuthenticator alwaysReturning: true) 
		prices: stubs priceList 
		merchantProcessor: stubs mockAlwaysOkMerchantProcessor 
		timeProvider: stubs timeProvider.
	
	cartId := shop createCartClientId: 3 password: '1234'.
	
	quantity := 2.
	bookIsbn := 'book_isbn'.
		
	shop add: quantity of: bookIsbn to: cartId.
	
	cartItems := shop listCart: cartId.
	
	self assert: cartItems size equals: 1.
	self assert: cartItems first quantity equals: quantity.
	self assert: cartItems first item equals: bookIsbn.! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 01:38:40'!
test04ListInvalidCartShouldRaiseError
	
	| shop |
	
	shop := Shop withUserAuthenticator: (MockUserAuthenticator alwaysReturning: true) prices: stubs priceList merchantProcessor: stubs mockAlwaysOkMerchantProcessor timeProvider: stubs timeProvider.
	
	self should: [ shop listCart: 15 ]
		raise: Error - MessageNotUnderstood 
		withMessageText: Shop invalidCartIdErrorDescription.
	! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 01:39:39'!
test05AddItemToCartDoesntModifyOtherCarts
	
	| shop bookIsbn cartId1 cartId2 quantity |
	
	shop := Shop withUserAuthenticator: (MockUserAuthenticator alwaysReturning: true) prices: stubs priceList merchantProcessor: stubs mockAlwaysOkMerchantProcessor timeProvider: stubs timeProvider.
	
	cartId1 := shop createCartClientId: 3 password: '1234'.
	cartId2 := shop createCartClientId: 4 password: '12345'.
	
	quantity := 2.
	bookIsbn := 'book_isbn'.
		
	shop add: quantity of: bookIsbn to: cartId1.
	
	self assert: (shop listCart: cartId2) isEmpty.
	! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 01:40:21'!
test06CheckoutInvalidCartIdShouldRaiseError
	
	| shop |
	
	shop := Shop withUserAuthenticator: (MockUserAuthenticator alwaysReturning: true) prices: stubs priceList merchantProcessor: stubs mockAlwaysOkMerchantProcessor timeProvider: stubs timeProvider.
	
	self should: [ shop checkOut: 16 payingWith: creditCard1 ]
		raise: Error - MessageNotUnderstood
		withMessageText: Shop invalidCartIdErrorDescription.
	! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 01:40:45'!
test07CheckoutUsesTheCashier
	
	| shop cartId |
	
	shop := Shop withUserAuthenticator: (MockUserAuthenticator alwaysReturning: true) prices: stubs priceList merchantProcessor: stubs mockAlwaysOkMerchantProcessor timeProvider: stubs timeProvider.
	
	cartId := shop createCartClientId: 15 password: '1234'.
	
	self should: [ shop checkOut: cartId payingWith: stubs validCreditCard ]
		raise: Error - MessageNotUnderstood
		withMessageText: Cashier cantCheckoutEmptyCartErrorDescription.
	! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 01:43:21'!
test08ListPurchasesOnOnlyOneBuyClient
	
	| shop cartId clientId password purchases |
	
	shop := Shop withUserAuthenticator: (MockUserAuthenticator alwaysReturning: true) prices: stubs priceList merchantProcessor: stubs mockAlwaysOkMerchantProcessor timeProvider: stubs timeProvider.
		
	clientId := 15.
	password := '123456'.
	cartId := shop createCartClientId: clientId password: password.
	
	shop add: 2 of: stubs book1 to: cartId.
	
	shop checkOut: cartId payingWith: stubs validCreditCard.
	
	purchases := shop listPurchasesOf: clientId with: password.
	self assert: purchases total equals: 100.
	self assert: purchases items size equals: 2.
	self assert: (purchases items occurrencesOf: stubs book1) equals: 2.
	! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 00:30:35'!
test09
	
	| shop cartId clientId password purchases |
	
	shop := Shop withUserAuthenticator: (MockUserAuthenticator alwaysReturning: true) prices: stubs priceList merchantProcessor: stubs mockAlwaysOkMerchantProcessor timeProvider: stubs timeProvider.
		
	clientId := 15.
	password := '123456'.
	cartId := shop createCartClientId: clientId password: password.
	
	shop add: 2 of: stubs book1 to: cartId.
	
	shop add: 1 of: stubs book2 to: cartId.
	
	shop add: 1 of: stubs book3 to: cartId.
	
	shop checkOut: cartId payingWith: stubs validCreditCard.
	
	purchases := shop listPurchasesOf: clientId with: password.
	self assert: purchases total equals: 150.
	self assert: purchases items size equals: 4.
	self assert: (purchases items occurrencesOf: stubs book1) equals: 2.
	self assert: (purchases items occurrencesOf: stubs book2) equals: 1.
	self assert: (purchases items occurrencesOf: stubs book3) equals: 1.
	! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 00:30:35'!
test10
	
	| shop cartId clientId password |
	
	shop := Shop withUserAuthenticator: (MockUserAuthenticator alwaysReturning: true) prices: stubs priceList merchantProcessor: stubs mockAlwaysOkMerchantProcessor timeProvider: stubs timeProvider.
		
	clientId := 15.
	password := '123456'.
	cartId := shop createCartClientId: clientId password: password.
	
	shop add: 1 of: stubs book1 to: cartId.
	
	self
		should: [ shop
				checkOut: cartId
				payingWith: stubs invalidNumberCreditCard. ]
		raise: Error - MessageNotUnderstood
		withMessageText: Cashier invalidCreditCardNumberErrorDescription.
	! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 00:30:35'!
test11
	
	| shop cartId clientId password purchases cartId2 |
	
	shop := Shop withUserAuthenticator: (MockUserAuthenticator alwaysReturning: true) prices: stubs priceList merchantProcessor: stubs mockAlwaysOkMerchantProcessor timeProvider: stubs timeProvider.
		
	clientId := 15.
	password := '123456'.
	
	cartId := shop createCartClientId: clientId password: password.
	shop add: 2 of: stubs book1 to: cartId.
	shop add: 1 of: stubs book2 to: cartId.
	shop add: 1 of: stubs book3 to: cartId.
	shop checkOut: cartId payingWith: stubs validCreditCard.
	
	cartId2 := shop createCartClientId: clientId password: password.
	shop add: 1 of: stubs book1 to: cartId2.
	shop add: 1 of: stubs book3 to: cartId2.
	shop checkOut: cartId2 payingWith: stubs validCreditCard.
	
	purchases := shop listPurchasesOf: clientId with: password.
	self assert: 230 equals: purchases total.
	self assert: 6 equals: purchases items size.
	self assert: (purchases items occurrencesOf: stubs book1) equals: 3.
	self assert: (purchases items occurrencesOf: stubs book2) equals: 1.
	self assert: (purchases items occurrencesOf: stubs book3) equals: 2.
	! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 00:30:35'!
test12
	
	| shop clientId password |
	
	shop := Shop withUserAuthenticator: (MockUserAuthenticator alwaysReturning: false) prices: stubs priceList merchantProcessor: stubs mockAlwaysOkMerchantProcessor timeProvider: stubs timeProvider.
		
	clientId := 15.
	password := '123456'.
	
	self should: [ shop listPurchasesOf: clientId with: password ] 
		raise: Error - MessageNotUnderstood 
		withMessageText: Shop incorrectPasswordOrClientIdErrorDescription.
	! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 00:30:35'!
test13
	
	| shop cartId clientId1 clientId2 password client1purchases cartId2 client2purchases |
	
	shop := Shop withUserAuthenticator: (MockUserAuthenticator alwaysReturning: true) prices: stubs priceList merchantProcessor: stubs mockAlwaysOkMerchantProcessor timeProvider: stubs timeProvider.
		
	clientId1 := 15.
	clientId2 := 42.
	password := '123456'.
	
	cartId := shop createCartClientId: clientId1 password: password.
	shop add: 2 of: stubs book1 to: cartId.
	shop add: 1 of: stubs book2 to: cartId.
	shop add: 1 of: stubs book3 to: cartId.
	shop checkOut: cartId payingWith: stubs validCreditCard.
	
	cartId2 := shop createCartClientId: clientId2 password: password.
	shop add: 1 of: stubs book1 to: cartId2.
	shop add: 1 of: stubs book3 to: cartId2.
	shop checkOut: cartId2 payingWith: stubs validCreditCard.
	
	client1purchases := shop listPurchasesOf: clientId1 with: password.
	self assert: 150 equals: client1purchases total.
	self assert: 4 equals: client1purchases items size.
	
	client2purchases := shop listPurchasesOf: clientId2 with: password.
	self assert: 80 equals: client2purchases total.
	self assert: 2 equals: client2purchases items size.
	! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 01:18:05'!
test14
	
	| shop cartId password clientId timeProvider |
	
	timeProvider := stubs timeProvider.
	shop := Shop 
		withUserAuthenticator: (MockUserAuthenticator alwaysReturning: true) 
		prices: stubs priceList 
		merchantProcessor: stubs mockAlwaysOkMerchantProcessor 
		timeProvider: timeProvider.
		
	clientId := 15.
	password := '123456'.
	
	cartId := shop createCartClientId: clientId password: password.
	
	timeProvider toTheFuture: 31 * minute.
	
	self should: [ shop checkOut: cartId payingWith: stubs validCreditCard ]
		raise: Error - MessageNotUnderstood
		withMessageText: Shop expiredCartErrorDescription.
	
	! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 01:20:33'!
test15
	
	| shop cartId password clientId timeProvider |
	
	timeProvider := stubs timeProvider.
	shop := Shop 
		withUserAuthenticator: (MockUserAuthenticator alwaysReturning: true) 
		prices: stubs priceList 
		merchantProcessor: stubs mockAlwaysOkMerchantProcessor 
		timeProvider: timeProvider.
		
	clientId := 15.
	password := '123456'.
	
	timeProvider toTheFuture: 31 * minute.
	
	cartId := shop createCartClientId: clientId password: password.
		
	self should: [ shop checkOut: cartId payingWith: stubs validCreditCard ]
		raise: Error - MessageNotUnderstood
		withMessageText: Cashier cantCheckoutEmptyCartErrorDescription.
	
	! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'AW 6/24/2021 01:27:17'!
test16
	
	| shop cartId password clientId timeProvider |
	
	timeProvider := stubs timeProvider.
	shop := Shop 
		withUserAuthenticator: (MockUserAuthenticator alwaysReturning: true) 
		prices: stubs priceList 
		merchantProcessor: stubs mockAlwaysOkMerchantProcessor 
		timeProvider: timeProvider.
		
	clientId := 15.
	password := '123456'.
	
	cartId := shop createCartClientId: clientId password: password.
	
	timeProvider toTheFuture: 31 * minute.
	
	self should: [ shop add: 12 of: stubs book1 to: cartId ]
		raise: Error - MessageNotUnderstood
		withMessageText: Shop expiredCartErrorDescription.
	
	! !
