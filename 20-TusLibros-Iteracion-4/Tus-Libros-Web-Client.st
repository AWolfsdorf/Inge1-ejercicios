!classDefinition: #CatalogWindow category: 'Tus-Libros-Web-Client'!
Panel subclass: #CatalogWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!CatalogWindow methodsFor: 'initialization' stamp: 'nz 7/7/2021 01:07:05'!
defaultExtent
	^1058@292! !

!CatalogWindow methodsFor: 'initialization' stamp: 'nz 7/7/2021 01:44:25'!
initializeForCartId: aCartId 
	
	self titleMorph showButtonsNamed: #( close collapse ).
	self setLabel: 'Alto catalogo de libros de Kent Beck'.
	self model: (CatalogWindowModel forCartId: aCartId).
	self morphExtent: (self defaultExtent).

	self halt.
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

	self layoutMorph
		beRow;
		separation: 15;
		color: Color red;
		axisEdgeWeight: 0;
		addMorph: (
			LayoutMorph newColumn
				separation: 25;
				axisEdgeWeight: 0.5;
				color: Color blue;
				addMorph: (
					LabelMorph 
						contents: 'Refactoring - Improving the Design of Existing Code'
				);
				addMorph: (
					PluggableButtonMorph
						model: self model
						stateGetter: nil
						action: #test
						label: 'AGREGAR AL CARRITO YA'
				)
		);
		addMorph: (
			LayoutMorph newColumn
				separation: 25;
				axisEdgeWeight: 0.5;
				color: Color blue;
				addMorph: (
					LabelMorph
						contents: 'Test-Driven Development by Example'
				);
				addMorph: (
					PluggableButtonMorph
						model: self model
						stateGetter: nil
						action: #test
						label: 'AGREGAR AL CARRITO PERO RECONTRA YA'
				)
		).
	
	self openInWorld.! !

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


!classDefinition: #CatalogWindowModel category: 'Tus-Libros-Web-Client'!
Object subclass: #CatalogWindowModel
	instanceVariableNames: 'cartId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!CatalogWindowModel methodsFor: 'initialization' stamp: 'nz 7/7/2021 01:05:26'!
initializeForCartId: aCartId 

	cartId := aCartId.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CatalogWindowModel class' category: 'Tus-Libros-Web-Client'!
CatalogWindowModel class
	instanceVariableNames: ''!

!CatalogWindowModel class methodsFor: 'instance creation' stamp: 'nz 7/7/2021 01:05:16'!
forCartId: aCartId 
	^self new initializeForCartId: aCartId ! !


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
