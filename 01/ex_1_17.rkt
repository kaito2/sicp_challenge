#lang racket
(provide mult)

(define (mult a b)
    (iter-mult a b 0)
)

(define (iter-mult a b n)
    (cond 
        ((= b 0) n)
        ((even? b) (iter-mult (double a) (halve b) n))
        (else (iter-mult a (- b 1) (+ n a)))
    )
)

(define (even? x) (= (modulo x 2) 0))
(define (double x) (+ x x))
(define (halve x) (/ x 2))