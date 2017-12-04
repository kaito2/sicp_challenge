#lang racket
(define (abs n)
  (if (< n 0)
      (- n)
      n))

(define (positive? n)
  (or (> n 0) (= n 0)))

(define (make-rat a b)
  (if (positive? (* a b))
      (cons (abs a) (abs b))
      (cons (- (abs a)) (abs b))))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat -1 -2))
      