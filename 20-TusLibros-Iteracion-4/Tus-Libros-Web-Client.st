!classDefinition: #CatalogWindow category: 'Tus-Libros-Web-Client'!
Panel subclass: #CatalogWindow
	instanceVariableNames: 'selectedCatalogEntryInfoLayout catalogTitleListMorph cartListMorph cartSummarySlot cartTotalLabel checkoutButtonSlot'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!CatalogWindow methodsFor: 'initialization' stamp: 'nz 7/7/2021 16:37:47'!
buildWindowBody

	^ self layoutMorph
		beRow;
		separation: 15;
		color: Color red;
		axisEdgeWeight: 0;
		addMorph: self buildCatalogHalf;
		addMorph: self buildCartHalf.
		! !

!CatalogWindow methodsFor: 'initialization' stamp: 'nz 7/7/2021 19:29:12'!
defaultExtent
	^1350@600! !

!CatalogWindow methodsFor: 'initialization' stamp: 'nz 7/7/2021 19:15:31'!
initializeForCartId: aCartId 
	
	self titleMorph showButtonsNamed: #( close collapse ).
	self setLabel: 'Alto catalogo de libros de Kent Beck'.
	self model: (CatalogWindowModel forCartId: aCartId).
	self morphExtent: (self defaultExtent).

	"
	Aca usar dos PluggableListMorph para listar los libros del catalogo y los items del carrito
	Podemos asumir que arrancan vacios en el modelo y mandarle un #requestCatalog al modelo
	para que este eventualmente mande el request y tire un evento diciendo #catalogUpdated y
	actualizar en base a eso esta vista.
	
	Luego con cada click sobre un elemento de la lista del catalogo hay que actualizar algun
	label donde este el detalle con el precio al lado del boton de añadir al carrito y el textbox con la cantidad.
	
	Una facil para añadir al carrito es que le pege a la api para añadir el libro y luego por vagancia le pega
	tambien al listCart/. Luego en la respuesta del lisCart llega un evento a la vista #cartListUpdated
	o simil para actualizarla. 
	
	Con el boton de remover hay que hacerle algo similar y ya. 
	
	"
	self buildWindowBody.
	
	self model when: #catalogUpdated send: #updateCatalogTitleList to: self.
	self model when: #cartUpdated send: #updateCartList to: self.
	self model when: #cartEntryAdded send: #refreshCart to: self model.
	self model when: #cartEntryRemoved send: #refreshCart to: self model.
	self model when: #selectedCatalogEntryChanged send: #rebuildSelectedCatalogEntryInfo to: self.
	self model when: #selectedCartEntryChanged send: #rebuildRemoveCartEntryButton to: self.
	self model when: #checkoutSuccessful send: #navigateToTicketWindow: to: self.
	
	self model refreshCatalog.
	
	self openInWorld.! !


!CatalogWindow methodsFor: 'catalog half' stamp: 'nz 7/7/2021 15:24:08'!
buildCatalogHalf
	
	^ LayoutMorph newRow
		separation: 25;
		axisEdgeWeight: 0.5;
		addMorph: self buildCatalogTitleList;
		addMorph: self buildSelectedCatalogEntryInfo;
		yourself.
		! !

!CatalogWindow methodsFor: 'catalog half' stamp: 'nz 7/7/2021 17:11:58'!
buildCatalogTitleList

	^ LayoutMorph newColumn
		separation: 25;
		axisEdgeWeight: 0.5;
		addMorph: (
			LabelMorph
				contents: 'Libros disponibles:'
		);
		addMorph: [
			catalogTitleListMorph _ PluggableListMorph
				model: self model
				listGetter: #catalogEntriesTitles 
				indexGetter: #selectedCatalogEntryIndex
				indexSetter: #selectedCatalogEntryIndex:.
			catalogTitleListMorph
		] value;
		yourself.! !

!CatalogWindow methodsFor: 'catalog half' stamp: 'nz 7/7/2021 15:46:04'!
buildSelectedCatalogEntryInfo
	
	selectedCatalogEntryInfoLayout _ LayoutMorph newColumn
		separation: 25;
		axisEdgeWeight: 0.5;
		yourself.
		
	self rebuildSelectedCatalogEntryInfo.
		
	^selectedCatalogEntryInfoLayout.! !

