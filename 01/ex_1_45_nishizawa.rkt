#lang racket

(define (expt b n)
  (define (fastest-expt-iter b n a)
    (cond
      ((= n 0) a)
      ((even? n) (fastest-expt-iter (square b) (halve n) a))
      (else (fastest-expt-iter b (- n 1) (* a b)))
    )
  )
  (fastest-expt-iter b n 1)
)

(define (average x y) (/ (+ x y) 2))

(define (square x) (* x x))

(define (even? n) (= (remainder n 2) 0))

(define (halve n) (/ n 2))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2) (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next)
      )
    )
  )
  (try first-guess)
)

(define (average-damp f)
  (lambda (x) (average x (f x)))
)

(define (repeated f n)
  (if (= n 1)
    (lambda (x) (f x))
    (compose f (repeated f (- n 1)))
  )
)

(define (n-root-test x n c)
  (fixed-point
    ((repeated average-damp c) (lambda (y) (/ x (expt y (- n 1)))))
    1.0
  )
)

(define k 4)
; (n-root-test (expt 2 k) k 1)
; (n-root-test (expt 2 k) k 2)
; (n-root-test (expt 2 k) k 3)
(n-root-test (expt 2 k) k 4)
