#lang racket

(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items)) (map proc (cdr items)))))

(define (abs n)
  (if (< n 0)
      (- n)
      n))

(map abs (list -1 -2 -3 -4))