!CatalogWindow methodsFor: 'catalog half' stamp: 'nz 7/7/2021 16:23:05'!
rebuildSelectedCatalogEntryInfo

	selectedCatalogEntryInfoLayout removeAllMorphs.
	
	self model selectedCatalogEntry ifNil: [
		selectedCatalogEntryInfoLayout addMorph: (LabelMorph contents: 'Seleccione un libro de la izquierda' ).
		^nil.
	].
	
	selectedCatalogEntryInfoLayout 
		addMorph: (
			LabelMorph
				contents: self model selectedCatalogEntry title
		);
		addMorph: (
			LabelMorph
				contents: ('$ ', self model selectedCatalogEntry price asString)
		);
		addMorph: (
			PluggableButtonMorph
				model: self model
				stateGetter: nil
				action: #addSelectedCatalogEntryToCart
				label: 'Add to Cart'
		).! !

!CatalogWindow methodsFor: 'catalog half' stamp: 'nz 7/7/2021 18:21:44'!
updateCatalogTitleList
	
	"Hay que avisarle a mano a la lista que cambió"
	catalogTitleListMorph updateList! !


!CatalogWindow methodsFor: 'cart half' stamp: 'nz 7/7/2021 18:27:15'!
buildCartHalf
	
	^ LayoutMorph newColumn
		separation: 25;
		axisEdgeWeight: 0.5;
		addMorph: self buildCartList;
		addMorph: self buildRemoveCartEntryButton;
		addMorph: self buildCartSummary;
		yourself.
		! !

!CatalogWindow methodsFor: 'cart half' stamp: 'nz 7/7/2021 18:23:56'!
buildCartList
	
	^ LayoutMorph newColumn
		separation: 25;
		axisEdgeWeight: 0.5;
		addMorph: (
			LabelMorph
				contents: 'En el carrito:'
		);
		addMorph: [
			cartListMorph _ PluggableListMorph
				model: self model
				listGetter: #cartEntriesTitles
				indexGetter: #selectedCartEntryIndex
				indexSetter: #selectedCartEntryIndex:.
			cartListMorph
		] value;
		yourself.! !

!CatalogWindow methodsFor: 'cart half' stamp: 'nz 7/7/2021 16:15:31'!
buildCartSummary
	
	^ LayoutMorph newRow
		separation: 25;
		axisEdgeWeight: 0.5;
		addMorph: self buildCartTotal;
		addMorph: self buildCheckoutButton;
		yourself.
		! !

!CatalogWindow methodsFor: 'cart half' stamp: 'nz 7/7/2021 18:55:57'!
buildCartTotal

	cartTotalLabel _ LabelMorph contents: ''.
	self updateCartTotal.
		
	^cartTotalLabel.! !

!CatalogWindow methodsFor: 'cart half' stamp: 'nz 7/7/2021 19:23:48'!
buildCheckoutButton

	checkoutButtonSlot _ LayoutMorph newRow
		separation: 25;
		axisEdgeWeight: 0.5.
		
	self rebuildCheckoutButton.
		
	^checkoutButtonSlot.! !

!CatalogWindow methodsFor: 'cart half' stamp: 'nz 7/7/2021 19:15:31'!
buildRemoveCartEntryButton

	cartSummarySlot _ LayoutMorph newRow
		separation: 25;
		axisEdgeWeight: 0.5;
		yourself.
		
	self rebuildRemoveCartEntryButton .
	
	^cartSummarySlot 
	! !

!CatalogWindow methodsFor: 'cart half' stamp: 'nz 7/7/2021 19:28:47'!
rebuildCheckoutButton

	checkoutButtonSlot removeAllMorphs .
	
	(self model cartTotal > 0) ifTrue: [
		checkoutButtonSlot addMorph: (
			PluggableButtonMorph
				model: self model
				stateGetter: nil
				action: #checkoutCart
				label: 'Checkout'
		).
	] ifFalse: [
		checkoutButtonSlot addMorph: (
			LabelMorph contents: 'Agregá algo al carrito!!'
		).
	].
		! !

