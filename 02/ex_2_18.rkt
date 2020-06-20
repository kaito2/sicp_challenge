#lang racket

(define (reverse l)
    (display l)
    (newline)
    (if (null? (cdr l))
        l
        (append (reverse (cdr l)) (list (car l)))
    )
)

(reverse (list 1 4 9 16 25))
; (25 16 9 4 1)