!classDefinition: #ShoppingCartTest category: 'Tus-Libros'!
TestCase subclass: #ShoppingCartTest
	instanceVariableNames: 'isbnBook1 isbnBook2'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/9/2021 00:53:12'!
assert: shoppingCart has: quantity of: item

	self assert: (shoppingCart listItems anySatisfy: [ :anShoppingCartItem | 
		anShoppingCartItem is: quantity of: item.
	] ).! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/9/2021 00:36:01'!
setUp
	
	isbnBook1 := 'ISBN1'.
	isbnBook2 := 'ISBN2'.! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/9/2021 00:09:01'!
test01

	| shoppingCart |
	shoppingCart := ShoppingCart new.
	
	self assert: shoppingCart listItems size equals: 0. ! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/9/2021 00:40:59'!
test02
	| shoppingCart book quantity |

	shoppingCart := ShoppingCart new.
	quantity := 1.
	book := Book for: isbnBook1.
	
	shoppingCart add: quantity of: book.
	
	self assert: shoppingCart listItems size equals: 1.
	self assert: shoppingCart has: quantity of: book.! !

!ShoppingCartTest methodsFor: 'as yet unclassified' stamp: 'AW 6/9/2021 00:43:48'!
test03
	| shoppingCart book1 book2 |

	shoppingCart := ShoppingCart new.
	book1 := Book for: isbnBook1.
	book2 := Book for: isbnBook2.
	
	shoppingCart add: 1 of: book1.
	shoppingCart add: 2 of: book2.
	
	self assert: shoppingCart listItems size equals: 2.
	self assert: shoppingCart has: 1 of: book1.
	self assert: shoppingCart has: 2 of: book2.! !


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


!classDefinition: #ShoppingCart category: 'Tus-Libros'!
Object subclass: #ShoppingCart
	instanceVariableNames: 'items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros'!

!ShoppingCart methodsFor: 'as yet unclassified' stamp: 'AW 6/9/2021 00:36:47'!
add: aQuantity of: anItem 

	items add: (ShoppingCartItem for: anItem quantity: aQuantity).! !

!ShoppingCart methodsFor: 'as yet unclassified' stamp: 'AW 6/9/2021 00:33:10'!
initialize

	items := OrderedCollection new.! !

!ShoppingCart methodsFor: 'as yet unclassified' stamp: 'AW 6/9/2021 00:31:47'!
listItems
	^items.! !


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
