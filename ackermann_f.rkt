#lang racket
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* y 2))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(A 2 4)

(define (f a x)
  (if (> x 0) (* a (f a (- x 1))) 1))

(f 2 16)

(A 1 16)