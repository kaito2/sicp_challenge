#lang racket

(define zero 
    (lambda (f)
        (lambda (x) x)
    )
)
(define (add-one n)
    (lambda (f)
        (lambda (x) (f ((n f) x)))
    )
)
(define one
    (lambda (f)
        (lambda (x) (f x))
    )
)
(define two
    (lambda (f)
        (lambda (x) (f (f x)))
    )
)
(define (print-int n)
    (define (inc x) (+ x 1))
    (define (to-int n)
        ((n inc) 0)
    )
    (newline)
    (display (to-int n))
)

(print-int one)
(print-int two)
(print-int (add-one two))