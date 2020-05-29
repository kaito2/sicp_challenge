#lang racket
(require "../tools/test/testing.rkt")
(require "./ex_1_17.rkt")

(assert-equal "3*4" 12 (mult 3 4))