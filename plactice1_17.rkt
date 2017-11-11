#lang racket
(define (kakeru a b)
  (cond ((= b 0) 0)
        ((even? b) (double (kakeru a (halve b))))
        (else (+ a (kakeru a (- b 1))))))

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(kakeru 3 7)