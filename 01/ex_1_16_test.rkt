#lang racket
(require "../tools/test/testing.rkt")
(require "./ex_1_16.rkt")

(assert-equal "3^4" 81 (fast-expt 3 4))