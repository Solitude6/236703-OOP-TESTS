import random
from classes import *
FILE_START = """TestCase subclass: #OOPEnumTester
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
	
	! !
"""
FILE_END = '! !'
FUNC_START = """!OOPEnumTester methodsFor: 'initialize-release' stamp: 'e.k 4/18/2023 13:15'!
test"""
FUNC_END = '! !\n'

MIN_ENUM_COUNT = 5
MAX_ENUM_COUNT = 10

enum_counter = 0
enums = []


def generate_enum(force_lazy=None, max_count=None):
    global enum_counter, enums
    name = 'Enum' + chr(ord('A') + (enum_counter % 24))
    print(name)
    enum_counter += 1
    val_counter = 0
    val_list = ['val' + chr(ord('A') + x) for x in range(random.randint(MIN_ENUM_COUNT, MAX_ENUM_COUNT if max_count is None else max_count))]
    values = '.'.join(['\'' + val + '\'' for val in val_list])
    values = '{' + values + '}'
    lazy = 'true' if random.randint(0, 1) == 1 else 'false'
    if force_lazy is not None: lazy = 'true' if force_lazy else 'false'
    enums.append(Enum(val_list, lazy, name))
    init = "('initialize', (String cr), '  ^self')"
    cmd = ""
    cmd += f"(Smalltalk hasClassNamed: #{enums[-1].name}) ifTrue: [Smalltalk removeClassNamed: #{enums[-1].name}.].\n"
    for value in enums[-1].values:
        cmd += f"(Smalltalk hasClassNamed: #{enums[-1].name}_{value}__) ifTrue: [Smalltalk removeClassNamed: #{enums[-1].name}_{value}__.].\n"

    cmd += f"""OOPEnum subclass: #{name} values: {values} lazyInitialization: {lazy}
initialize: {init} instanceVariableNames: '' 
classVariableNames: '' poolDictionaries: '' 
category: 'OOP3-Tests'.
"""
    return cmd


def check_created():
    cmd = generate_enum(force_lazy=True)
    new_enum = enums[-1]
    for value in new_enum.values:
        cmd += f"(Smalltalk hasClassNamed:  #{new_enum.name}_{value}__) ifFalse: [ AssertionFailure signal: 'class {new_enum.name}_{value}__ not created (it should have been created despite lazy initialization)'].\n"
        #cmd += f"{new_enum.name} {value}.\n"
        #cmd += f"(Smalltalk hasClassNamed:  #{new_enum.name}_{value}__) ifFalse: [ AssertionFailure signal: 'class {new_enum.name}_{value}__ not created despite call to function'].\n"
    return cmd


def check_lazy():
    cmd = generate_enum(force_lazy=True)
    new_enum = enums[-1]
    for value in new_enum.values:
        cmd += f"(({new_enum.name}_{value}__ allInstances size) = 0) ifFalse: [AssertionFailure signal: 'class {new_enum.name}_{value}__ instance created despite lazy'].\n"
        cmd += f"{new_enum.name} {value}.\n"
        cmd += f"(({new_enum.name}_{value}__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class {new_enum.name}_{value}__ not created despite call to function'].\n"
    return cmd


def check_not_lazy():
    cmd = generate_enum(force_lazy=False)
    new_enum = enums[-1]
    for value in new_enum.values:
        cmd += f"(({new_enum.name}_{value}__ allInstances size) = 1) ifFalse: [AssertionFailure signal: 'class {new_enum.name}_{value}__ instance created despite lazy'].\n"
        cmd += f"{new_enum.name} {value}.\n"
        cmd += f"(({new_enum.name}_{value}__ allInstances size) = 1) ifFalse: [ AssertionFailure signal: 'class {new_enum.name}_{value}__ not created despite call to function'].\n"
    return cmd


def check_compile():
    cmd = generate_enum(force_lazy=False)
    new_enum = enums[-1]
    cmd += f"{new_enum.name} compile: 'testFunc', (String cr), '^''parent'''.\n"
    #cmd += f"self assert: {new_enum.name} testfunc = 'parent'.\n"
    for value in new_enum.values:
        cmd += f"{new_enum.name}_{value}__ compile: 'testFunc', (String cr), '^''{value}'''.\n"
        cmd += f"self assert: {new_enum.name} {value} testFunc = '{value}'.\n"
    return cmd


def check_switch():
    cmd = generate_enum(force_lazy=False, max_count=7)
    new_enum = enums[-1]
    cmd += f"{new_enum.name} addSwitch.\n"
    i = 1
    while i < 2 ** len(new_enum.values):
        j = i
        val_index = 0
        vals = []
        no = []
        curr_switch = "switch_"
        while j > 0:
            if j % 2 == 1:
                curr_switch += f"case_{new_enum.values[val_index]}: [^'{new_enum.values[val_index]}'] "
                vals.append(new_enum.values[val_index])

            val_index += 1
            j = j >> 1

        used_index = random.randint(0, len(vals) - 1)
        if 2 ** len(new_enum.values) - 1 != i:
            curr_switch += "default: [^'default']"
            if random.randint(1, 10) > 8: used_index = -1

        no = [val for val in new_enum.values if val not in vals]
        used_val = vals[used_index] if used_index != -1 \
            else no[0]
        cmd += f"self assert: ({new_enum.name} {used_val} " + curr_switch + f" = '{used_val}').\n"

        i += 1
    return cmd


file = open('OOP3-Tests.st', 'w')
file.write(FILE_START)
file.write(FUNC_START + 'Lazy\n' + check_lazy() + FUNC_END)
file.write(FUNC_START + 'NotLazy\n' + check_not_lazy() + FUNC_END)
file.write(FUNC_START + 'Compile\n' + check_compile() + FUNC_END)
file.write(FUNC_START + 'Switch\n' + check_switch() + FUNC_END)
file.close()
#check_lazy()
