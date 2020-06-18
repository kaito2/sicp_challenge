#lang racket

(define (make-rat n d)
    (define (abs x) (if (< x 0) (- x) x))
    (let (
            (g (gcd (abs n) (abs d)))
        )
        (if (< d 0)
            (cons (* (/ n g) -1) (* (/ d g) -1))
            (cons (/ n g) (/ d g))
        )
    )
)
(define numer car)
(define denom cdr)

(define (add-rat x y)
    (make-rat
        (+ (* (numer x) (denom y)) (* (numer y) (denom x)))
        (* (denom x) (denom y))
    )
)

(define (sub-rat x y)
    (make-rat
        (- (* (numer x) (denom y)) (* (numer y) (denom x)))
        (* (denom x) (denom y))
    )
)

(define (mul-rat x y)
    (make-rat
        (* (numer x) (numer y))
        (* (denom x) (denom y))
    )
)

(define (div-rat x y)
    (make-rat
        (* (numer x) (denom y))
        (* (numer y) (denom x))
    )
)

(define (equal-rat? x y)
    (= 
        (* (numer x) (denom y))
        (* (numer y) (denom x))
    )
)

(define a (make-rat 1 2))
(define b (make-rat -1 3))
(add-rat a b)
(add-rat a a)
(sub-rat a b)
(mul-rat a b)
(div-rat a b)

