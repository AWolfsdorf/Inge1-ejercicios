!classDefinition: #I category: 'Numeros Romanos'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Numeros Romanos'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:19:57'!
* multiplicador 
	^multiplicador.! !

!I class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:19:57'!
+ unSumando

	^unSumando next! !

!I class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:19:57'!
- anNumber

	^self error: I descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:31:00'!
/ divisor 
	divisor divide: self.! !

!I class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:19:57'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir un numero por un numero mayor'! !

!I class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:19:57'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'No se soportan numeros negativos'! !

!I class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:28:55'!
divide: dividendo 
	^dividendo! !

!I class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:19:57'!
extractFrom: minuendo 
	^minuendo previous! !

!I class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:19:57'!
next
	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:19:57'!
previous

	^self error: I descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:19:57'!
times: multiplicando 
	^multiplicando.! !


!classDefinition: #II category: 'Numeros Romanos'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Numeros Romanos'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:20:03'!
* multiplicador

	^ multiplicador times: self
	
	"(sustraendo = I) 
		ifTrue: 
			[ ^self previous		] 
		ifFalse: 
			[ ^self previous - unRestando previous ]
         "! !

!II class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:20:03'!
+ unSumando
	^self previous + unSumando next! !

!II class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:20:03'!
- sustraendo

	^ sustraendo extractFrom: self
	
	"(sustraendo = I) 
		ifTrue: 
			[ ^self previous		] 
		ifFalse: 
			[ ^self previous - unRestando previous ]
         "! !

!II class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:27:48'!
/ divisor 
	^divisor divide: self.! !

!II class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:20:03'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'No se puede dividir un numero por un numero mayor'! !

!II class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 21:06:28'!
divide: dividendo 
	"Es horrible pero queriamos jugar con manejo de errores :') "
	"Podriamos haber implementado esMenor/Mayor y evitar este manejo."
	[dividendo next - self] on: Error do: [ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].
	[ ^ I + (self divide: dividendo - self) ] on: Error do: [ ^ I ].! !

!II class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:20:03'!
extractFrom: minuendo
	^self previous extractFrom: minuendo previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 21:40:32'!
nameOfNext
		
	(self name endsWith: 'XLIX')
		ifTrue: [ ^ (self name withoutSuffix: 'XLIX'), 'L'].		
	(self name endsWith: 'XXXIX')
		ifTrue: [ ^ (self name withoutSuffix: 'XXXIX'), 'XL'].
	(self name endsWith: 'IX')
		ifTrue: [ ^ (self name withoutSuffix: 'IX'), 'X'].		
	(self name endsWith: 'VIII')
		ifTrue: [ ^ (self name withoutSuffix: 'VIII'), 'IX'].
	(self name endsWith: 'IV')
		ifTrue: [ ^ (self name withoutSuffix: 'IV'), 'V'].
	(self name endsWith: 'III')
		ifTrue: [ ^ (self name withoutSuffix: 'III'), 'IV'].
	^ self name, 'I'. ! !

!II class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 21:12:35'!
next

	next ifNil: [
		next _ II createChildNamed: self nameOfNext.
		next previous: self
		].
	^next! !

!II class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:20:03'!
previous
	
	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:20:03'!
previous: aPreviousNumber

	previous _ aPreviousNumber ! !

!II class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:25:41'!
times: multiplicando 
	^ multiplicando + (multiplicando times: self previous).! !


!classDefinition: #III category: 'Numeros Romanos'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Numeros Romanos'!
III class
	instanceVariableNames: ''!

!III class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IV.
	previous := II.! !


!classDefinition: #IV category: 'Numeros Romanos'!
II subclass: #IV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IV class' category: 'Numeros Romanos'!
IV class
	instanceVariableNames: ''!

!IV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := V.
	previous := III.! !


!classDefinition: #IX category: 'Numeros Romanos'!
II subclass: #IX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IX class' category: 'Numeros Romanos'!
IX class
	instanceVariableNames: ''!

!IX class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := X.
	previous := VIII.! !


