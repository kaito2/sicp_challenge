#lang racket
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (odd? n)
  (= 1 (remainder n 2)))

(define (simpson f a b)
  (define n 10000)
  (define h (/ (- b a) n))
  (define (next x)
    (+ x h))
  (define (simpson-term x)
    (define tnum (/ (- x a) h))
    (define l (cond ((or (= tnum a) (> x b) (= x b)) 1)
                    ((odd? tnum) 4)
                    (else 2)))
    (/ (* l h (f x)) 3))
  (sum simpson-term a next b))

(define (cube x)
  (* x x x))

(simpson cube 3 4)

