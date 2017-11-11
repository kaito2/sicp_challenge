#lang racket

#! (偶数)/2も奇数になりうるという可能性を見落としていた
#! ex. 6/2=3

(define (mult-iter a b)
  (if (= b 1)
      a
      (mult-iter (double a) (halve b))))
  

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

(define (mult a b)
  (if (even? b) (mult-iter a b) (+ a (mult-iter a (- b 1)))))

(mult 3 7)