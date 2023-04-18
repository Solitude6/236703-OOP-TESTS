import random
import numpy as np

FILE_START = """TestCase subclass: #PolyStreamTester
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OOP1-Tests'!

!PolyStreamTester methodsFor: 'initialize-release' stamp: 'e.k 4/18/2023 13:15'!
testPolyStream
"""

FILE_END = """    Transcript show: 'PolyStream test ended successfully'; cr.
	! !"""
POLY_COUNT = 5
COEF_RANGE = 5
EXP_RANGE = 3
EVAL_RANGE = 5
FILE_NAME = 'OOP1-Tests.st'
TEST_COUNT = 50
global test_counter, passed_counter
test_counter = 0
passed_counter = 0



def generate_assert(p):
    global test_counter, passed_counter
    eval_point = random.randint(-EVAL_RANGE, EVAL_RANGE)
    test_counter += 1
    file.write(f"""\t(((p{p} eval: {eval_point}) = {int(polynoms[p](eval_point))}))
\tifTrue: [Transcript show: \'Test #{test_counter} passed\'; cr.]
\tifFalse: [Transcript show: \'Test #{test_counter} failed\'; cr.].\n""")


polynoms = [np.poly1d([]) for i in range(POLY_COUNT + 1)]
file = open(FILE_NAME, 'w')
file.write(FILE_START)
var_string = "\t| filterSet "
for i in range(POLY_COUNT):
    var_string += f'p{i + 1} '
var_string += '|\n'
file.write(var_string)
file.write('\tTranscript clear; cr.\n')
file.write('\tTranscript show: \'PolyStream Tests:\'; cr.\n')
init_str = "\n".join([f'\tp{i + 1} := PolyStream new.' for i in range(POLY_COUNT)])
init_str += '\n'
file.write(init_str)

for i in range(TEST_COUNT):
    option = random.randint(1, 5)
    if option == 1:
        p = random.randint(1, POLY_COUNT)
        coef = random.randint(-COEF_RANGE, COEF_RANGE)
        #coef = 1 if coef == 0 else coef
        exp = random.randint(0, EXP_RANGE)
        poly_temp = np.poly1d([coef] + [0 for i in range(exp)])
        polynoms[p] = np.polyadd(polynoms[p], poly_temp)
        file.write(f'\tp{p} addCoef: {coef} withExp: {exp}.\n')
        generate_assert(p)


    if option == 2:
        p1 = random.randint(1, POLY_COUNT)
        p2 = random.randint(1, POLY_COUNT)
        polynoms[p1] = np.polyadd(polynoms[p1], polynoms[p2])
        polynoms[p2] = np.poly1d([])
        file.write(f'\tp{p1} add: p{p2}.\n')
        file.write(f'\tp{p2} := PolyStream new.\n')

        generate_assert(p1)
        generate_assert(p2)

    if option == 3:
        p1 = random.randint(1, POLY_COUNT)
        coef = random.randint(-COEF_RANGE, COEF_RANGE)
        coef = 1 if coef == 0 else coef
        file.write(f'\tp{p1} multiplyBy: {coef}.\n')
        polynoms[p1] *= coef
        generate_assert(p1)

    if option == 4:
        p1 = random.randint(1, POLY_COUNT)
        coef = random.randint(-COEF_RANGE, COEF_RANGE)
        coef = 1 if coef == 0 else coef
        p = polynoms[p1]
        #polynoms[p1].coeffs = p.coeffs * (coef ** np.arange(p.order + 1))
        coefs = p.coeffs
        sub = coef
        new_coeffs = list(reversed([var * (sub ** exp) for exp, var in enumerate(reversed(p.coef))]))
        polynoms[p1] = np.poly1d(new_coeffs)
        file.write(f'\tp{p1} substitute: {coef}.\n')
        generate_assert(p1)

    if option == 5:
        filter_number = random.randint(0, EXP_RANGE)
        p1 = random.randint(1, POLY_COUNT)
        coeffs = list(reversed(polynoms[p1].coef))
        if len(coeffs) > filter_number:
            coeffs[filter_number] = 0
        polynoms[p1] = np.poly1d(list(reversed(coeffs)))
        file.write(f'\tfilterSet := Set newFrom: #({filter_number}).\n')
        file.write(f'\tp{p1} filter: filterSet.\n')
        generate_assert(p1)


#print(option)

file.write(FILE_END)
file.write('\n\n\n')

POLYNOM_START = """TestCase subclass: #PolynomTester
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OOP1-Tests'!

!PolynomTester methodsFor: 'initialize-release' stamp: 'e.k 4/18/2023 13:15'!
testPolynom
"""

FILE_END = """    Transcript show: 'Polynom test ended successfully'; cr.
	! !"""
file.write(POLYNOM_START)
test_counter = 0
polynoms = [np.poly1d([]) for i in range(POLY_COUNT + 1)]
var_string = "\t| monom "
for i in range(POLY_COUNT):
    var_string += f'p{i + 1} '
var_string += '|\n'
file.write(var_string)
file.write('\tTranscript show: \'Polynom Tests:\'; cr.\n')
init_str = "\n".join([f'\tp{i + 1} := Polynom new.' for i in range(POLY_COUNT)])
init_str += '\n'
file.write(init_str)

for i in range(TEST_COUNT):
    option = random.randint(1, 4)
    if option == 1:
        p = random.randint(1, POLY_COUNT)
        coef = random.randint(-COEF_RANGE, COEF_RANGE)
        # coef = 1 if coef == 0 else coef
        exp = random.randint(0, EXP_RANGE)
        poly_temp = np.poly1d([coef] + [0 for i in range(exp)])
        polynoms[p] = np.polyadd(polynoms[p], poly_temp)
        file.write(f'\tmonom := Monom new.\n')
        file.write(f'\tmonom exp: {exp}.\n')
        file.write(f'\tmonom coef: {coef}.\n')
        file.write(f'\tp{p} addMonom: monom.\n')
        generate_assert(p)

    if option == 2:
        p1 = random.randint(1, POLY_COUNT)
        p2 = random.randint(1, POLY_COUNT)
        p3 = random.randint(1, POLY_COUNT)
        polynoms[p3] = np.polyadd(polynoms[p1], polynoms[p2])
        file.write(f'\tp{p3} := p{p1} add: p{p2}.\n')
        generate_assert(p1)
        generate_assert(p2)
        generate_assert(p3)

    if option == 3:
        p = random.randint(1, POLY_COUNT)
        coef = random.randint(-COEF_RANGE, COEF_RANGE)
        # coef = 1 if coef == 0 else coef
        exp = random.randint(0, EXP_RANGE)
        poly_temp = np.poly1d([coef] + [0 for i in range(exp)])
        polynoms[p] = np.polymul(polynoms[p], poly_temp)
        file.write(f'\tmonom := Monom new.\n')
        file.write(f'\tmonom exp: {exp}.\n')
        file.write(f'\tmonom coef: {coef}.\n')
        file.write(f'\tp{p} multiplyByMonom: monom.\n')
        generate_assert(p)

    if option == 4:
        p1 = random.randint(1, POLY_COUNT)
        p2 = random.randint(1, POLY_COUNT)
        polynoms[p1] = polynoms[p2].deriv()
        file.write(f'\tp{p1} := p{p2} derivative.\n')
        generate_assert(p1)
        generate_assert(p2)





file.write(FILE_END)
file.close()
