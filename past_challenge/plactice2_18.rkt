#lang racket
(define (insert-front l a)
  (cons a l))

(define list1 (list 1 2 3 4))

(define (reverse l)
  (if (null? (cdr l))
      (car l)
      (cons (reverse (cdr l)) (car l))))

(define (test l)
  (cdr l))

(null? (cdr list1))
(reverse list1)