#lang racket
(provide fast-expt)

(define (fast-expt b n)
    (fast-expt-iter b n 1)
)

(define (fast-expt-iter b n a)
    (display n)
    (display ", ")
    (display a)
    (display "\n")
    (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (* b b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* a b)))
    )
)

(define (even? x)
    (= (modulo x 2) 0)
)