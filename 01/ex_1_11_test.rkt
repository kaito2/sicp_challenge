#lang racket
(require "../tools/test/testing.rkt")
(require "./ex_1_11.rkt")

(assert-equal "n = 2" (f 2) 3)
(assert-equal "n = 3" (f 3) 18)
(assert-equal "n = 4" (f 4) 33)
