!classDefinition: #I category: 'Numeros Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Numeros Naturales'!
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


!classDefinition: #II category: 'Numeros Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Numeros Naturales'!
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

!II class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 21:07:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	previous := I.! !

!II class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 20:20:03'!
next

	next ifNil: [
		next _ self createChildNamed: self name, 'I'.
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


!classDefinition: #III category: 'Numeros Naturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'Numeros Naturales'!
III class
	instanceVariableNames: ''!

!III class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 21:07:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIII.
	previous := II.! !


!classDefinition: #IIII category: 'Numeros Naturales'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: 'Numeros Naturales'!
IIII class
	instanceVariableNames: ''!

!IIII class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 21:07:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIII.
	previous := III.! !


!classDefinition: #IIIII category: 'Numeros Naturales'!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: 'Numeros Naturales'!
IIIII class
	instanceVariableNames: ''!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 21:07:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIII.
	previous := IIII.! !


!classDefinition: #IIIIII category: 'Numeros Naturales'!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: 'Numeros Naturales'!
IIIIII class
	instanceVariableNames: ''!

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 21:07:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIII.
	previous := IIIII.! !


!classDefinition: #IIIIIII category: 'Numeros Naturales'!
IIIIII subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: 'Numeros Naturales'!
IIIIIII class
	instanceVariableNames: ''!

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 21:07:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IIIIIIII.
	previous := IIIIII.! !


!classDefinition: #IIIIIIII category: 'Numeros Naturales'!
IIIIIII subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: 'Numeros Naturales'!
IIIIIIII class
	instanceVariableNames: ''!

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'nz 4/6/2021 21:07:47'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	previous := IIIIIII.! !

II initializeAfterFileIn!
III initializeAfterFileIn!
IIII initializeAfterFileIn!
IIIII initializeAfterFileIn!
IIIIII initializeAfterFileIn!
IIIIIII initializeAfterFileIn!
IIIIIIII initializeAfterFileIn!