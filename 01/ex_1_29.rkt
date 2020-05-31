#lang racket
(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
            (sum term (next a) next b)
        )
    )
)

(define (simpson f a b n)
    (define h (/ (- b a) n))
    (define (y k) (f (+ a (* k h))))
    (define (simpson-coef k)
        (* (/ h 3.0) 
            (cond 
                ((or (= k 0) (= k n)) 1.0)
                ((= (modulo k 2) 0) 2.0)
                (else 4.0)
            )
        )
    )
    (define (simpson-term k) 
        (* (simpson-coef k) (y k))
    )
    (define (inc n) (+ n 1))
    (sum simpson-term a inc n)
)

(require "../tools/test/testing.rkt")

(define (cube x)
    (* x x x)
)

(assert-equal "f = x^3" 0.25000000000000006 (simpson cube 0 1 1000))