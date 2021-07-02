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

!CreateCartWindow methodsFor: 'as yet unclassified' stamp: 'nz 7/1/2021 22:46:05'!
initialize

	super initialize.
	self setLabel: 'Cree su carrito'.
	self model: CreateCartWindowModel new.
	self buildCreateCartWindow.
	
	self openInWorld.! !


!classDefinition: #CreateCartWindowModel category: 'Tus-Libros-Web-Client'!
Object subclass: #CreateCartWindowModel
	instanceVariableNames: 'userName password'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!CreateCartWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/1/2021 23:07:07'!
createCartRequest
	
	| tusLibrosClient response |
	tusLibrosClient := TusLibrosClient new.
	response := tusLibrosClient createCart: userName password: password.
	
	self halt.
	"
	en el caso de que este ok: 
	- actualizar el modelo (guardarnos el id de carrito)
	- tirar un evento avisando que tenemos un carrito 
	en el caso de que falle:
	- tirar un evento con informacion del error
	
	despues:
	- capturar eventos en la vista y actuar en consecencia
	"! !

!CreateCartWindowModel methodsFor: 'as yet unclassified' stamp: 'nz 7/1/2021 22:16:49'!
initialize
	userName _ ''.
	password _ ''.! !

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


!classDefinition: #TusLibrosClient category: 'Tus-Libros-Web-Client'!
Object subclass: #TusLibrosClient
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!TusLibrosClient methodsFor: 'as yet unclassified' stamp: 'nz 7/1/2021 23:03:20'!
createCart: aClientId password: aPassword 

	| fieldDict response |
	fieldDict _ Dictionary new.
	fieldDict at: 'clientId' put: aClientId.
	fieldDict at: 'password' put: aPassword.
	response _ WebClient
		htmlSubmit: self url, '/createCart'
		fields: fieldDict.
	response isSuccess
		ifTrue: [ ^ WebUtils jsonDecode: response content readStream ]
		ifFalse: [ ^ self error: response content ].! !

!TusLibrosClient methodsFor: 'as yet unclassified' stamp: 'nz 7/1/2021 23:01:08'!
url
	^'http://localhost:8080'.! !
