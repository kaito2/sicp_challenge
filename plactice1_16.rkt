#lang racket
(define (f n b a)
  (if (= n 0)
      a
      (f (- n 1) b (* a b))))

(define (exp x n)
  (f n x 1))

(exp 2 10)
