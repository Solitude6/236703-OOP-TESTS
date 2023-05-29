TestCase subclass: #OOPEnumTester
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OOP3-Tests'!

!OOPEnumTester methodsFor: 'as yet unclassified' stamp: 'e.k 5/28/2023 12:14'!
assertError: codeBlock expectedError: errorMsg
	| raised correct msg | 
	raised := False.
	correct := False.
	codeBlock on: AssertionFailure do: [ :exception |
		raised := True.
		msg := exception messageText.
		((exception messageText) = errorMsg)
		ifTrue: [correct := True]
	].
	(raised = False) ifTrue: [AssertionFailure signal: 'Error wasn''t raised (when an error was expected)'].
	(correct = False) ifTrue: [AssertionFailure signal: 'The Error that was raised had an incorrect signal'].
	! !

!OOPEnumTester methodsFor: 'as yet unclassified' stamp: 'e.k 5/28/2023 13:02'!
testErrors
	| color val1 |
	(Smalltalk hasClassNamed: #EnumTest) ifTrue: [Smalltalk removeClassNamed: #EnumTest].
	self assertError: [OOPEnum subclass: #EnumTest
			instanceVariableNames: '' 
			classVariableNames: '' 
			poolDictionaries: '' 
			category: 'OOP3-Tests'.
	] expectedError: 'You must specify EnumTest''s values'.
	
	(Smalltalk hasClassNamed: #OOPColor) ifTrue: [ Smalltalk removeClassNamed: #OOPColor. ].
	(Smalltalk hasClassNamed: #OOPColor_RED__) ifTrue: [ Smalltalk removeClassNamed: #OOPColor_RED__. ].
	(Smalltalk hasClassNamed: #OOPColor_YELLOW__) ifTrue: [ Smalltalk removeClassNamed: #OOPColor_YELLOW__. ].
	(Smalltalk hasClassNamed: #OOPColor_GREEN__) ifTrue: [ Smalltalk removeClassNamed: #OOPColor_GREEN__. ].
	color := OOPEnum subclass: #OOPColor 
		values: {'RED'. 'YELLOW'. 'GREEN'.} 
		lazyInitialization: true 
		initialize: ('initialize', (String cr), '	^self')
		instanceVariableNames: '' 
		classVariableNames: '' 
		poolDictionaries: '' 
		category: 'OOP3-Tests'.
	
	self assertError: [val1 := OOPColor_RED__.
	val1 compile: 'printHello', (String cr), '	Transcript show: ''hello!!''; cr. '.]
	expectedError: 'printHello does not override a method from OOPColor'.
	
	(Smalltalk hasClassNamed: #OOPC) ifTrue: [ Smalltalk removeClassNamed: #OOPC. ].
	self assertError: [
		OOPColor subclass: #OOPC 
		values: {'RED'. 'YELLOW'. 'GREEN'.} 
		lazyInitialization: true 
		initialize: ('initialize', (String cr), '	^self')
		instanceVariableNames: '' 
		classVariableNames: '' 
		poolDictionaries: '' 
		category: 'OOP3-Tests'.	
	] expectedError: 'OOPColor is final!! It can''t be inherited'.

	self assertError: [
		OOPEnum addSwitch.
	] expectedError: 'can''t add switch functionality to non-Enum class OOPEnum'.
	
	self assertError: [
	    EnumDictionary onEnum: String
	] expectedError: 'String is not an Enum'.
	
	val1 := EnumDictionary onEnum: OOPColor.
	self assertError: [
	    val1 setEnum: String.
	] expectedError: 'the Dictionary''s Enum is already defined with OOPColor'.
	
	self assertError: [
	    val1 setEnum: OOPColor.
	] expectedError: 'the Dictionary''s Enum is already defined with OOPColor'.
	
	self assert: (val1 getEnum = OOPColor).
	self assertError: [
	    val1 add: 1->'hel'.
	] expectedError: 'this EnumDictionary only accepts OOPColor''s values as keys'.
	! !
!OOPEnumTester methodsFor: 'initialize-release' stamp: 'e.k 4/18/2023 13:15'!
testLazy
(Smalltalk hasClassNamed: #EnumA) ifTrue: [Smalltalk removeClassNamed: #EnumA.].
(Smalltalk hasClassNamed: #EnumA_valA__) ifTrue: [Smalltalk removeClassNamed: #EnumA_valA__.].
(Smalltalk hasClassNamed: #EnumA_valB__) ifTrue: [Smalltalk removeClassNamed: #EnumA_valB__.].
(Smalltalk hasClassNamed: #EnumA_valC__) ifTrue: [Smalltalk removeClassNamed: #EnumA_valC__.].
(Smalltalk hasClassNamed: #EnumA_valD__) ifTrue: [Smalltalk removeClassNamed: #EnumA_valD__.].
(Smalltalk hasClassNamed: #EnumA_valE__) ifTrue: [Smalltalk removeClassNamed: #EnumA_valE__.].
(Smalltalk hasClassNamed: #EnumA_valF__) ifTrue: [Smalltalk removeClassNamed: #EnumA_valF__.].
OOPEnum subclass: #EnumA values: {'valA'.'valB'.'valC'.'valD'.'valE'.'valF'} lazyInitialization: true
initialize: ('initialize', (String cr), '  ^self') instanceVariableNames: '' 
classVariableNames: '' poolDictionaries: '' 
category: 'OOP3-Tests'.
((EnumA_valA__ allInstances size) = 0) ifFalse: [AssertionFailure signal: 'class EnumA_valA__ instance created despite lazy'].
EnumA valA.
((EnumA_valA__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumA_valA__ not created despite call to function'].
((EnumA_valB__ allInstances size) = 0) ifFalse: [AssertionFailure signal: 'class EnumA_valB__ instance created despite lazy'].
EnumA valB.
((EnumA_valB__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumA_valB__ not created despite call to function'].
((EnumA_valC__ allInstances size) = 0) ifFalse: [AssertionFailure signal: 'class EnumA_valC__ instance created despite lazy'].
EnumA valC.
((EnumA_valC__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumA_valC__ not created despite call to function'].
((EnumA_valD__ allInstances size) = 0) ifFalse: [AssertionFailure signal: 'class EnumA_valD__ instance created despite lazy'].
EnumA valD.
((EnumA_valD__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumA_valD__ not created despite call to function'].
((EnumA_valE__ allInstances size) = 0) ifFalse: [AssertionFailure signal: 'class EnumA_valE__ instance created despite lazy'].
EnumA valE.
((EnumA_valE__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumA_valE__ not created despite call to function'].
((EnumA_valF__ allInstances size) = 0) ifFalse: [AssertionFailure signal: 'class EnumA_valF__ instance created despite lazy'].
EnumA valF.
((EnumA_valF__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumA_valF__ not created despite call to function'].
! !
!OOPEnumTester methodsFor: 'initialize-release' stamp: 'e.k 4/18/2023 13:15'!
testNotLazy
(Smalltalk hasClassNamed: #EnumB) ifTrue: [Smalltalk removeClassNamed: #EnumB.].
(Smalltalk hasClassNamed: #EnumB_valA__) ifTrue: [Smalltalk removeClassNamed: #EnumB_valA__.].
(Smalltalk hasClassNamed: #EnumB_valB__) ifTrue: [Smalltalk removeClassNamed: #EnumB_valB__.].
(Smalltalk hasClassNamed: #EnumB_valC__) ifTrue: [Smalltalk removeClassNamed: #EnumB_valC__.].
(Smalltalk hasClassNamed: #EnumB_valD__) ifTrue: [Smalltalk removeClassNamed: #EnumB_valD__.].
(Smalltalk hasClassNamed: #EnumB_valE__) ifTrue: [Smalltalk removeClassNamed: #EnumB_valE__.].
(Smalltalk hasClassNamed: #EnumB_valF__) ifTrue: [Smalltalk removeClassNamed: #EnumB_valF__.].
(Smalltalk hasClassNamed: #EnumB_valG__) ifTrue: [Smalltalk removeClassNamed: #EnumB_valG__.].
(Smalltalk hasClassNamed: #EnumB_valH__) ifTrue: [Smalltalk removeClassNamed: #EnumB_valH__.].
(Smalltalk hasClassNamed: #EnumB_valI__) ifTrue: [Smalltalk removeClassNamed: #EnumB_valI__.].
(Smalltalk hasClassNamed: #EnumB_valJ__) ifTrue: [Smalltalk removeClassNamed: #EnumB_valJ__.].
OOPEnum subclass: #EnumB values: {'valA'.'valB'.'valC'.'valD'.'valE'.'valF'.'valG'.'valH'.'valI'.'valJ'} lazyInitialization: false
initialize: ('initialize', (String cr), '  ^self') instanceVariableNames: '' 
classVariableNames: '' poolDictionaries: '' 
category: 'OOP3-Tests'.
((EnumB_valA__ allInstances size) = 1) ifFalse: [AssertionFailure signal: 'class EnumB_valA__ instance created despite lazy'].
EnumB valA.
((EnumB_valA__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumB_valA__ not created despite call to function'].
((EnumB_valB__ allInstances size) = 1) ifFalse: [AssertionFailure signal: 'class EnumB_valB__ instance created despite lazy'].
EnumB valB.
((EnumB_valB__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumB_valB__ not created despite call to function'].
((EnumB_valC__ allInstances size) = 1) ifFalse: [AssertionFailure signal: 'class EnumB_valC__ instance created despite lazy'].
EnumB valC.
((EnumB_valC__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumB_valC__ not created despite call to function'].
((EnumB_valD__ allInstances size) = 1) ifFalse: [AssertionFailure signal: 'class EnumB_valD__ instance created despite lazy'].
EnumB valD.
((EnumB_valD__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumB_valD__ not created despite call to function'].
((EnumB_valE__ allInstances size) = 1) ifFalse: [AssertionFailure signal: 'class EnumB_valE__ instance created despite lazy'].
EnumB valE.
((EnumB_valE__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumB_valE__ not created despite call to function'].
((EnumB_valF__ allInstances size) = 1) ifFalse: [AssertionFailure signal: 'class EnumB_valF__ instance created despite lazy'].
EnumB valF.
((EnumB_valF__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumB_valF__ not created despite call to function'].
((EnumB_valG__ allInstances size) = 1) ifFalse: [AssertionFailure signal: 'class EnumB_valG__ instance created despite lazy'].
EnumB valG.
((EnumB_valG__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumB_valG__ not created despite call to function'].
((EnumB_valH__ allInstances size) = 1) ifFalse: [AssertionFailure signal: 'class EnumB_valH__ instance created despite lazy'].
EnumB valH.
((EnumB_valH__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumB_valH__ not created despite call to function'].
((EnumB_valI__ allInstances size) = 1) ifFalse: [AssertionFailure signal: 'class EnumB_valI__ instance created despite lazy'].
EnumB valI.
((EnumB_valI__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumB_valI__ not created despite call to function'].
((EnumB_valJ__ allInstances size) = 1) ifFalse: [AssertionFailure signal: 'class EnumB_valJ__ instance created despite lazy'].
EnumB valJ.
((EnumB_valJ__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class EnumB_valJ__ not created despite call to function'].
! !
!OOPEnumTester methodsFor: 'initialize-release' stamp: 'e.k 4/18/2023 13:15'!
testCompile
(Smalltalk hasClassNamed: #EnumC) ifTrue: [Smalltalk removeClassNamed: #EnumC.].
(Smalltalk hasClassNamed: #EnumC_valA__) ifTrue: [Smalltalk removeClassNamed: #EnumC_valA__.].
(Smalltalk hasClassNamed: #EnumC_valB__) ifTrue: [Smalltalk removeClassNamed: #EnumC_valB__.].
(Smalltalk hasClassNamed: #EnumC_valC__) ifTrue: [Smalltalk removeClassNamed: #EnumC_valC__.].
(Smalltalk hasClassNamed: #EnumC_valD__) ifTrue: [Smalltalk removeClassNamed: #EnumC_valD__.].
(Smalltalk hasClassNamed: #EnumC_valE__) ifTrue: [Smalltalk removeClassNamed: #EnumC_valE__.].
(Smalltalk hasClassNamed: #EnumC_valF__) ifTrue: [Smalltalk removeClassNamed: #EnumC_valF__.].
(Smalltalk hasClassNamed: #EnumC_valG__) ifTrue: [Smalltalk removeClassNamed: #EnumC_valG__.].
(Smalltalk hasClassNamed: #EnumC_valH__) ifTrue: [Smalltalk removeClassNamed: #EnumC_valH__.].
(Smalltalk hasClassNamed: #EnumC_valI__) ifTrue: [Smalltalk removeClassNamed: #EnumC_valI__.].
(Smalltalk hasClassNamed: #EnumC_valJ__) ifTrue: [Smalltalk removeClassNamed: #EnumC_valJ__.].
OOPEnum subclass: #EnumC values: {'valA'.'valB'.'valC'.'valD'.'valE'.'valF'.'valG'.'valH'.'valI'.'valJ'} lazyInitialization: false
initialize: ('initialize', (String cr), '  ^self') instanceVariableNames: '' 
classVariableNames: '' poolDictionaries: '' 
category: 'OOP3-Tests'.
EnumC compile: 'testFunc', (String cr), '^''parent'''.
EnumC_valA__ compile: 'testFunc', (String cr), '^''valA'''.
self assert: EnumC valA testFunc = 'valA'.
EnumC_valB__ compile: 'testFunc', (String cr), '^''valB'''.
self assert: EnumC valB testFunc = 'valB'.
EnumC_valC__ compile: 'testFunc', (String cr), '^''valC'''.
self assert: EnumC valC testFunc = 'valC'.
EnumC_valD__ compile: 'testFunc', (String cr), '^''valD'''.
self assert: EnumC valD testFunc = 'valD'.
EnumC_valE__ compile: 'testFunc', (String cr), '^''valE'''.
self assert: EnumC valE testFunc = 'valE'.
EnumC_valF__ compile: 'testFunc', (String cr), '^''valF'''.
self assert: EnumC valF testFunc = 'valF'.
EnumC_valG__ compile: 'testFunc', (String cr), '^''valG'''.
self assert: EnumC valG testFunc = 'valG'.
EnumC_valH__ compile: 'testFunc', (String cr), '^''valH'''.
self assert: EnumC valH testFunc = 'valH'.
EnumC_valI__ compile: 'testFunc', (String cr), '^''valI'''.
self assert: EnumC valI testFunc = 'valI'.
EnumC_valJ__ compile: 'testFunc', (String cr), '^''valJ'''.
self assert: EnumC valJ testFunc = 'valJ'.
! !
!OOPEnumTester methodsFor: 'initialize-release' stamp: 'e.k 4/18/2023 13:15'!
testSwitch
(Smalltalk hasClassNamed: #EnumD) ifTrue: [Smalltalk removeClassNamed: #EnumD.].
(Smalltalk hasClassNamed: #EnumD_valA__) ifTrue: [Smalltalk removeClassNamed: #EnumD_valA__.].
(Smalltalk hasClassNamed: #EnumD_valB__) ifTrue: [Smalltalk removeClassNamed: #EnumD_valB__.].
(Smalltalk hasClassNamed: #EnumD_valC__) ifTrue: [Smalltalk removeClassNamed: #EnumD_valC__.].
(Smalltalk hasClassNamed: #EnumD_valD__) ifTrue: [Smalltalk removeClassNamed: #EnumD_valD__.].
(Smalltalk hasClassNamed: #EnumD_valE__) ifTrue: [Smalltalk removeClassNamed: #EnumD_valE__.].
OOPEnum subclass: #EnumD values: {'valA'.'valB'.'valC'.'valD'.'valE'} lazyInitialization: false
initialize: ('initialize', (String cr), '  ^self') instanceVariableNames: '' 
classVariableNames: '' poolDictionaries: '' 
category: 'OOP3-Tests'.
EnumD addSwitch.
self assert: ((EnumD valA switch_case_valA: [^'valA'] default: [^'default']) = 'valA').
self assert: ((EnumD valA switch_case_valB: [^'valB'] default: [^'default']) = 'default').
self assert: ((EnumD valA switch_case_valA: [^'valA'] case_valB: [^'valB'] default: [^'default']) = 'valA').
self assert: ((EnumD valA switch_case_valC: [^'valC'] default: [^'default']) = 'default').
self assert: ((EnumD valC switch_case_valA: [^'valA'] case_valC: [^'valC'] default: [^'default']) = 'valC').
self assert: ((EnumD valA switch_case_valB: [^'valB'] case_valC: [^'valC'] default: [^'default']) = 'default').
self assert: ((EnumD valA switch_case_valA: [^'valA'] case_valB: [^'valB'] case_valC: [^'valC'] default: [^'default']) = 'valA').
self assert: ((EnumD valD switch_case_valD: [^'valD'] default: [^'default']) = 'valD').
self assert: ((EnumD valA switch_case_valA: [^'valA'] case_valD: [^'valD'] default: [^'default']) = 'valA').
self assert: ((EnumD valA switch_case_valB: [^'valB'] case_valD: [^'valD'] default: [^'default']) = 'default').
self assert: ((EnumD valD switch_case_valA: [^'valA'] case_valB: [^'valB'] case_valD: [^'valD'] default: [^'default']) = 'valD').
self assert: ((EnumD valC switch_case_valC: [^'valC'] case_valD: [^'valD'] default: [^'default']) = 'valC').
self assert: ((EnumD valA switch_case_valA: [^'valA'] case_valC: [^'valC'] case_valD: [^'valD'] default: [^'default']) = 'valA').
self assert: ((EnumD valB switch_case_valB: [^'valB'] case_valC: [^'valC'] case_valD: [^'valD'] default: [^'default']) = 'valB').
self assert: ((EnumD valC switch_case_valA: [^'valA'] case_valB: [^'valB'] case_valC: [^'valC'] case_valD: [^'valD'] default: [^'default']) = 'valC').
self assert: ((EnumD valE switch_case_valE: [^'valE'] default: [^'default']) = 'valE').
self assert: ((EnumD valA switch_case_valA: [^'valA'] case_valE: [^'valE'] default: [^'default']) = 'valA').
self assert: ((EnumD valB switch_case_valB: [^'valB'] case_valE: [^'valE'] default: [^'default']) = 'valB').
self assert: ((EnumD valB switch_case_valA: [^'valA'] case_valB: [^'valB'] case_valE: [^'valE'] default: [^'default']) = 'valB').
self assert: ((EnumD valA switch_case_valC: [^'valC'] case_valE: [^'valE'] default: [^'default']) = 'default').
self assert: ((EnumD valB switch_case_valA: [^'valA'] case_valC: [^'valC'] case_valE: [^'valE'] default: [^'default']) = 'default').
self assert: ((EnumD valC switch_case_valB: [^'valB'] case_valC: [^'valC'] case_valE: [^'valE'] default: [^'default']) = 'valC').
self assert: ((EnumD valC switch_case_valA: [^'valA'] case_valB: [^'valB'] case_valC: [^'valC'] case_valE: [^'valE'] default: [^'default']) = 'valC').
self assert: ((EnumD valD switch_case_valD: [^'valD'] case_valE: [^'valE'] default: [^'default']) = 'valD').
self assert: ((EnumD valD switch_case_valA: [^'valA'] case_valD: [^'valD'] case_valE: [^'valE'] default: [^'default']) = 'valD').
self assert: ((EnumD valE switch_case_valB: [^'valB'] case_valD: [^'valD'] case_valE: [^'valE'] default: [^'default']) = 'valE').
self assert: ((EnumD valE switch_case_valA: [^'valA'] case_valB: [^'valB'] case_valD: [^'valD'] case_valE: [^'valE'] default: [^'default']) = 'valE').
self assert: ((EnumD valE switch_case_valC: [^'valC'] case_valD: [^'valD'] case_valE: [^'valE'] default: [^'default']) = 'valE').
self assert: ((EnumD valA switch_case_valA: [^'valA'] case_valC: [^'valC'] case_valD: [^'valD'] case_valE: [^'valE'] default: [^'default']) = 'valA').
self assert: ((EnumD valA switch_case_valB: [^'valB'] case_valC: [^'valC'] case_valD: [^'valD'] case_valE: [^'valE'] default: [^'default']) = 'default').
self assert: ((EnumD valD switch_case_valA: [^'valA'] case_valB: [^'valB'] case_valC: [^'valC'] case_valD: [^'valD'] case_valE: [^'valE'] ) = 'valD').
! !
!OOPEnumTester methodsFor: 'initialize-release' stamp: 'e.k 4/18/2023 13:15'!
testDictionaryEnum
| dict |
(Smalltalk hasClassNamed: #EnumE) ifTrue: [Smalltalk removeClassNamed: #EnumE.].
(Smalltalk hasClassNamed: #EnumE_valA__) ifTrue: [Smalltalk removeClassNamed: #EnumE_valA__.].
(Smalltalk hasClassNamed: #EnumE_valB__) ifTrue: [Smalltalk removeClassNamed: #EnumE_valB__.].
(Smalltalk hasClassNamed: #EnumE_valC__) ifTrue: [Smalltalk removeClassNamed: #EnumE_valC__.].
(Smalltalk hasClassNamed: #EnumE_valD__) ifTrue: [Smalltalk removeClassNamed: #EnumE_valD__.].
(Smalltalk hasClassNamed: #EnumE_valE__) ifTrue: [Smalltalk removeClassNamed: #EnumE_valE__.].
OOPEnum subclass: #EnumE values: {'valA'.'valB'.'valC'.'valD'.'valE'} lazyInitialization: false
initialize: ('initialize', (String cr), '  ^self') instanceVariableNames: '' 
classVariableNames: '' poolDictionaries: '' 
category: 'OOP3-Tests'.
dict := EnumDictionary onEnum: EnumE.
dict add: EnumE valA -> 'LxRluVFMkJ'.
self assert: (dict at: EnumE valA) = 'LxRluVFMkJ'.
dict add: EnumE valB -> 'fEPADonfUn'.
self assert: (dict at: EnumE valB) = 'fEPADonfUn'.
dict add: EnumE valC -> 'xtmxKinxuF'.
self assert: (dict at: EnumE valB) = 'fEPADonfUn'.
dict add: EnumE valE -> 'vFpJhidwLm'.
self assert: (dict at: EnumE valC) = 'xtmxKinxuF'.
dict add: EnumE valD -> 'sGCqgoYrnO'.
self assert: (dict at: EnumE valB) = 'fEPADonfUn'.
dict removeKey: EnumE valE.
self assert: (dict at: EnumE valC) = 'xtmxKinxuF'.
dict removeKey: EnumE valA.
self assert: (dict at: EnumE valD) = 'sGCqgoYrnO'.
dict removeKey: EnumE valD.
self assert: (dict at: EnumE valC) = 'xtmxKinxuF'.
dict removeKey: EnumE valC.
self assert: (dict at: EnumE valB) = 'fEPADonfUn'.
dict removeKey: EnumE valB.
! !
