!classDefinition: #CreateCartWindow category: 'Tus-Libros-Web-Client'!
SystemWindow subclass: #CreateCartWindow
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

!CreateCartWindow methodsFor: 'as yet unclassified' stamp: 'AW 7/6/2021 19:43:16'!
initialize

	super initialize.
	self setLabel: 'Cree su carrito'.
	self model: CreateCartWindowModel new.
	self buildCreateCartWindow.
	
	
	self model when: self model class cartCreatedEvent send: #navigateToCatalogWindow to: self.
	self model when: self model class cartCreationErrorEvent send: #showBadLoginErrorDialog to: self.
	
	self openInWorld.! !


!CreateCartWindow methodsFor: 'navigation' stamp: 'AW 7/6/2021 19:36:59'!
navigateToCatalogWindow
	
	"
	Hacer algo para movernos a la pantalla de catalogo
	"! !


!CreateCartWindow methodsFor: 'dialogs' stamp: 'AW 7/6/2021 20:09:23'!
showBadLoginErrorDialog
	MessageDialogWindow message: 'Login Inválido!!'.! !


!classDefinition: #MessageDialogWindow category: 'Tus-Libros-Web-Client'!
PluggableMorph subclass: #MessageDialogWindow
	instanceVariableNames: 'contentLayout'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!MessageDialogWindow methodsFor: 'initialization' stamp: 'nz 7/6/2021 23:31:09'!
defaultExtent
	^300@100! !

!MessageDialogWindow methodsFor: 'initialization' stamp: 'nz 7/6/2021 23:58:05'!
initializeMessage: aMessageText 
	
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

!MessageDialogWindow class methodsFor: 'as yet unclassified' stamp: 'AW 7/6/2021 19:56:11'!
message: aMessageText 

	^self new initializeMessage: aMessageText.! !


!classDefinition: #CreateCartWindowModel category: 'Tus-Libros-Web-Client'!
Object subclass: #CreateCartWindowModel
	instanceVariableNames: 'userName password tusLibrosClient cartId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!CreateCartWindowModel methodsFor: 'as yet unclassified' stamp: 'AW 7/6/2021 19:22:09'!
cart: aCartId 
	cartId := aCartId.! !

!CreateCartWindowModel methodsFor: 'as yet unclassified' stamp: 'AW 7/6/2021 19:41:05'!
createCartRequest
	[ self cart: (tusLibrosClient createCart: userName password: password).
	  self triggerEvent: self class cartCreatedEvent with: self. ] on: Error
		do: [ self triggerEvent: self class cartCreationErrorEvent with: self ].
		
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
