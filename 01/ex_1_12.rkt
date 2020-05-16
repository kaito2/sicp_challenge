#lang racket
(provide pascals-triangle)

(define (pascals-triangle i j)
    (cond ((= i 0) 1)
        ((= j 0) 1)
        (else (+ (pascals-triangle (- i 1) j) (pascals-triangle i (- j 1))))))