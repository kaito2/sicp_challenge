#lang racket
(define (sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ result (term a)))
        )
    )
    (iter a 0)
)

(require "../tools/test/testing.rkt")

(define (square x) (* x x))
(define (inc x) (+ x 1))

(assert-equal "(sum square 0 inc 3)" 14 (sum square 0 inc 3))