!classDefinition: #L category: 'Numeros Romanos'!
II subclass: #L
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'L class' category: 'Numeros Romanos'!
L class
	instanceVariableNames: ''!

!L class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LI.
	previous := XLIX.! !


!classDefinition: #LI category: 'Numeros Romanos'!
II subclass: #LI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LI class' category: 'Numeros Romanos'!
LI class
	instanceVariableNames: ''!

!LI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LII.
	previous := L.! !


!classDefinition: #LII category: 'Numeros Romanos'!
II subclass: #LII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LII class' category: 'Numeros Romanos'!
LII class
	instanceVariableNames: ''!

!LII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LIII.
	previous := LI.! !


!classDefinition: #LIII category: 'Numeros Romanos'!
II subclass: #LIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIII class' category: 'Numeros Romanos'!
LIII class
	instanceVariableNames: ''!

!LIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LIV.
	previous := LII.! !


!classDefinition: #LIV category: 'Numeros Romanos'!
II subclass: #LIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIV class' category: 'Numeros Romanos'!
LIV class
	instanceVariableNames: ''!

!LIV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LV.
	previous := LIII.! !


!classDefinition: #LIX category: 'Numeros Romanos'!
II subclass: #LIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIX class' category: 'Numeros Romanos'!
LIX class
	instanceVariableNames: ''!

!LIX class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LX.
	previous := LVIII.! !


!classDefinition: #LV category: 'Numeros Romanos'!
II subclass: #LV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LV class' category: 'Numeros Romanos'!
LV class
	instanceVariableNames: ''!

!LV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LVI.
	previous := LIV.! !


!classDefinition: #LVI category: 'Numeros Romanos'!
II subclass: #LVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVI class' category: 'Numeros Romanos'!
LVI class
	instanceVariableNames: ''!

!LVI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LVII.
	previous := LV.! !


!classDefinition: #LVII category: 'Numeros Romanos'!
II subclass: #LVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVII class' category: 'Numeros Romanos'!
LVII class
	instanceVariableNames: ''!

!LVII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LVIII.
	previous := LVI.! !


!classDefinition: #LVIII category: 'Numeros Romanos'!
II subclass: #LVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVIII class' category: 'Numeros Romanos'!
LVIII class
	instanceVariableNames: ''!

!LVIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LIX.
	previous := LVII.! !


!classDefinition: #LX category: 'Numeros Romanos'!
II subclass: #LX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LX class' category: 'Numeros Romanos'!
LX class
	instanceVariableNames: ''!

!LX class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXI.
	previous := LIX.! !


!classDefinition: #LXI category: 'Numeros Romanos'!
II subclass: #LXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXI class' category: 'Numeros Romanos'!
LXI class
	instanceVariableNames: ''!

!LXI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXII.
	previous := LX.! !


!classDefinition: #LXII category: 'Numeros Romanos'!
II subclass: #LXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXII class' category: 'Numeros Romanos'!
LXII class
	instanceVariableNames: ''!

!LXII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXIII.
	previous := LXI.! !


!classDefinition: #LXIII category: 'Numeros Romanos'!
II subclass: #LXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIII class' category: 'Numeros Romanos'!
LXIII class
	instanceVariableNames: ''!

!LXIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXIV.
	previous := LXII.! !


!classDefinition: #LXIV category: 'Numeros Romanos'!
II subclass: #LXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIV class' category: 'Numeros Romanos'!
LXIV class
	instanceVariableNames: ''!

!LXIV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXV.
	previous := LXIII.! !


!classDefinition: #LXIX category: 'Numeros Romanos'!
II subclass: #LXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIX class' category: 'Numeros Romanos'!
LXIX class
	instanceVariableNames: ''!

!LXIX class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:14'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXX.
	previous := LXVIII.! !


!classDefinition: #LXL category: 'Numeros Romanos'!
II subclass: #LXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXL class' category: 'Numeros Romanos'!
LXL class
	instanceVariableNames: ''!

!LXL class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := LXXXIX.! !


