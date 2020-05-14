#lang racket
(provide f-recursive f-iterative)
(define (f-recursive n)
    (cond ((< n 3) 3)
        (else (+ (f-recursive (- n 1))
            (* 2 (f-recursive (- n 2)))
            (* 3 (f-recursive (- n 3)))))))

(define (f-iterative n)
    (f-iterative-iter 3 3 3 3 n))

(define (f-iterative-iter fMinus1 fMinus2 fMinus3 cnt n)
    (cond ((< n 3) 3)
        ((> cnt n) fMinus1)
        (else (f-iterative-iter (+ fMinus1 (* 2 fMinus2) (* 3 fMinus3)) fMinus1 fMinus2 (+ cnt 1) n))))
