#lang racket
(provide smallest-divisor prime?)

(define (prime? n)
    (= n (smallest-divisor n)))

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
    (cond 
        ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))
    )
)
(define (square x) (* x x))
(define (divides? x n) (= (modulo x n) 0))
