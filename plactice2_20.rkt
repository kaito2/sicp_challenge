#lang racket

(define list1 (list 1 2 3 4))

(define (same-parity-iter n x)
  (if (not (null? (cdr x)))
      (if (= n (remainder (car x) 2))
          (cons (car x) (same-parity-iter n (cdr x)))
          (same-parity-iter n (cdr x)))
      (if (= n (remainder (car x) 2))
          (cons (car x) null)
          null)))

(define (same-parity . w)
  (same-parity-iter (remainder (car w) 2) w))

(same-parity 1 2 3 8 9 17 4)