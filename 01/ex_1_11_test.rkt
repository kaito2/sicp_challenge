#lang racket
(require "../tools/test/testing.rkt")
(require "./ex_1_11.rkt")

(assert-equal "(recursive) n = 2" (f-recursive 2) 3)
(assert-equal "(recursive) n = 3" (f-recursive 3) 18)
(assert-equal "(recursive) n = 4" (f-recursive 4) 33)

(assert-equal "(iterative) n = 2" 3 (f-iterative 2))
(assert-equal "(iterative) n = 3" 18 (f-iterative 3))
(assert-equal "(iterative) n = 4" 33 (f-iterative 4))