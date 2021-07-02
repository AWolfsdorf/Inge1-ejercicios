!classDefinition: #CreateCartWindow category: 'Tus-Libros-Web-Client'!
SystemWindow subclass: #CreateCartWindow
	instanceVariableNames: 'userNameTextBox'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!CreateCartWindow methodsFor: 'as yet unclassified' stamp: 'AW 7/1/2021 18:38:14'!
buildCreateCartButtonRow
	| layout |
	
	layout _ LayoutMorph newRow.
	
	
	^layout .! !

!CreateCartWindow methodsFor: 'as yet unclassified' stamp: 'AW 7/1/2021 18:39:35'!
buildCreateCartWindow
	
	self layoutMorph 
		beColumn;
		separation: 15;
		axisEdgeWeight: 0;
		addMorph: self buildUserAndPasswordTextboxRow;
		addMorph: self buildCreateCartButtonRow.! !

!CreateCartWindow methodsFor: 'as yet unclassified' stamp: 'AW 7/1/2021 18:54:50'!
buildUserAndPasswordTextboxRow
	| layout |
	
	userNameTextBox _ TextModelMorph
		textProvider: self model
		textGetter: #userName
		textSetter: #userName:.
		
	userNameTextBox textMorph
		setProperty: #keyStroke:
		toValue: [ :key |
			userNameTextBox textMorph acceptContents ].
	
	layout _ LayoutMorph newRow.
	layout
		separation: 25;
		axisEdgeWeight: 0.5;
		addMorph: userNameTextBox
		"addMorph: passwordTextBox;"
		.
	
	
	^layout.! !

!CreateCartWindow methodsFor: 'as yet unclassified' stamp: 'AW 7/1/2021 18:40:13'!
initialize

	super initialize.
	self setLabel: 'Compre ya sus libros'.
	self model: CreateCartWindowModel new.
	self buildCreateCartWindow.
	

	self openInWorld.
	! !


!classDefinition: #CreateCartWindowModel category: 'Tus-Libros-Web-Client'!
Object subclass: #CreateCartWindowModel
	instanceVariableNames: 'userName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Tus-Libros-Web-Client'!

!CreateCartWindowModel methodsFor: 'as yet unclassified' stamp: 'AW 7/1/2021 18:52:07'!
userName
	^'Hola mama'! !

!CreateCartWindowModel methodsFor: 'as yet unclassified' stamp: 'AW 7/1/2021 18:55:49'!
userName: aUsername 
	userName _ aUsername.! !
