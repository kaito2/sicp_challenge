#lang racket

(define (subsets s)
    (if (null? s)
        (list '())
        (let 
            ((rest (subsets (cdr s))))
            (display (car s))
            (append rest (map (lambda (x) (cons (car s) x)) rest))
        )
    )
)

(subsets '(1 2 3))