!classDefinition: #LXV category: 'Numeros Romanos'!
II subclass: #LXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXV class' category: 'Numeros Romanos'!
LXV class
	instanceVariableNames: ''!

!LXV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXVI.
	previous := LXIV.! !


!classDefinition: #LXVI category: 'Numeros Romanos'!
II subclass: #LXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVI class' category: 'Numeros Romanos'!
LXVI class
	instanceVariableNames: ''!

!LXVI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXVII.
	previous := LXV.! !


!classDefinition: #LXVII category: 'Numeros Romanos'!
II subclass: #LXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVII class' category: 'Numeros Romanos'!
LXVII class
	instanceVariableNames: ''!

!LXVII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXVIII.
	previous := LXVI.! !


!classDefinition: #LXVIII category: 'Numeros Romanos'!
II subclass: #LXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVIII class' category: 'Numeros Romanos'!
LXVIII class
	instanceVariableNames: ''!

!LXVIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXIX.
	previous := LXVII.! !


!classDefinition: #LXX category: 'Numeros Romanos'!
II subclass: #LXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXX class' category: 'Numeros Romanos'!
LXX class
	instanceVariableNames: ''!

!LXX class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXI.
	previous := LXIX.! !


!classDefinition: #LXXI category: 'Numeros Romanos'!
II subclass: #LXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXI class' category: 'Numeros Romanos'!
LXXI class
	instanceVariableNames: ''!

!LXXI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXII.
	previous := LXX.! !


!classDefinition: #LXXII category: 'Numeros Romanos'!
II subclass: #LXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXII class' category: 'Numeros Romanos'!
LXXII class
	instanceVariableNames: ''!

!LXXII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXIII.
	previous := LXXI.! !


!classDefinition: #LXXIII category: 'Numeros Romanos'!
II subclass: #LXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIII class' category: 'Numeros Romanos'!
LXXIII class
	instanceVariableNames: ''!

!LXXIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXIV.
	previous := LXXII.! !


!classDefinition: #LXXIV category: 'Numeros Romanos'!
II subclass: #LXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIV class' category: 'Numeros Romanos'!
LXXIV class
	instanceVariableNames: ''!

!LXXIV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXV.
	previous := LXXIII.! !


!classDefinition: #LXXIX category: 'Numeros Romanos'!
II subclass: #LXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIX class' category: 'Numeros Romanos'!
LXXIX class
	instanceVariableNames: ''!

!LXXIX class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXX.
	previous := LXXVIII.! !


!classDefinition: #LXXV category: 'Numeros Romanos'!
II subclass: #LXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXV class' category: 'Numeros Romanos'!
LXXV class
	instanceVariableNames: ''!

!LXXV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXVI.
	previous := LXXIV.! !


!classDefinition: #LXXVI category: 'Numeros Romanos'!
II subclass: #LXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVI class' category: 'Numeros Romanos'!
LXXVI class
	instanceVariableNames: ''!

!LXXVI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXVII.
	previous := LXXV.! !


!classDefinition: #LXXVII category: 'Numeros Romanos'!
II subclass: #LXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVII class' category: 'Numeros Romanos'!
LXXVII class
	instanceVariableNames: ''!

!LXXVII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXVIII.
	previous := LXXVI.! !


!classDefinition: #LXXVIII category: 'Numeros Romanos'!
II subclass: #LXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVIII class' category: 'Numeros Romanos'!
LXXVIII class
	instanceVariableNames: ''!

!LXXVIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXIX.
	previous := LXXVII.! !


!classDefinition: #LXXX category: 'Numeros Romanos'!
II subclass: #LXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXX class' category: 'Numeros Romanos'!
LXXX class
	instanceVariableNames: ''!

!LXXX class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXI.
	previous := LXXIX.! !


!classDefinition: #LXXXI category: 'Numeros Romanos'!
II subclass: #LXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXI class' category: 'Numeros Romanos'!
LXXXI class
	instanceVariableNames: ''!

!LXXXI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXII.
	previous := LXXX.! !


