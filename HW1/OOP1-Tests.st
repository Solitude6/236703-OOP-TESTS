TestCase subclass: #PolyStreamTester
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OOP1-Tests'!

!PolyStreamTester methodsFor: 'initialize-release' stamp: 'e.k 4/18/2023 13:15'!
testPolyStream
	| filterSet p1 p2 p3 p4 p5 |
	Transcript clear; cr.
	Transcript show: 'PolyStream Tests:'; cr.
	p1 := PolyStream new.
	p2 := PolyStream new.
	p3 := PolyStream new.
	p4 := PolyStream new.
	p5 := PolyStream new.
	p2 multiplyBy: -3.
	(((p2 eval: 3) = 0))
	ifTrue: [Transcript show: 'Test #1 passed'; cr.]
	ifFalse: [Transcript show: 'Test #1 failed'; cr.].
	p2 multiplyBy: -2.
	(((p2 eval: -5) = 0))
	ifTrue: [Transcript show: 'Test #2 passed'; cr.]
	ifFalse: [Transcript show: 'Test #2 failed'; cr.].
	p4 addCoef: -3 withExp: 2.
	(((p4 eval: 5) = -75))
	ifTrue: [Transcript show: 'Test #3 passed'; cr.]
	ifFalse: [Transcript show: 'Test #3 failed'; cr.].
	p4 substitute: -5.
	(((p4 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #4 passed'; cr.]
	ifFalse: [Transcript show: 'Test #4 failed'; cr.].
	p5 multiplyBy: -4.
	(((p5 eval: 1) = 0))
	ifTrue: [Transcript show: 'Test #5 passed'; cr.]
	ifFalse: [Transcript show: 'Test #5 failed'; cr.].
	filterSet := Set newFrom: #(2).
	p3 filter: filterSet.
	(((p3 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #6 passed'; cr.]
	ifFalse: [Transcript show: 'Test #6 failed'; cr.].
	p5 multiplyBy: 4.
	(((p5 eval: -1) = 0))
	ifTrue: [Transcript show: 'Test #7 passed'; cr.]
	ifFalse: [Transcript show: 'Test #7 failed'; cr.].
	filterSet := Set newFrom: #(0).
	p5 filter: filterSet.
	(((p5 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #8 passed'; cr.]
	ifFalse: [Transcript show: 'Test #8 failed'; cr.].
	p4 addCoef: -5 withExp: 1.
	(((p4 eval: 3) = -690))
	ifTrue: [Transcript show: 'Test #9 passed'; cr.]
	ifFalse: [Transcript show: 'Test #9 failed'; cr.].
	p1 add: p2.
	(((p1 eval: 5) = 0))
	ifTrue: [Transcript show: 'Test #10 passed'; cr.]
	ifFalse: [Transcript show: 'Test #10 failed'; cr.].
	(((p2 eval: 3) = 0))
	ifTrue: [Transcript show: 'Test #11 passed'; cr.]
	ifFalse: [Transcript show: 'Test #11 failed'; cr.].
	p5 add: p5.
	(((p5 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #12 passed'; cr.]
	ifFalse: [Transcript show: 'Test #12 failed'; cr.].
	(((p5 eval: -3) = 0))
	ifTrue: [Transcript show: 'Test #13 passed'; cr.]
	ifFalse: [Transcript show: 'Test #13 failed'; cr.].
	filterSet := Set newFrom: #(0).
	p5 filter: filterSet.
	(((p5 eval: 5) = 0))
	ifTrue: [Transcript show: 'Test #14 passed'; cr.]
	ifFalse: [Transcript show: 'Test #14 failed'; cr.].
	filterSet := Set newFrom: #(1).
	p4 filter: filterSet.
	(((p4 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #15 passed'; cr.]
	ifFalse: [Transcript show: 'Test #15 failed'; cr.].
	p3 substitute: 5.
	(((p3 eval: -2) = 0))
	ifTrue: [Transcript show: 'Test #16 passed'; cr.]
	ifFalse: [Transcript show: 'Test #16 failed'; cr.].
	p4 multiplyBy: -5.
	(((p4 eval: 3) = 3375))
	ifTrue: [Transcript show: 'Test #17 passed'; cr.]
	ifFalse: [Transcript show: 'Test #17 failed'; cr.].
	p4 substitute: 1.
	(((p4 eval: -1) = 375))
	ifTrue: [Transcript show: 'Test #18 passed'; cr.]
	ifFalse: [Transcript show: 'Test #18 failed'; cr.].
	p5 add: p2.
	(((p5 eval: 5) = 0))
	ifTrue: [Transcript show: 'Test #19 passed'; cr.]
	ifFalse: [Transcript show: 'Test #19 failed'; cr.].
	(((p2 eval: -3) = 0))
	ifTrue: [Transcript show: 'Test #20 passed'; cr.]
	ifFalse: [Transcript show: 'Test #20 failed'; cr.].
	filterSet := Set newFrom: #(3).
	p2 filter: filterSet.
	(((p2 eval: 3) = 0))
	ifTrue: [Transcript show: 'Test #21 passed'; cr.]
	ifFalse: [Transcript show: 'Test #21 failed'; cr.].
	p1 substitute: 3.
	(((p1 eval: -1) = 0))
	ifTrue: [Transcript show: 'Test #22 passed'; cr.]
	ifFalse: [Transcript show: 'Test #22 failed'; cr.].
	filterSet := Set newFrom: #(2).
	p4 filter: filterSet.
	(((p4 eval: 3) = 0))
	ifTrue: [Transcript show: 'Test #23 passed'; cr.]
	ifFalse: [Transcript show: 'Test #23 failed'; cr.].
	p1 substitute: 1.
	(((p1 eval: 4) = 0))
	ifTrue: [Transcript show: 'Test #24 passed'; cr.]
	ifFalse: [Transcript show: 'Test #24 failed'; cr.].
	p2 addCoef: 4 withExp: 2.
	(((p2 eval: -2) = 16))
	ifTrue: [Transcript show: 'Test #25 passed'; cr.]
	ifFalse: [Transcript show: 'Test #25 failed'; cr.].
	p2 addCoef: 4 withExp: 1.
	(((p2 eval: 5) = 120))
	ifTrue: [Transcript show: 'Test #26 passed'; cr.]
	ifFalse: [Transcript show: 'Test #26 failed'; cr.].
	p2 add: p1.
	(((p2 eval: -1) = 0))
	ifTrue: [Transcript show: 'Test #27 passed'; cr.]
	ifFalse: [Transcript show: 'Test #27 failed'; cr.].
	(((p1 eval: 1) = 0))
	ifTrue: [Transcript show: 'Test #28 passed'; cr.]
	ifFalse: [Transcript show: 'Test #28 failed'; cr.].
	p1 add: p3.
	(((p1 eval: -3) = 0))
	ifTrue: [Transcript show: 'Test #29 passed'; cr.]
	ifFalse: [Transcript show: 'Test #29 failed'; cr.].
	(((p3 eval: -1) = 0))
	ifTrue: [Transcript show: 'Test #30 passed'; cr.]
	ifFalse: [Transcript show: 'Test #30 failed'; cr.].
	p2 multiplyBy: -3.
	(((p2 eval: -3) = -72))
	ifTrue: [Transcript show: 'Test #31 passed'; cr.]
	ifFalse: [Transcript show: 'Test #31 failed'; cr.].
	p2 multiplyBy: 3.
	(((p2 eval: -2) = -72))
	ifTrue: [Transcript show: 'Test #32 passed'; cr.]
	ifFalse: [Transcript show: 'Test #32 failed'; cr.].
	p5 add: p4.
	(((p5 eval: 2) = 0))
	ifTrue: [Transcript show: 'Test #33 passed'; cr.]
	ifFalse: [Transcript show: 'Test #33 failed'; cr.].
	(((p4 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #34 passed'; cr.]
	ifFalse: [Transcript show: 'Test #34 failed'; cr.].
	p1 multiplyBy: 1.
	(((p1 eval: -4) = 0))
	ifTrue: [Transcript show: 'Test #35 passed'; cr.]
	ifFalse: [Transcript show: 'Test #35 failed'; cr.].
	filterSet := Set newFrom: #(2).
	p4 filter: filterSet.
	(((p4 eval: -5) = 0))
	ifTrue: [Transcript show: 'Test #36 passed'; cr.]
	ifFalse: [Transcript show: 'Test #36 failed'; cr.].
	filterSet := Set newFrom: #(3).
	p2 filter: filterSet.
	(((p2 eval: -1) = 0))
	ifTrue: [Transcript show: 'Test #37 passed'; cr.]
	ifFalse: [Transcript show: 'Test #37 failed'; cr.].
	p1 add: p1.
	(((p1 eval: -4) = 0))
	ifTrue: [Transcript show: 'Test #38 passed'; cr.]
	ifFalse: [Transcript show: 'Test #38 failed'; cr.].
	(((p1 eval: 4) = 0))
	ifTrue: [Transcript show: 'Test #39 passed'; cr.]
	ifFalse: [Transcript show: 'Test #39 failed'; cr.].
	p4 multiplyBy: -2.
	(((p4 eval: -1) = 0))
	ifTrue: [Transcript show: 'Test #40 passed'; cr.]
	ifFalse: [Transcript show: 'Test #40 failed'; cr.].
	p3 addCoef: 5 withExp: 0.
	(((p3 eval: 3) = 5))
	ifTrue: [Transcript show: 'Test #41 passed'; cr.]
	ifFalse: [Transcript show: 'Test #41 failed'; cr.].
	p1 add: p5.
	(((p1 eval: 4) = 0))
	ifTrue: [Transcript show: 'Test #42 passed'; cr.]
	ifFalse: [Transcript show: 'Test #42 failed'; cr.].
	(((p5 eval: -3) = 0))
	ifTrue: [Transcript show: 'Test #43 passed'; cr.]
	ifFalse: [Transcript show: 'Test #43 failed'; cr.].
	p2 add: p5.
	(((p2 eval: -5) = -720))
	ifTrue: [Transcript show: 'Test #44 passed'; cr.]
	ifFalse: [Transcript show: 'Test #44 failed'; cr.].
	(((p5 eval: 1) = 0))
	ifTrue: [Transcript show: 'Test #45 passed'; cr.]
	ifFalse: [Transcript show: 'Test #45 failed'; cr.].
	p2 add: p4.
	(((p2 eval: -4) = -432))
	ifTrue: [Transcript show: 'Test #46 passed'; cr.]
	ifFalse: [Transcript show: 'Test #46 failed'; cr.].
	(((p4 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #47 passed'; cr.]
	ifFalse: [Transcript show: 'Test #47 failed'; cr.].
	filterSet := Set newFrom: #(3).
	p1 filter: filterSet.
	(((p1 eval: 5) = 0))
	ifTrue: [Transcript show: 'Test #48 passed'; cr.]
	ifFalse: [Transcript show: 'Test #48 failed'; cr.].
	filterSet := Set newFrom: #(2).
	p5 filter: filterSet.
	(((p5 eval: -5) = 0))
	ifTrue: [Transcript show: 'Test #49 passed'; cr.]
	ifFalse: [Transcript show: 'Test #49 failed'; cr.].
	filterSet := Set newFrom: #(2).
	p4 filter: filterSet.
	(((p4 eval: -3) = 0))
	ifTrue: [Transcript show: 'Test #50 passed'; cr.]
	ifFalse: [Transcript show: 'Test #50 failed'; cr.].
	filterSet := Set newFrom: #(0).
	p5 filter: filterSet.
	(((p5 eval: 2) = 0))
	ifTrue: [Transcript show: 'Test #51 passed'; cr.]
	ifFalse: [Transcript show: 'Test #51 failed'; cr.].
	p5 addCoef: -2 withExp: 3.
	(((p5 eval: -4) = 128))
	ifTrue: [Transcript show: 'Test #52 passed'; cr.]
	ifFalse: [Transcript show: 'Test #52 failed'; cr.].
	p4 substitute: -4.
	(((p4 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #53 passed'; cr.]
	ifFalse: [Transcript show: 'Test #53 failed'; cr.].
	filterSet := Set newFrom: #(1).
	p2 filter: filterSet.
	(((p2 eval: -4) = -576))
	ifTrue: [Transcript show: 'Test #54 passed'; cr.]
	ifFalse: [Transcript show: 'Test #54 failed'; cr.].
	p3 multiplyBy: -3.
	(((p3 eval: -1) = -15))
	ifTrue: [Transcript show: 'Test #55 passed'; cr.]
	ifFalse: [Transcript show: 'Test #55 failed'; cr.].
	filterSet := Set newFrom: #(3).
	p3 filter: filterSet.
	(((p3 eval: -1) = -15))
	ifTrue: [Transcript show: 'Test #56 passed'; cr.]
	ifFalse: [Transcript show: 'Test #56 failed'; cr.].
	filterSet := Set newFrom: #(3).
	p1 filter: filterSet.
	(((p1 eval: -3) = 0))
	ifTrue: [Transcript show: 'Test #57 passed'; cr.]
	ifFalse: [Transcript show: 'Test #57 failed'; cr.].
	p4 addCoef: 2 withExp: 1.
	(((p4 eval: 2) = 4))
	ifTrue: [Transcript show: 'Test #58 passed'; cr.]
	ifFalse: [Transcript show: 'Test #58 failed'; cr.].
	filterSet := Set newFrom: #(0).
	p1 filter: filterSet.
	(((p1 eval: -4) = 0))
	ifTrue: [Transcript show: 'Test #59 passed'; cr.]
	ifFalse: [Transcript show: 'Test #59 failed'; cr.].
	p2 multiplyBy: 2.
	(((p2 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #60 passed'; cr.]
	ifFalse: [Transcript show: 'Test #60 failed'; cr.].
    Transcript show: 'PolyStream test ended successfully'; cr.
	! !


TestCase subclass: #PolynomTester
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'OOP1-Tests'!

!PolynomTester methodsFor: 'initialize-release' stamp: 'e.k 4/18/2023 13:15'!
testPolynom
	| monom p1 p2 p3 p4 p5 |
	Transcript show: 'Polynom Tests:'; cr.
	p1 := Polynom new.
	p2 := Polynom new.
	p3 := Polynom new.
	p4 := Polynom new.
	p5 := Polynom new.
	p4 := p3 add: p4.
	(((p3 eval: -1) = 0))
	ifTrue: [Transcript show: 'Test #1 passed'; cr.]
	ifFalse: [Transcript show: 'Test #1 failed'; cr.].
	(((p4 eval: -2) = 0))
	ifTrue: [Transcript show: 'Test #2 passed'; cr.]
	ifFalse: [Transcript show: 'Test #2 failed'; cr.].
	(((p4 eval: -2) = 0))
	ifTrue: [Transcript show: 'Test #3 passed'; cr.]
	ifFalse: [Transcript show: 'Test #3 failed'; cr.].
	p2 := p1 add: p2.
	(((p1 eval: -2) = 0))
	ifTrue: [Transcript show: 'Test #4 passed'; cr.]
	ifFalse: [Transcript show: 'Test #4 failed'; cr.].
	(((p2 eval: 1) = 0))
	ifTrue: [Transcript show: 'Test #5 passed'; cr.]
	ifFalse: [Transcript show: 'Test #5 failed'; cr.].
	(((p2 eval: 1) = 0))
	ifTrue: [Transcript show: 'Test #6 passed'; cr.]
	ifFalse: [Transcript show: 'Test #6 failed'; cr.].
	p1 := p5 derivative.
	(((p1 eval: 4) = 0))
	ifTrue: [Transcript show: 'Test #7 passed'; cr.]
	ifFalse: [Transcript show: 'Test #7 failed'; cr.].
	(((p5 eval: -2) = 0))
	ifTrue: [Transcript show: 'Test #8 passed'; cr.]
	ifFalse: [Transcript show: 'Test #8 failed'; cr.].
	monom := Monom new.
	monom exp: 2.
	monom coef: 0.
	p1 multiplyByMonom: monom.
	monom := Monom new.
	monom exp: 0.
	monom coef: -1.
	p2 multiplyByMonom: monom.
	p3 := p2 derivative.
	(((p3 eval: -2) = 0))
	ifTrue: [Transcript show: 'Test #9 passed'; cr.]
	ifFalse: [Transcript show: 'Test #9 failed'; cr.].
	(((p2 eval: -1) = 0))
	ifTrue: [Transcript show: 'Test #10 passed'; cr.]
	ifFalse: [Transcript show: 'Test #10 failed'; cr.].
	monom := Monom new.
	monom exp: 1.
	monom coef: 1.
	p4 addMonom: monom.
	(((p4 eval: -1) = -1))
	ifTrue: [Transcript show: 'Test #11 passed'; cr.]
	ifFalse: [Transcript show: 'Test #11 failed'; cr.].
	p3 := p3 add: p1.
	(((p3 eval: 5) = 0))
	ifTrue: [Transcript show: 'Test #12 passed'; cr.]
	ifFalse: [Transcript show: 'Test #12 failed'; cr.].
	(((p1 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #13 passed'; cr.]
	ifFalse: [Transcript show: 'Test #13 failed'; cr.].
	(((p3 eval: 1) = 0))
	ifTrue: [Transcript show: 'Test #14 passed'; cr.]
	ifFalse: [Transcript show: 'Test #14 failed'; cr.].
	p4 := p5 add: p5.
	(((p5 eval: -4) = 0))
	ifTrue: [Transcript show: 'Test #15 passed'; cr.]
	ifFalse: [Transcript show: 'Test #15 failed'; cr.].
	(((p5 eval: -4) = 0))
	ifTrue: [Transcript show: 'Test #16 passed'; cr.]
	ifFalse: [Transcript show: 'Test #16 failed'; cr.].
	(((p4 eval: 3) = 0))
	ifTrue: [Transcript show: 'Test #17 passed'; cr.]
	ifFalse: [Transcript show: 'Test #17 failed'; cr.].
	p2 := p1 derivative.
	(((p2 eval: -1) = 0))
	ifTrue: [Transcript show: 'Test #18 passed'; cr.]
	ifFalse: [Transcript show: 'Test #18 failed'; cr.].
	(((p1 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #19 passed'; cr.]
	ifFalse: [Transcript show: 'Test #19 failed'; cr.].
	monom := Monom new.
	monom exp: 1.
	monom coef: -2.
	p1 multiplyByMonom: monom.
	p2 := p4 add: p5.
	(((p4 eval: -1) = 0))
	ifTrue: [Transcript show: 'Test #20 passed'; cr.]
	ifFalse: [Transcript show: 'Test #20 failed'; cr.].
	(((p5 eval: 3) = 0))
	ifTrue: [Transcript show: 'Test #21 passed'; cr.]
	ifFalse: [Transcript show: 'Test #21 failed'; cr.].
	(((p2 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #22 passed'; cr.]
	ifFalse: [Transcript show: 'Test #22 failed'; cr.].
	p2 := p3 add: p2.
	(((p3 eval: -1) = 0))
	ifTrue: [Transcript show: 'Test #23 passed'; cr.]
	ifFalse: [Transcript show: 'Test #23 failed'; cr.].
	(((p2 eval: -2) = 0))
	ifTrue: [Transcript show: 'Test #24 passed'; cr.]
	ifFalse: [Transcript show: 'Test #24 failed'; cr.].
	(((p2 eval: -5) = 0))
	ifTrue: [Transcript show: 'Test #25 passed'; cr.]
	ifFalse: [Transcript show: 'Test #25 failed'; cr.].
	p2 := p3 derivative.
	(((p2 eval: 4) = 0))
	ifTrue: [Transcript show: 'Test #26 passed'; cr.]
	ifFalse: [Transcript show: 'Test #26 failed'; cr.].
	(((p3 eval: 3) = 0))
	ifTrue: [Transcript show: 'Test #27 passed'; cr.]
	ifFalse: [Transcript show: 'Test #27 failed'; cr.].
	p3 := p4 add: p4.
	(((p4 eval: -4) = 0))
	ifTrue: [Transcript show: 'Test #28 passed'; cr.]
	ifFalse: [Transcript show: 'Test #28 failed'; cr.].
	(((p4 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #29 passed'; cr.]
	ifFalse: [Transcript show: 'Test #29 failed'; cr.].
	(((p3 eval: -4) = 0))
	ifTrue: [Transcript show: 'Test #30 passed'; cr.]
	ifFalse: [Transcript show: 'Test #30 failed'; cr.].
	monom := Monom new.
	monom exp: 1.
	monom coef: -4.
	p1 multiplyByMonom: monom.
	p2 := p4 derivative.
	(((p2 eval: 4) = 0))
	ifTrue: [Transcript show: 'Test #31 passed'; cr.]
	ifFalse: [Transcript show: 'Test #31 failed'; cr.].
	(((p4 eval: -1) = 0))
	ifTrue: [Transcript show: 'Test #32 passed'; cr.]
	ifFalse: [Transcript show: 'Test #32 failed'; cr.].
	monom := Monom new.
	monom exp: 0.
	monom coef: 0.
	p1 addMonom: monom.
	(((p1 eval: 4) = 0))
	ifTrue: [Transcript show: 'Test #33 passed'; cr.]
	ifFalse: [Transcript show: 'Test #33 failed'; cr.].
	p3 := p2 derivative.
	(((p3 eval: 2) = 0))
	ifTrue: [Transcript show: 'Test #34 passed'; cr.]
	ifFalse: [Transcript show: 'Test #34 failed'; cr.].
	(((p2 eval: 4) = 0))
	ifTrue: [Transcript show: 'Test #35 passed'; cr.]
	ifFalse: [Transcript show: 'Test #35 failed'; cr.].
	p1 := p2 add: p4.
	(((p2 eval: 3) = 0))
	ifTrue: [Transcript show: 'Test #36 passed'; cr.]
	ifFalse: [Transcript show: 'Test #36 failed'; cr.].
	(((p4 eval: -3) = 0))
	ifTrue: [Transcript show: 'Test #37 passed'; cr.]
	ifFalse: [Transcript show: 'Test #37 failed'; cr.].
	(((p1 eval: 4) = 0))
	ifTrue: [Transcript show: 'Test #38 passed'; cr.]
	ifFalse: [Transcript show: 'Test #38 failed'; cr.].
	monom := Monom new.
	monom exp: 3.
	monom coef: 1.
	p3 multiplyByMonom: monom.
	monom := Monom new.
	monom exp: 3.
	monom coef: 1.
	p2 multiplyByMonom: monom.
	monom := Monom new.
	monom exp: 2.
	monom coef: 0.
	p3 addMonom: monom.
	(((p3 eval: 5) = 0))
	ifTrue: [Transcript show: 'Test #39 passed'; cr.]
	ifFalse: [Transcript show: 'Test #39 failed'; cr.].
	p2 := p1 add: p2.
	(((p1 eval: -5) = 0))
	ifTrue: [Transcript show: 'Test #40 passed'; cr.]
	ifFalse: [Transcript show: 'Test #40 failed'; cr.].
	(((p2 eval: -1) = 0))
	ifTrue: [Transcript show: 'Test #41 passed'; cr.]
	ifFalse: [Transcript show: 'Test #41 failed'; cr.].
	(((p2 eval: 4) = 0))
	ifTrue: [Transcript show: 'Test #42 passed'; cr.]
	ifFalse: [Transcript show: 'Test #42 failed'; cr.].
	monom := Monom new.
	monom exp: 0.
	monom coef: -3.
	p2 addMonom: monom.
	(((p2 eval: 5) = -3))
	ifTrue: [Transcript show: 'Test #43 passed'; cr.]
	ifFalse: [Transcript show: 'Test #43 failed'; cr.].
	monom := Monom new.
	monom exp: 0.
	monom coef: -5.
	p1 addMonom: monom.
	(((p1 eval: 0) = -5))
	ifTrue: [Transcript show: 'Test #44 passed'; cr.]
	ifFalse: [Transcript show: 'Test #44 failed'; cr.].
	p2 := p1 derivative.
	(((p2 eval: -5) = 0))
	ifTrue: [Transcript show: 'Test #45 passed'; cr.]
	ifFalse: [Transcript show: 'Test #45 failed'; cr.].
	(((p1 eval: -1) = -5))
	ifTrue: [Transcript show: 'Test #46 passed'; cr.]
	ifFalse: [Transcript show: 'Test #46 failed'; cr.].
	p3 := p4 derivative.
	(((p3 eval: -1) = 0))
	ifTrue: [Transcript show: 'Test #47 passed'; cr.]
	ifFalse: [Transcript show: 'Test #47 failed'; cr.].
	(((p4 eval: -3) = 0))
	ifTrue: [Transcript show: 'Test #48 passed'; cr.]
	ifFalse: [Transcript show: 'Test #48 failed'; cr.].
	p3 := p2 derivative.
	(((p3 eval: -5) = 0))
	ifTrue: [Transcript show: 'Test #49 passed'; cr.]
	ifFalse: [Transcript show: 'Test #49 failed'; cr.].
	(((p2 eval: 5) = 0))
	ifTrue: [Transcript show: 'Test #50 passed'; cr.]
	ifFalse: [Transcript show: 'Test #50 failed'; cr.].
	monom := Monom new.
	monom exp: 3.
	monom coef: -1.
	p4 multiplyByMonom: monom.
	monom := Monom new.
	monom exp: 3.
	monom coef: -5.
	p3 addMonom: monom.
	(((p3 eval: -5) = 625))
	ifTrue: [Transcript show: 'Test #51 passed'; cr.]
	ifFalse: [Transcript show: 'Test #51 failed'; cr.].
	p3 := p3 derivative.
	(((p3 eval: -4) = -240))
	ifTrue: [Transcript show: 'Test #52 passed'; cr.]
	ifFalse: [Transcript show: 'Test #52 failed'; cr.].
	(((p3 eval: 3) = -135))
	ifTrue: [Transcript show: 'Test #53 passed'; cr.]
	ifFalse: [Transcript show: 'Test #53 failed'; cr.].
	p1 := p3 add: p2.
	(((p3 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #54 passed'; cr.]
	ifFalse: [Transcript show: 'Test #54 failed'; cr.].
	(((p2 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #55 passed'; cr.]
	ifFalse: [Transcript show: 'Test #55 failed'; cr.].
	(((p1 eval: -2) = -60))
	ifTrue: [Transcript show: 'Test #56 passed'; cr.]
	ifFalse: [Transcript show: 'Test #56 failed'; cr.].
	p1 := p4 derivative.
	(((p1 eval: 4) = 0))
	ifTrue: [Transcript show: 'Test #57 passed'; cr.]
	ifFalse: [Transcript show: 'Test #57 failed'; cr.].
	(((p4 eval: 2) = 0))
	ifTrue: [Transcript show: 'Test #58 passed'; cr.]
	ifFalse: [Transcript show: 'Test #58 failed'; cr.].
	monom := Monom new.
	monom exp: 2.
	monom coef: 3.
	p1 addMonom: monom.
	(((p1 eval: 2) = 12))
	ifTrue: [Transcript show: 'Test #59 passed'; cr.]
	ifFalse: [Transcript show: 'Test #59 failed'; cr.].
	p5 := p4 add: p2.
	(((p4 eval: -3) = 0))
	ifTrue: [Transcript show: 'Test #60 passed'; cr.]
	ifFalse: [Transcript show: 'Test #60 failed'; cr.].
	(((p2 eval: 2) = 0))
	ifTrue: [Transcript show: 'Test #61 passed'; cr.]
	ifFalse: [Transcript show: 'Test #61 failed'; cr.].
	(((p5 eval: 4) = 0))
	ifTrue: [Transcript show: 'Test #62 passed'; cr.]
	ifFalse: [Transcript show: 'Test #62 failed'; cr.].
	monom := Monom new.
	monom exp: 0.
	monom coef: -4.
	p1 addMonom: monom.
	(((p1 eval: -2) = 8))
	ifTrue: [Transcript show: 'Test #63 passed'; cr.]
	ifFalse: [Transcript show: 'Test #63 failed'; cr.].
	p1 := p3 add: p4.
	(((p3 eval: 3) = -135))
	ifTrue: [Transcript show: 'Test #64 passed'; cr.]
	ifFalse: [Transcript show: 'Test #64 failed'; cr.].
	(((p4 eval: 0) = 0))
	ifTrue: [Transcript show: 'Test #65 passed'; cr.]
	ifFalse: [Transcript show: 'Test #65 failed'; cr.].
	(((p1 eval: 4) = -240))
	ifTrue: [Transcript show: 'Test #66 passed'; cr.]
	ifFalse: [Transcript show: 'Test #66 failed'; cr.].
	monom := Monom new.
	monom exp: 0.
	monom coef: -4.
	p4 addMonom: monom.
	(((p4 eval: -1) = -4))
	ifTrue: [Transcript show: 'Test #67 passed'; cr.]
	ifFalse: [Transcript show: 'Test #67 failed'; cr.].
	p1 := p3 add: p3.
	(((p3 eval: 5) = -375))
	ifTrue: [Transcript show: 'Test #68 passed'; cr.]
	ifFalse: [Transcript show: 'Test #68 failed'; cr.].
	(((p3 eval: 4) = -240))
	ifTrue: [Transcript show: 'Test #69 passed'; cr.]
	ifFalse: [Transcript show: 'Test #69 failed'; cr.].
	(((p1 eval: 4) = -480))
	ifTrue: [Transcript show: 'Test #70 passed'; cr.]
	ifFalse: [Transcript show: 'Test #70 failed'; cr.].
	p2 := p1 derivative.
	(((p2 eval: -2) = 120))
	ifTrue: [Transcript show: 'Test #71 passed'; cr.]
	ifFalse: [Transcript show: 'Test #71 failed'; cr.].
	(((p1 eval: 3) = -270))
	ifTrue: [Transcript show: 'Test #72 passed'; cr.]
	ifFalse: [Transcript show: 'Test #72 failed'; cr.].
	p3 := p4 add: p3.
	(((p4 eval: 2) = -4))
	ifTrue: [Transcript show: 'Test #73 passed'; cr.]
	ifFalse: [Transcript show: 'Test #73 failed'; cr.].
	(((p3 eval: -5) = -379))
	ifTrue: [Transcript show: 'Test #74 passed'; cr.]
	ifFalse: [Transcript show: 'Test #74 failed'; cr.].
	(((p3 eval: -1) = -19))
	ifTrue: [Transcript show: 'Test #75 passed'; cr.]
	ifFalse: [Transcript show: 'Test #75 failed'; cr.].
	p4 := p5 add: p4.
	(((p5 eval: 5) = 0))
	ifTrue: [Transcript show: 'Test #76 passed'; cr.]
	ifFalse: [Transcript show: 'Test #76 failed'; cr.].
	(((p4 eval: 3) = -4))
	ifTrue: [Transcript show: 'Test #77 passed'; cr.]
	ifFalse: [Transcript show: 'Test #77 failed'; cr.].
	(((p4 eval: 1) = -4))
	ifTrue: [Transcript show: 'Test #78 passed'; cr.]
	ifFalse: [Transcript show: 'Test #78 failed'; cr.].
	monom := Monom new.
	monom exp: 2.
	monom coef: 4.
	p4 addMonom: monom.
	(((p4 eval: -3) = 32))
	ifTrue: [Transcript show: 'Test #79 passed'; cr.]
	ifFalse: [Transcript show: 'Test #79 failed'; cr.].
	p5 := p3 derivative.
	(((p5 eval: -1) = 30))
	ifTrue: [Transcript show: 'Test #80 passed'; cr.]
	ifFalse: [Transcript show: 'Test #80 failed'; cr.].
	(((p3 eval: 1) = -19))
	ifTrue: [Transcript show: 'Test #81 passed'; cr.]
	ifFalse: [Transcript show: 'Test #81 failed'; cr.].
	p4 := p3 add: p5.
	(((p3 eval: 0) = -4))
	ifTrue: [Transcript show: 'Test #82 passed'; cr.]
	ifFalse: [Transcript show: 'Test #82 failed'; cr.].
	(((p5 eval: 5) = -150))
	ifTrue: [Transcript show: 'Test #83 passed'; cr.]
	ifFalse: [Transcript show: 'Test #83 failed'; cr.].
	(((p4 eval: 1) = -49))
	ifTrue: [Transcript show: 'Test #84 passed'; cr.]
	ifFalse: [Transcript show: 'Test #84 failed'; cr.].
	p2 := p4 derivative.
	(((p2 eval: -4) = 90))
	ifTrue: [Transcript show: 'Test #85 passed'; cr.]
	ifFalse: [Transcript show: 'Test #85 failed'; cr.].
	(((p4 eval: -5) = -229))
	ifTrue: [Transcript show: 'Test #86 passed'; cr.]
	ifFalse: [Transcript show: 'Test #86 failed'; cr.].
	monom := Monom new.
	monom exp: 2.
	monom coef: 5.
	p1 addMonom: monom.
	(((p1 eval: -5) = -625))
	ifTrue: [Transcript show: 'Test #87 passed'; cr.]
	ifFalse: [Transcript show: 'Test #87 failed'; cr.].
	monom := Monom new.
	monom exp: 3.
	monom coef: 1.
	p1 multiplyByMonom: monom.
	monom := Monom new.
	monom exp: 3.
	monom coef: -5.
	p1 multiplyByMonom: monom.
    Transcript show: 'Polynom test ended successfully'; cr.
	! !