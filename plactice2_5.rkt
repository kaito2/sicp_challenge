#lang racket

(define (make-pair a b)
  (cond ((> a 0) (* 2 (make-pair (- a 1) b)))
        ((> b 0) (* 3 (make-pair a (- b 1))))
        (else 1)))

(define (car x)
  (cond ((= x 0) 1)
        ((= (remainder x 2) 0) (+ 1 (car (/ x 2))))
        (else 0)))

(define (cdr x)
  (cond ((= x 0) 1)
        ((= (remainder x 3) 0) (+ 1 (cdr (/ x 3))))
        (else 0)))

(car (make-pair 0 3))