#lang racket
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average (/ x (square guess)) guess guess))

(define (average x y z)
  (/ (+ x y z) 3))

(define (good-enough? guess x)
  (< (abs (- (vol guess) x)) 0.001))

(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

(define (vol x)
  (* x x x))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 8)
