#lang racket
(provide gcd)
(define (gcd x y)
    (define (max a b)
        (if (> a b)
            a
            b
        )
    )
    (define (gcd-iter x y candidate)
        (if (and (= (modulo x candidate) 0) (= (modulo y candidate) 0))
            candidate
            (gcd-iter x y (- candidate 1))
        )
    )
    (gcd-iter x y (max x y))
)

(gcd 6 9)
(gcd 5 15)