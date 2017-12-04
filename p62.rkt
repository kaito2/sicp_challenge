#lang racket
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-integer a b)
  (define (inc n)
    (+ n 1))
  (define (identity n)
    n)
  (sum identity a inc b))

(sum-integer 1 10)