!classDefinition: #LXXXII category: 'Numeros Romanos'!
II subclass: #LXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXII class' category: 'Numeros Romanos'!
LXXXII class
	instanceVariableNames: ''!

!LXXXII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXIII.
	previous := LXXXI.! !


!classDefinition: #LXXXIII category: 'Numeros Romanos'!
II subclass: #LXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIII class' category: 'Numeros Romanos'!
LXXXIII class
	instanceVariableNames: ''!

!LXXXIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXIV.
	previous := LXXXII.! !


!classDefinition: #LXXXIV category: 'Numeros Romanos'!
II subclass: #LXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIV class' category: 'Numeros Romanos'!
LXXXIV class
	instanceVariableNames: ''!

!LXXXIV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXV.
	previous := LXXXIII.! !


!classDefinition: #LXXXIX category: 'Numeros Romanos'!
II subclass: #LXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIX class' category: 'Numeros Romanos'!
LXXXIX class
	instanceVariableNames: ''!

!LXXXIX class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXL.
	previous := LXXXVIII.! !


!classDefinition: #LXXXV category: 'Numeros Romanos'!
II subclass: #LXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXV class' category: 'Numeros Romanos'!
LXXXV class
	instanceVariableNames: ''!

!LXXXV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXVI.
	previous := LXXXIV.! !


!classDefinition: #LXXXVI category: 'Numeros Romanos'!
II subclass: #LXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVI class' category: 'Numeros Romanos'!
LXXXVI class
	instanceVariableNames: ''!

!LXXXVI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXVII.
	previous := LXXXV.! !


!classDefinition: #LXXXVII category: 'Numeros Romanos'!
II subclass: #LXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVII class' category: 'Numeros Romanos'!
LXXXVII class
	instanceVariableNames: ''!

!LXXXVII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXVIII.
	previous := LXXXVI.! !


!classDefinition: #LXXXVIII category: 'Numeros Romanos'!
II subclass: #LXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVIII class' category: 'Numeros Romanos'!
LXXXVIII class
	instanceVariableNames: ''!

!LXXXVIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXIX.
	previous := LXXXVII.! !


!classDefinition: #V category: 'Numeros Romanos'!
II subclass: #V
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'V class' category: 'Numeros Romanos'!
V class
	instanceVariableNames: ''!

!V class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VI.
	previous := IV.! !


!classDefinition: #VI category: 'Numeros Romanos'!
II subclass: #VI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VI class' category: 'Numeros Romanos'!
VI class
	instanceVariableNames: ''!

!VI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VII.
	previous := V.! !


!classDefinition: #VII category: 'Numeros Romanos'!
II subclass: #VII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VII class' category: 'Numeros Romanos'!
VII class
	instanceVariableNames: ''!

!VII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VIII.
	previous := VI.! !


!classDefinition: #VIII category: 'Numeros Romanos'!
II subclass: #VIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VIII class' category: 'Numeros Romanos'!
VIII class
	instanceVariableNames: ''!

!VIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IX.
	previous := VII.! !


!classDefinition: #X category: 'Numeros Romanos'!
II subclass: #X
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'X class' category: 'Numeros Romanos'!
X class
	instanceVariableNames: ''!

!X class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XI.
	previous := IX.! !


!classDefinition: #XI category: 'Numeros Romanos'!
II subclass: #XI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XI class' category: 'Numeros Romanos'!
XI class
	instanceVariableNames: ''!

!XI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XII.
	previous := X.! !


!classDefinition: #XII category: 'Numeros Romanos'!
II subclass: #XII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XII class' category: 'Numeros Romanos'!
XII class
	instanceVariableNames: ''!

!XII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XIII.
	previous := XI.! !


!classDefinition: #XIII category: 'Numeros Romanos'!
II subclass: #XIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIII class' category: 'Numeros Romanos'!
XIII class
	instanceVariableNames: ''!

!XIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XIV.
	previous := XII.! !


!classDefinition: #XIV category: 'Numeros Romanos'!
II subclass: #XIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIV class' category: 'Numeros Romanos'!
XIV class
	instanceVariableNames: ''!

!XIV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XV.
	previous := XIII.! !


