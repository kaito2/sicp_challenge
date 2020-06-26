#lang racket

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence))
        )
    )
)

(define nil '())
(define (map proc sequence)
    (if (null? sequence)
        nil
        (cons (proc (car sequence))
            (map proc (cdr sequence))
        )
    )
)

(define (count-leaves t)
    (accumulate 
        +
        0
        (map 
            (lambda (x) 
                (if (pair? x)
                    (count-leaves x)
                    1
                )
            )
            t
        )
    )
)

(define t (list (list 1 2 ) (list 3 4)))
(count-leaves t)