!CatalogWindow methodsFor: 'cart half' stamp: 'nz 7/7/2021 19:15:31'!
rebuildRemoveCartEntryButton

	cartSummarySlot removeAllMorphs .
	
	self model selectedCartEntry ifNil: [
		cartSummarySlot addMorph: (
			LabelMorph contents: 'Seleccione un item del carrito para removerlo.'
		).
	] ifNotNil: [
		cartSummarySlot addMorph: (
			PluggableButtonMorph
				model: self model
				stateGetter: nil
				action: #removeSelectedCartEntry
				label: 'Remover ', self model selectedCartEntry title
		).
	].

! !

!CatalogWindow methodsFor: 'cart half' stamp: 'nz 7/7/2021 19:27:09'!
updateCartList
	
	"Hay que avisarle a mano a la lista que cambió"
	cartListMorph updateList.
	self updateCartTotal.
	self rebuildCheckoutButton.! !

!CatalogWindow methodsFor: 'cart half' stamp: 'nz 7/7/2021 18:56:02'!
updateCartTotal

	cartTotalLabel contents: 'Total $ ', self model cartTotal asString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CatalogWindow class' category: 'Tus-Libros-Web-Client'!
CatalogWindow class
	instanceVariableNames: ''!

!CatalogWindow class methodsFor: 'instance creation' stamp: 'nz 7/7/2021 01:00:56'!
forCartId: aCartId 
	^self new initializeForCartId: aCartId ! !


!classDefinition: #CreateCartWindow category: 'Tus-Libros-Web-Client'!
Panel subclass: #CreateCartWindow
	instanceVariableNames: 'userNameTextBox passwordTextBox createCartButton'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!CreateCartWindow methodsFor: 'as yet unclassified' stamp: 'nz 7/1/2021 22:31:13'!
buildCreateCartButtonRow
	| layout |
	
	createCartButton _ PluggableButtonMorph
		model: self model
		stateGetter: nil
		action: #createCartRequest
		label: 'Create Cart'.
	
	layout _ LayoutMorph newRow.
	layout
		separation: 25;
		axisEdgeWeight: 0.5;
		addMorph: createCartButton.
	^layout .! !

!CreateCartWindow methodsFor: 'as yet unclassified' stamp: 'AW 7/1/2021 18:39:35'!
buildCreateCartWindow
	
	self layoutMorph 
		beColumn;
		separation: 15;
		axisEdgeWeight: 0;
		addMorph: self buildUserAndPasswordTextboxRow;
		addMorph: self buildCreateCartButtonRow.! !

!CreateCartWindow methodsFor: 'as yet unclassified' stamp: 'nz 7/1/2021 22:28:23'!
buildTextBoxMorphWithLabel: aLabel getter: aGetter setter: aSetter 
	| textBox layout |
	
	textBox _ TextModelMorph
		textProvider: self model
		textGetter: aGetter
		textSetter: aSetter.
		
	textBox textMorph
		setProperty: #keyStroke:
		toValue: [ :key |
			textBox textMorph acceptContents ].
		
	textBox
		borderWidth: 1;
		borderColor: Color skyBlue;
		morphWidth: 300;
		morphHeight: 20.
		
	layout _ LayoutMorph newRow.
	layout
		separation: 25;
		axisEdgeWeight: 0.5;
		addMorph: (LabelMorph contents: aLabel);
		addMorph: textBox.
	^ layout.! !

!CreateCartWindow methodsFor: 'as yet unclassified' stamp: 'nz 7/1/2021 22:29:31'!
buildUserAndPasswordTextboxRow
	| layout |
	
	userNameTextBox _ self
		buildTextBoxMorphWithLabel: 'User Name'
		getter: #userName
		setter: #userName:.
		
	passwordTextBox _ self
		buildTextBoxMorphWithLabel: 'Password'
		getter: #password
		setter: #password:.
	
	layout _ LayoutMorph newRow.
	layout
		separation: 25;
		axisEdgeWeight: 0.5;
		addMorph: userNameTextBox;
		addMorph: passwordTextBox.
		
	
	
	^layout.! !

!CreateCartWindow methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 00:40:45'!
defaultExtent
	^1058@292! !

