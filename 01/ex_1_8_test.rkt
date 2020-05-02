#lang racket
(require "testing.rkt")
(require "ex_1_8.rkt")

(assert-that "equal failed" (= (sqrt 2) 1.4142135623730951))