!classDefinition: #XIX category: 'Numeros Romanos'!
II subclass: #XIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIX class' category: 'Numeros Romanos'!
XIX class
	instanceVariableNames: ''!

!XIX class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XX.
	previous := XVIII.! !


!classDefinition: #XL category: 'Numeros Romanos'!
II subclass: #XL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XL class' category: 'Numeros Romanos'!
XL class
	instanceVariableNames: ''!

!XL class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLI.
	previous := XXXIX.! !


!classDefinition: #XLI category: 'Numeros Romanos'!
II subclass: #XLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLI class' category: 'Numeros Romanos'!
XLI class
	instanceVariableNames: ''!

!XLI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLII.
	previous := XL.! !


!classDefinition: #XLII category: 'Numeros Romanos'!
II subclass: #XLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLII class' category: 'Numeros Romanos'!
XLII class
	instanceVariableNames: ''!

!XLII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLIII.
	previous := XLI.! !


!classDefinition: #XLIII category: 'Numeros Romanos'!
II subclass: #XLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIII class' category: 'Numeros Romanos'!
XLIII class
	instanceVariableNames: ''!

!XLIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLIV.
	previous := XLII.! !


!classDefinition: #XLIV category: 'Numeros Romanos'!
II subclass: #XLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIV class' category: 'Numeros Romanos'!
XLIV class
	instanceVariableNames: ''!

!XLIV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLV.
	previous := XLIII.! !


!classDefinition: #XLIX category: 'Numeros Romanos'!
II subclass: #XLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIX class' category: 'Numeros Romanos'!
XLIX class
	instanceVariableNames: ''!

!XLIX class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := L.
	previous := XLVIII.! !


!classDefinition: #XLV category: 'Numeros Romanos'!
II subclass: #XLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLV class' category: 'Numeros Romanos'!
XLV class
	instanceVariableNames: ''!

!XLV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLVI.
	previous := XLIV.! !


!classDefinition: #XLVI category: 'Numeros Romanos'!
II subclass: #XLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVI class' category: 'Numeros Romanos'!
XLVI class
	instanceVariableNames: ''!

!XLVI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLVII.
	previous := XLV.! !


!classDefinition: #XLVII category: 'Numeros Romanos'!
II subclass: #XLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVII class' category: 'Numeros Romanos'!
XLVII class
	instanceVariableNames: ''!

!XLVII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLVIII.
	previous := XLVI.! !


!classDefinition: #XLVIII category: 'Numeros Romanos'!
II subclass: #XLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVIII class' category: 'Numeros Romanos'!
XLVIII class
	instanceVariableNames: ''!

!XLVIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLIX.
	previous := XLVII.! !


!classDefinition: #XV category: 'Numeros Romanos'!
II subclass: #XV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XV class' category: 'Numeros Romanos'!
XV class
	instanceVariableNames: ''!

!XV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XVI.
	previous := XIV.! !


!classDefinition: #XVI category: 'Numeros Romanos'!
II subclass: #XVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVI class' category: 'Numeros Romanos'!
XVI class
	instanceVariableNames: ''!

!XVI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XVII.
	previous := XV.! !


!classDefinition: #XVII category: 'Numeros Romanos'!
II subclass: #XVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVII class' category: 'Numeros Romanos'!
XVII class
	instanceVariableNames: ''!

!XVII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XVIII.
	previous := XVI.! !


!classDefinition: #XVIII category: 'Numeros Romanos'!
II subclass: #XVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVIII class' category: 'Numeros Romanos'!
XVIII class
	instanceVariableNames: ''!

!XVIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XIX.
	previous := XVII.! !


!classDefinition: #XX category: 'Numeros Romanos'!
II subclass: #XX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XX class' category: 'Numeros Romanos'!
XX class
	instanceVariableNames: ''!

!XX class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXI.
	previous := XIX.! !


!classDefinition: #XXI category: 'Numeros Romanos'!
II subclass: #XXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXI class' category: 'Numeros Romanos'!
XXI class
	instanceVariableNames: ''!