!CreateCartWindow methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 01:02:09'!
initialize

	super initialize.
	self titleMorph showButtonsNamed: #( close collapse ).
	self setLabel: 'Cree su carrito'.
	self model: CreateCartWindowModel new.
	self morphExtent: (self defaultExtent).
	
	self buildCreateCartWindow.
	
	self model when: self model class cartCreatedEvent send: #navigateToCatalogWindow to: self.
	self model when: self model class cartCreationErrorEvent send: #showBadLoginErrorDialog to: self.
	
	self openInWorld.! !


!CreateCartWindow methodsFor: 'navigation' stamp: 'nz 7/7/2021 01:04:59'!
navigateToCatalogWindow
	
	"
	Hacer algo para movernos a la pantalla de catalogo
	"
	CatalogWindow forCartId: self model cartId.
	self delete.! !


!CreateCartWindow methodsFor: 'dialogs' stamp: 'nz 7/7/2021 00:45:52'!
showBadLoginErrorDialog
	MessageDialogWindow alerta: 'Login Inválido!!'.! !


!classDefinition: #MessageDialogWindow category: 'Tus-Libros-Web-Client'!
Panel subclass: #MessageDialogWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!MessageDialogWindow methodsFor: 'initialization' stamp: 'nz 7/7/2021 00:41:55'!
defaultExtent
	^430@136! !

!MessageDialogWindow methodsFor: 'initialization' stamp: 'nz 7/7/2021 00:44:18'!
initializeAlerta: aMessageText 
	
	
	self setLabel: 'Atención!!'.
	self morphExtent: self defaultExtent.
	
	self addMorph: (
		LayoutMorph newColumn
			beColumn;
			separation: 15;
			color: Color lightBlue;
			borderColor: Color darkGray;
			borderWidth: 2;
			morphExtent: self defaultExtent;
			axisEdgeWeight: 0;
			addMorph: (
				LabelMorph contents: aMessageText
			);
			addMorph: (
				self buildOkButton
			);
			yourself
	).
		
	self openInWorld.
	! !


!MessageDialogWindow methodsFor: 'as yet unclassified' stamp: 'nz 7/6/2021 23:45:42'!
buildOkButton

	^PluggableButtonMorph
		model: self
		stateGetter: nil
		action: #closeDialog
		label: 'Ok'.
	! !

!MessageDialogWindow methodsFor: 'as yet unclassified' stamp: 'nz 7/6/2021 23:48:00'!
closeDialog
	self delete.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MessageDialogWindow class' category: 'Tus-Libros-Web-Client'!
MessageDialogWindow class
	instanceVariableNames: ''!

!MessageDialogWindow class methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 00:43:50'!
alerta: aMessageText 

	^self new initializeAlerta: aMessageText.! !


!classDefinition: #BookEntry category: 'Tus-Libros-Web-Client'!
Object subclass: #BookEntry
	instanceVariableNames: 'title isbn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!BookEntry methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 16:28:19'!
initializeIsbn: anIsbn title: aTitle
	isbn _ anIsbn.
	title _ aTitle.! !

!BookEntry methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 16:27:36'!
isbn
	^isbn! !

!BookEntry methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 16:26:39'!
title
	^title! !


!classDefinition: #CartEntry category: 'Tus-Libros-Web-Client'!
BookEntry subclass: #CartEntry
	instanceVariableNames: 'quantity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!CartEntry methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 16:29:19'!
initializeQuantity: aQuantity title: aTitle isbn: anIsbn 
	
	self initializeIsbn: anIsbn title: aTitle.
	quantity := aQuantity.! !

!CartEntry methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 16:30:34'!
quantity
	^quantity! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CartEntry class' category: 'Tus-Libros-Web-Client'!
CartEntry class
	instanceVariableNames: ''!

!CartEntry class methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 16:30:03'!
quantity: aQuantity title: aTitle isbn: anIsbn
	
	^self new initializeQuantity: aQuantity title: aTitle isbn: anIsbn ! !


!classDefinition: #CatalogEntry category: 'Tus-Libros-Web-Client'!
BookEntry subclass: #CatalogEntry
	instanceVariableNames: 'price'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!CatalogEntry methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 16:26:07'!
