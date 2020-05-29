#lang racket
(require "../tools/test/testing.rkt")
(require "./ex_1_19.rkt")

(assert-equal "Fib(10)" 55 (fib 10))
(assert-equal "Fib(100)" 354224848179261915075 (fib 100))