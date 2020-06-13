#lang racket
(define (my-cons x y)
    (* (expt 2 x) (expt 3 y))
)
(define (my-car z)    
    (if (= (modulo z 2) 0)
        (+ 1 (my-car (/ z 2)))
        0
    )
)
(define (my-cdr z)    
    (if (= (modulo z 3) 0)
        (+ 1 (my-car (/ z 3)))
        0
    )
)
(define a (my-cons 2 3))
(my-car a)
(my-cdr a)