!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de n�mero inv�lido!!!!!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'arithmetic operations' stamp: 'AW 4/20/2021 19:35:49'!
* aMultiplier 
	
	^aMultiplier multiplyByEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'AW 4/20/2021 19:19:53'!
+ anEnteroAdder 
	
	^anEnteroAdder addEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'AW 4/20/2021 19:50:29'!
- aSubtrahend 
	
	^aSubtrahend substractFromEntero: self.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'nz 4/20/2021 21:58:08'!
/ aDivisor 

	^aDivisor divideAnEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'nz 4/20/2021 20:43:18'!
// anEnteroDivisor 
	
	^self class with: value // anEnteroDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'nz 4/20/2021 21:34:50'!
fibonacci

	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.

	^ (self - one) fibonacci + (self - two) fibonacci! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'nz 4/20/2021 21:29:20'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'private' stamp: 'AW 4/19/2021 21:57:06'!
addEntero: anEnteroAdder

	^self class with: value + anEnteroAdder integerValue
	
	! !

!Entero methodsFor: 'private' stamp: 'nz 4/20/2021 22:00:55'!
addFraccion: aFraccionAdder

	^aFraccionAdder addEntero: self.! !

!Entero methodsFor: 'private' stamp: 'nz 4/20/2021 22:03:25'!
divideAFraccion: aFraccionDividend

	^aFraccionDividend numerator / (aFraccionDividend denominator * self)! !

!Entero methodsFor: 'private' stamp: 'AW 4/21/2021 00:20:33'!
divideAnEntero: anEnteroDividend

	| greatestCommonDivisor numerator denominator |

	greatestCommonDivisor := anEnteroDividend greatestCommonDivisorWith: self. 
	numerator := anEnteroDividend // greatestCommonDivisor.
	denominator := self // greatestCommonDivisor.

	^denominator divideAnMinimumEnteroDividend: numerator. 		! !

!Entero methodsFor: 'private' stamp: 'AW 4/21/2021 00:23:42'!
divideAnMinimumEnteroDividend: anMinimumEnteroDividend

	^Fraccion uncheckedWith: anMinimumEnteroDividend over: self. 		! !

!Entero methodsFor: 'private' stamp: 'AW 4/20/2021 19:34:33'!
multiplyByEntero: anEnteroMultiplier

	^self class with: (anEnteroMultiplier integerValue * value).! !

!Entero methodsFor: 'private' stamp: 'nz 4/20/2021 22:08:58'!
multiplyByFraccion: aFraccionMultiplier

	^aFraccionMultiplier multiplyByEntero: self! !

!Entero methodsFor: 'private' stamp: 'AW 4/20/2021 19:49:39'!
substractFromEntero: anEnteroMinuend

	^ self class with: (anEnteroMinuend integerValue - value).	! !

!Entero methodsFor: 'private' stamp: 'nz 4/20/2021 22:17:57'!
substractFromFraccion: aFraccionMinuend
	
	^aFraccionMinuend + self negated! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'nz 4/21/2021 01:16:26'!
with: anIntegerValue 
	
	^(self findEnteroSubclassForInteger: anIntegerValue) new initializeWith: anIntegerValue.
	! !


!Entero class methodsFor: 'private' stamp: 'nz 4/21/2021 01:23:56'!
findEnteroSubclassForInteger: anIntegerValue
	
	"
	No tenemos forma de aplicar polimorfismo sobre
	anIntegerValue sin modificar una clase externa.
	"
	anIntegerValue negative ifTrue: [ ^EnteroNegativo ].
	anIntegerValue isZero ifTrue: [ ^Cero ].
	(anIntegerValue = 1) ifTrue: [ ^Uno ].
	anIntegerValue isInteger ifTrue: [ ^Entero. ].
	
	self error: self class invalidNumberTypeErrorDescription ! !


!Entero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:24'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est� definido aqu� para Enteros Negativos!!!!!!'! !


!classDefinition: #Cero category: 'Numero-Exercise'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Cero methodsFor: 'arithmetic operations' stamp: 'AW 4/21/2021 00:10:31'!
/ aDividend
	
	^self! !

!Cero methodsFor: 'arithmetic operations' stamp: 'nz 4/20/2021 21:55:57'!
fibonacci

	^self class with: 1! !


