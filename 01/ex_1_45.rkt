#lang racket
(require "ex_1_43.rkt")
(require "ex_1_35.rkt")

(define k 1)

(define (average-damp f)
    (lambda (x) (average x (f x)))
)

; FIXME: 観察して k の値を決定する必要あり
(define (n-th-root n x)
    (fixed-point
        ((repeat average-damp k) ((lambda (y) (/ x (expt y (- n 1))))))
        1.0
    )
)

(do ((n 1 (+ n 1))) ((= n 32))
(display (n-th-root n 2)) (newline))