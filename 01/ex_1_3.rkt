#lang racket
(define (min a b) (if (< a b) a b))
(define (square x) (* x x))
(define (f a b c) (- (+ (square a) (square b) (square c)) (min a (min b c))))

(f 1 2 3)