!Cero methodsFor: 'private' stamp: 'AW 4/20/2021 23:41:22'!
divideAnEntero: anEnteroDividend

	self error: self class canNotDivideByZeroErrorDescription! !

!Cero methodsFor: 'private' stamp: 'AW 4/21/2021 00:36:45'!
divideAnMinimumEnteroDividend: anMinimumEnteroDividend

	self error: self class canNotDivideByZeroErrorDescription.! !


!classDefinition: #EnteroNegativo category: 'Numero-Exercise'!
Entero subclass: #EnteroNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!EnteroNegativo methodsFor: 'private' stamp: 'AW 4/21/2021 00:29:39'!
divideAnEntero: anEnteroDividend

	^anEnteroDividend negated / self negated.! !


!EnteroNegativo methodsFor: 'arithmetic operations' stamp: 'nz 4/20/2021 21:56:48'!
fibonacci

	self error: Entero negativeFibonacciErrorDescription.! !


!classDefinition: #Uno category: 'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'private' stamp: 'AW 4/20/2021 23:50:03'!
divideAnEntero: anEnteroDividend

	^anEnteroDividend ! !

!Uno methodsFor: 'private' stamp: 'AW 4/21/2021 00:22:05'!
divideAnMinimumEnteroDividend: anMinimumEnteroDividend

	^anMinimumEnteroDividend ! !


!Uno methodsFor: 'arithmetic operations' stamp: 'nz 4/20/2021 21:56:10'!
fibonacci

	^self class with: 1! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'AW 4/20/2021 19:40:46'!
* aMultiplier 
	^aMultiplier multiplyByFraccion: self.
	
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'AW 4/20/2021 19:29:08'!
+ anAdder 

	^anAdder addFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'AW 4/20/2021 20:07:40'!
- aSubtrahend 
	
	^aSubtrahend substractFromFraccion: self
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'nz 4/20/2021 20:24:07'!
/ aDivisor 

	^ aDivisor divideAFraccion: self! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'AW 4/21/2021 00:33:31'!
initializeWith: aNumerator over: aDenominator
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !


!Fraccion methodsFor: 'private' stamp: 'AW 4/19/2021 21:58:52'!
addEntero: anEnteroAdder

	^anEnteroAdder * denominator + numerator / denominator .! !

!Fraccion methodsFor: 'private' stamp: 'AW 4/20/2021 19:27:29'!
addFraccion: aFraccionAdder
	
	| newDenominator newNumerator |

	newNumerator := (numerator * aFraccionAdder denominator) + (denominator * aFraccionAdder numerator).
	newDenominator := denominator * aFraccionAdder denominator.
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'private' stamp: 'nz 4/20/2021 20:20:08'!
divideAFraccion: aFraccionDividend

	^aFraccionDividend * (denominator / numerator)! !

!Fraccion methodsFor: 'private' stamp: 'nz 4/20/2021 22:02:09'!
divideAnEntero: anEnteroDividend

	^anEnteroDividend * denominator / numerator ! !

!Fraccion methodsFor: 'private' stamp: 'AW 4/20/2021 19:38:33'!
multiplyByEntero: anEnteroMultiplier

	^(anEnteroMultiplier * numerator)  / denominator ! !

!Fraccion methodsFor: 'private' stamp: 'AW 4/20/2021 19:42:59'!
multiplyByFraccion: aFraccionMultiplier

	^(numerator * aFraccionMultiplier numerator) / (denominator * aFraccionMultiplier denominator)	! !

!Fraccion methodsFor: 'private' stamp: 'AW 4/20/2021 19:48:12'!
substractFromEntero: anEnteroMinuend

	^ (anEnteroMinuend * denominator - numerator) / denominator! !

!Fraccion methodsFor: 'private' stamp: 'nz 4/20/2021 22:21:40'!
substractFromFraccion: aFraccionMinuend

	^aFraccionMinuend + self negated
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'private' stamp: 'AW 4/21/2021 00:00:14'!
uncheckedWith: aDividend over: aDivisor

	^self new initializeWith: aDividend over: aDivisor
	! !


!Fraccion class methodsFor: 'intance creation' stamp: 'AW 4/21/2021 00:30:11'!
with: aDividend over: aDivisor
	
	^aDividend / aDivisor
	! !
