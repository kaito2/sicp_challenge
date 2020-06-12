#lang racket
(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")")
    (newline)
)

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define make-point cons)
(define x-point car)
(define y-point cdr)

(define (midpoint-segment s)
    (define (average a b) (/ (+ a b) 2))
    (make-point
        (average (x-point (start-segment s)) (x-point (end-segment s)))
        (average (y-point (start-segment s)) (y-point (end-segment s)))
    )
)

(define a (make-point 1 1))
(define b (make-point 3 3))
(define seg (make-segment a b))
(print-point (midpoint-segment seg))