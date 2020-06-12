#lang racket
; 2.2
(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")")
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
(define b (make-point 3 4))
(define seg (make-segment a b))
(print-point a)
(print-point b)
(newline)
(display "midpoint ↓")
(print-point (midpoint-segment seg))


; 2.3
(newline)

(define (abs x) (if (< x 0) (- x) x))
(define (seg-width s)
    (abs (- (x-point (start-segment s)) (x-point (end-segment s))))
)
(define (seg-height s)
    (abs (- (y-point (start-segment s)) (y-point (end-segment s))))
)
(define (seg-area s)
    (* (seg-width s) (seg-height s))
)
(define (seg-length s)
    (+ (* (seg-width s) 2) (* (seg-height s) 2))
)
(display "area: ")
(seg-area seg)
(display "length: ")
(seg-length seg)