#lang racket

(define (scale-list l n)
  (if (null? (cdr l))
      (cons (* n (car l)) null)
      (cons (* n (car l)) (scale-list (cdr l) n))))

(define list1 (list 1 2 3 4))

(scale-list list1 10)