price
	^price! !


!CatalogEntry methodsFor: 'initialization' stamp: 'nz 7/7/2021 16:28:48'!
initializePrice: aPrice title: aTitle isbn: anIsbn 
	
	self initializeIsbn: anIsbn title: aTitle.
	price := aPrice.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CatalogEntry class' category: 'Tus-Libros-Web-Client'!
CatalogEntry class
	instanceVariableNames: ''!

!CatalogEntry class methodsFor: 'instance creation' stamp: 'nz 7/7/2021 15:14:51'!
price: aPrice title: aTitle isbn: anIsbn
	
	^self new initializePrice: aPrice title: aTitle isbn: anIsbn ! !


!classDefinition: #CatalogWindowModel category: 'Tus-Libros-Web-Client'!
Object subclass: #CatalogWindowModel
	instanceVariableNames: 'cartId selectedCatalogEntryIndex catalogEntries cartEntries selectedCartEntryIndex cartTotal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!CatalogWindowModel methodsFor: 'initialization' stamp: 'nz 7/7/2021 18:58:10'!
initializeForCartId: aCartId 

	cartId _ aCartId.
	selectedCatalogEntryIndex _ 0.
	selectedCartEntryIndex _ 0.
	cartTotal _ 0.
	
	catalogEntries _ OrderedCollection new.
		
		
	cartEntries _ OrderedCollection new.! !


!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 18:45:48'!
addSelectedCatalogEntryToCart
	
	self
		triggerEvent: #cartEntryAdded
		with: self.! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 19:01:50'!
calculateCartTotal
	
	^cartEntries sum: [ :entry | self priceForIsbn: entry isbn ] ifEmpty: [ 0 ].! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 16:21:26'!
cartEntriesTitles
	^cartEntries collect: [ :entry | entry title, ' x', entry quantity asString ].! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 18:57:58'!
cartTotal
	^cartTotal! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 15:13:44'!
catalogEntriesTitles
	^catalogEntries collect: [ :entry | entry title ].! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 19:11:02'!
checkoutCart
	
	"Pegarle a la API"
	| ticket |
	ticket _ TicketModel new.
	self triggerEvent: #checkoutSuccessful with: ticket.! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 19:05:25'!
priceForIsbn: anIsbn

	catalogEntries
		detect: [ :entry | entry isbn = anIsbn ] 
		ifFound: [ :entry | ^entry price ] 
		ifNone: [ self error: self class noPriceForIsbnErrorDescription ].! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 19:27:59'!
refreshCart
	
	cartEntries _ OrderedCollection 
		with: (CartEntry quantity: 4 title: 'Refactoring' isbn: '0001')
		with: (CartEntry quantity: 9 title: 'TDD by example' isbn: '0002').
		
	cartTotal _ self calculateCartTotal.
	
	self 
		triggerEvent: #cartUpdated
		with: self.! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 16:43:54'!
refreshCatalog
	
	catalogEntries _ OrderedCollection
		with: (CatalogEntry price: 29.90 title: 'Refactoring' isbn: '0001')
		with: (CatalogEntry price: 24.90 title: 'TDD by example' isbn: '0002').
	
	self 
		triggerEvent: #catalogUpdated
		with: self.! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 18:48:52'!
removeSelectedCartEntry
	
	self
		triggerEvent: #cartEntryRemoved
		with: self.! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 18:30:29'!
selectedCartEntry
	selectedCartEntryIndex isZero ifTrue: [ ^nil ] ifFalse: [ ^cartEntries at: selectedCartEntryIndex ].! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 16:33:22'!
selectedCartEntryIndex
	
	^selectedCartEntryIndex! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 18:43:35'!
selectedCartEntryIndex: aSmallInteger 
	
	selectedCartEntryIndex _ aSmallInteger.
	
	self
		triggerEvent: #selectedCartEntryChanged
		with: self.! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 16:23:05'!
selectedCatalogEntry
	selectedCatalogEntryIndex isZero ifTrue: [ ^nil ] ifFalse: [ ^catalogEntries at: selectedCatalogEntryIndex ].! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 15:01:42'!
