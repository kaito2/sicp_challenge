#lang racket
(define (sq x y) (+ (* x x) (* y y)))
(define (abc a b c)
  (cond ((> a b)
         (if (> c b) (sq a c) (sq a b)))
        ((< a b)
         (if (> c a) (sq b c) (sq b a)))))

(abc 5
     2 3)