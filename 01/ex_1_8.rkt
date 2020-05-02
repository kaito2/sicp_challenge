#lang racket
(define (abs x) (if (< x 0) (- x) x))
(define (cube-root x) (sqrt-iter 1.0 x))
(define (square x) (* x x))
(define (cube x) (* x x x))
(define (good-enough? guess x) (< (abs (- (cube guess) x)) 0.1))
(define (improve guess x) (/ (+ (/ x (square guess)) (* 2 guess)) 3))
(define (sqrt-iter guess x) 
    ; (begin (display guess) (display "\n"))
    (
        if (good-enough? guess x) 
        guess
        (sqrt-iter (improve guess x) x)
    )
)

(provide cube-root)