selectedCatalogEntryIndex
	^selectedCatalogEntryIndex.! !

!CatalogWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 15:18:47'!
selectedCatalogEntryIndex: aSmallInteger 

	selectedCatalogEntryIndex _ aSmallInteger.
	
	self
		triggerEvent: #selectedCatalogEntryChanged
		with: self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CatalogWindowModel class' category: 'Tus-Libros-Web-Client'!
CatalogWindowModel class
	instanceVariableNames: ''!

!CatalogWindowModel class methodsFor: 'instance creation' stamp: 'nz 7/7/2021 01:05:16'!
forCartId: aCartId 
	^self new initializeForCartId: aCartId ! !

!CatalogWindowModel class methodsFor: 'instance creation' stamp: 'nz 7/7/2021 19:06:02'!
noPriceForIsbnErrorDescription
	^'No hay precio para el isbn en cuestion. Parece ser de un libro que no esta en el catalogo.'! !


!classDefinition: #CreateCartWindowModel category: 'Tus-Libros-Web-Client'!
Object subclass: #CreateCartWindowModel
	instanceVariableNames: 'userName password tusLibrosClient cartId lastError'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!CreateCartWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 00:58:44'!
cartId
	^cartId.! !

!CreateCartWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/7/2021 00:59:25'!
createCartRequest

	[
		cartId := tusLibrosClient
			createCart: userName
			password: password.
		self
			triggerEvent: self class cartCreatedEvent
			with: self 
	]
		on: Error - MessageNotUnderstood
		do: [ :error |
			lastError := error.
			self
				triggerEvent: self class cartCreationErrorEvent
				with: self.
		].
	"
	en el caso de que este ok: 
	- actualizar el modelo (guardarnos el id de carrito)
	- tirar un evento avisando que tenemos un carrito 
	en el caso de que falle:
	- tirar un evento con informacion del error
	
	despues:
	- capturar eventos en la vista y actuar en consecencia
	"! !

!CreateCartWindowModel methodsFor: 'as yet unclassified' stamp: 'AW 7/6/2021 19:13:31'!
initialize
	userName _ ''.
	password _ ''.
	tusLibrosClient := TusLibrosClient new.! !

!CreateCartWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/1/2021 22:17:32'!
password
	^ password.! !

!CreateCartWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/1/2021 22:32:51'!
password: aText 
	password _ aText! !

!CreateCartWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/1/2021 22:07:45'!
userName
	^userName! !

!CreateCartWindowModel methodsFor: 'as yet unclassified' stamp: 'AW 7/1/2021 18:55:49'!
userName: aUsername 
	userName _ aUsername.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreateCartWindowModel class' category: 'Tus-Libros-Web-Client'!
CreateCartWindowModel class
	instanceVariableNames: ''!

!CreateCartWindowModel class methodsFor: 'events' stamp: 'AW 7/6/2021 19:36:18'!
cartCreatedEvent
	^#cartCreated! !

!CreateCartWindowModel class methodsFor: 'events' stamp: 'AW 7/6/2021 19:44:33'!
cartCreationErrorEvent
	^#cartCreationErrorEvent! !


!classDefinition: #TicketModel category: 'Tus-Libros-Web-Client'!
Object subclass: #TicketModel
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!


!classDefinition: #TusLibrosClient category: 'Tus-Libros-Web-Client'!
Object subclass: #TusLibrosClient
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!TusLibrosClient methodsFor: 'as yet unclassified' stamp: 'AW 7/6/2021 19:20:01'!
createCart: aClientId password: aPassword 

	| fieldDict response |
	fieldDict _ Dictionary new.
	fieldDict at: 'clientId' put: aClientId.
	fieldDict at: 'password' put: aPassword.
	response _ WebClient
		htmlSubmit: self url, '/createCart'
		fields: fieldDict.
	response isSuccess
		ifTrue: [ ^ (WebUtils jsonDecode: response content readStream) at: 'cartId' ]
		ifFalse: [ ^ self error: response content ].
		
! !

!TusLibrosClient methodsFor: 'as yet unclassified' stamp: 'nz 7/1/2021 23:01:08'!
url
	^'http://localhost:8080'.! !
