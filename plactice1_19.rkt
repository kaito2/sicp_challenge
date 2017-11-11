#lang racket
(define (mult-iter a b n)
  (cond ((= b 1) (+ a n))
        ((even? b) (mult-iter (double a) (halve b) n))
        (else (mult-iter a (- b 1) (+ n a)))))

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (mult a b)
  (mult-iter a b 0))

(mult 3 7)