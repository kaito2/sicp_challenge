#lang racket

(define (square n)
  (* n n))

(define (square-list1 items)
  (if (null? items)
      null
      (cons (square (car items)) (square-list1 (cdr items)))))

(square-list1 (list 1 2 3 4))

(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items)) (map proc (cdr items)))))

(define (square-list2 items)
  (map square items))

(square-list2 (list 1 2 3 4))