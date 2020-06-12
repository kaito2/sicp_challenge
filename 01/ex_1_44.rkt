#lang racket
(require "ex_1_43.rkt")

(define (smooth f)
    (define dx 0.1)
    (define (average a1 a2 a3)
        (/ (+ a1 a2 a3) 3.0)
    )
    (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx))))
)

(require "../tools/test/testing.rkt")

(define (square x) (* x x))
(define (inc x) (+ x 1))

; test compose
(display "((smooth square) 3) -> (/ (+ (square 2) (square 3) (square 4)) 3)")
(newline)
((smooth square) 3)

(define (n-fold-smooth f n)
    ((repeat smooth n) f)
)

((n-fold-smooth square 3) 3)