!XXI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXII.
	previous := XX.! !


!classDefinition: #XXII category: 'Numeros Romanos'!
II subclass: #XXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXII class' category: 'Numeros Romanos'!
XXII class
	instanceVariableNames: ''!

!XXII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXIII.
	previous := XXI.! !


!classDefinition: #XXIII category: 'Numeros Romanos'!
II subclass: #XXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIII class' category: 'Numeros Romanos'!
XXIII class
	instanceVariableNames: ''!

!XXIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXIV.
	previous := XXII.! !


!classDefinition: #XXIV category: 'Numeros Romanos'!
II subclass: #XXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIV class' category: 'Numeros Romanos'!
XXIV class
	instanceVariableNames: ''!

!XXIV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXV.
	previous := XXIII.! !


!classDefinition: #XXIX category: 'Numeros Romanos'!
II subclass: #XXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIX class' category: 'Numeros Romanos'!
XXIX class
	instanceVariableNames: ''!

!XXIX class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXX.
	previous := XXVIII.! !


!classDefinition: #XXV category: 'Numeros Romanos'!
II subclass: #XXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXV class' category: 'Numeros Romanos'!
XXV class
	instanceVariableNames: ''!

!XXV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXVI.
	previous := XXIV.! !


!classDefinition: #XXVI category: 'Numeros Romanos'!
II subclass: #XXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVI class' category: 'Numeros Romanos'!
XXVI class
	instanceVariableNames: ''!

!XXVI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXVII.
	previous := XXV.! !


!classDefinition: #XXVII category: 'Numeros Romanos'!
II subclass: #XXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVII class' category: 'Numeros Romanos'!
XXVII class
	instanceVariableNames: ''!

!XXVII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXVIII.
	previous := XXVI.! !


!classDefinition: #XXVIII category: 'Numeros Romanos'!
II subclass: #XXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVIII class' category: 'Numeros Romanos'!
XXVIII class
	instanceVariableNames: ''!

!XXVIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXIX.
	previous := XXVII.! !


!classDefinition: #XXX category: 'Numeros Romanos'!
II subclass: #XXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXX class' category: 'Numeros Romanos'!
XXX class
	instanceVariableNames: ''!

!XXX class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXI.
	previous := XXIX.! !


!classDefinition: #XXXI category: 'Numeros Romanos'!
II subclass: #XXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXI class' category: 'Numeros Romanos'!
XXXI class
	instanceVariableNames: ''!

!XXXI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXII.
	previous := XXX.! !


!classDefinition: #XXXII category: 'Numeros Romanos'!
II subclass: #XXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXII class' category: 'Numeros Romanos'!
XXXII class
	instanceVariableNames: ''!

!XXXII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXIII.
	previous := XXXI.! !


!classDefinition: #XXXIII category: 'Numeros Romanos'!
II subclass: #XXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIII class' category: 'Numeros Romanos'!
XXXIII class
	instanceVariableNames: ''!

!XXXIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXIV.
	previous := XXXII.! !


!classDefinition: #XXXIV category: 'Numeros Romanos'!
II subclass: #XXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIV class' category: 'Numeros Romanos'!
XXXIV class
	instanceVariableNames: ''!

!XXXIV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXV.
	previous := XXXIII.! !


!classDefinition: #XXXIX category: 'Numeros Romanos'!
II subclass: #XXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIX class' category: 'Numeros Romanos'!
XXXIX class
	instanceVariableNames: ''!

!XXXIX class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XL.
	previous := XXXVIII.! !


!classDefinition: #XXXV category: 'Numeros Romanos'!
II subclass: #XXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXV class' category: 'Numeros Romanos'!
XXXV class
	instanceVariableNames: ''!

!XXXV class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXVI.
	previous := XXXIV.! !


!classDefinition: #XXXVI category: 'Numeros Romanos'!
II subclass: #XXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVI class' category: 'Numeros Romanos'!
XXXVI class
	instanceVariableNames: ''!

!XXXVI class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXVII.
	previous := XXXV.! !


