#lang racket
(define (cnt a)
  (if (< a 0.1) 0 (+ 1 (cnt (/ a 3)))))

(cnt 12.15)