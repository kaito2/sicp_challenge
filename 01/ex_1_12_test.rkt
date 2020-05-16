#lang racket
(require "../tools/test/testing.rkt")
(require "./ex_1_12.rkt")

(assert-equal "i = 0, j = 0" 1 (pascals-triangle 0 0))
(assert-equal "i = 2, j = 3" 10 (pascals-triangle 2 3))
(assert-equal "i = 3, j = 4" 35 (pascals-triangle 3 4))