!classDefinition: #XXXVII category: 'Numeros Romanos'!
II subclass: #XXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVII class' category: 'Numeros Romanos'!
XXXVII class
	instanceVariableNames: ''!

!XXXVII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXVIII.
	previous := XXXVI.! !


!classDefinition: #XXXVIII category: 'Numeros Romanos'!
II subclass: #XXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVIII class' category: 'Numeros Romanos'!
XXXVIII class
	instanceVariableNames: ''!

!XXXVIII class methodsFor: 'as yet unclassified' stamp: 'AW 4/8/2021 22:03:15'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXIX.
	previous := XXXVII.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IV initializeAfterFileIn!
IX initializeAfterFileIn!
L initializeAfterFileIn!
LI initializeAfterFileIn!
LII initializeAfterFileIn!
LIII initializeAfterFileIn!
LIV initializeAfterFileIn!
LIX initializeAfterFileIn!
LV initializeAfterFileIn!
LVI initializeAfterFileIn!
LVII initializeAfterFileIn!
LVIII initializeAfterFileIn!
LX initializeAfterFileIn!
LXI initializeAfterFileIn!
LXII initializeAfterFileIn!
LXIII initializeAfterFileIn!
LXIV initializeAfterFileIn!
LXIX initializeAfterFileIn!
LXL initializeAfterFileIn!
LXV initializeAfterFileIn!
LXVI initializeAfterFileIn!
LXVII initializeAfterFileIn!
LXVIII initializeAfterFileIn!
LXX initializeAfterFileIn!
LXXI initializeAfterFileIn!
LXXII initializeAfterFileIn!
LXXIII initializeAfterFileIn!
LXXIV initializeAfterFileIn!
LXXIX initializeAfterFileIn!
LXXV initializeAfterFileIn!
LXXVI initializeAfterFileIn!
LXXVII initializeAfterFileIn!
LXXVIII initializeAfterFileIn!
LXXX initializeAfterFileIn!
LXXXI initializeAfterFileIn!
LXXXII initializeAfterFileIn!
LXXXIII initializeAfterFileIn!
LXXXIV initializeAfterFileIn!
LXXXIX initializeAfterFileIn!
LXXXV initializeAfterFileIn!
LXXXVI initializeAfterFileIn!
LXXXVII initializeAfterFileIn!
LXXXVIII initializeAfterFileIn!
V initializeAfterFileIn!
VI initializeAfterFileIn!
VII initializeAfterFileIn!
VIII initializeAfterFileIn!
X initializeAfterFileIn!
XI initializeAfterFileIn!
XII initializeAfterFileIn!
XIII initializeAfterFileIn!
XIV initializeAfterFileIn!
XIX initializeAfterFileIn!
XL initializeAfterFileIn!
XLI initializeAfterFileIn!
XLII initializeAfterFileIn!
XLIII initializeAfterFileIn!
XLIV initializeAfterFileIn!
XLIX initializeAfterFileIn!
XLV initializeAfterFileIn!
XLVI initializeAfterFileIn!
XLVII initializeAfterFileIn!
XLVIII initializeAfterFileIn!
XV initializeAfterFileIn!
XVI initializeAfterFileIn!
XVII initializeAfterFileIn!
XVIII initializeAfterFileIn!
XX initializeAfterFileIn!
XXI initializeAfterFileIn!
XXII initializeAfterFileIn!
XXIII initializeAfterFileIn!
XXIV initializeAfterFileIn!
XXIX initializeAfterFileIn!
XXV initializeAfterFileIn!
XXVI initializeAfterFileIn!
XXVII initializeAfterFileIn!
XXVIII initializeAfterFileIn!
XXX initializeAfterFileIn!
XXXI initializeAfterFileIn!
XXXII initializeAfterFileIn!
XXXIII initializeAfterFileIn!
XXXIV initializeAfterFileIn!
XXXIX initializeAfterFileIn!
XXXV initializeAfterFileIn!
XXXVI initializeAfterFileIn!
XXXVII initializeAfterFileIn!
XXXVIII initializeAfterFileIn!