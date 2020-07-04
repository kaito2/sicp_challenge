#lang racket

(define make-vect cons)
(define xcor-vect car)
(define ycor-vect cdr)

(define (add-vect v1 v2)
    (make-vect 
        (+ (xcor-vect v1) (xcor-vect v2)) 
        (+ (ycor-vect v1) (ycor-vect v2))
    )
)

(define (sub-vect v1 v2)
    (make-vect
        (- (xcor-vect v1) (xcor-vect v2))
        (- (ycor-vect v1) (ycor-vect v2))
    )
)

(define (scale-vect n v1)
    (make-vect
        (* n (xcor-vect v1))
        (* n (ycor-vect v1))
    )
)

(define a (make-vect 1 2))
(define b (make-vect 3 4))

(add-vect a b)
(sub-vect a b)
(scale-vect 100 a)
