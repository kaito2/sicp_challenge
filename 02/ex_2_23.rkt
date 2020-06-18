#lang racket

(define (for-each proc items)
    (define (iter tmp items)
        (if (null? items)
            #t
            (iter (proc (car items)) (cdr items))
        )
    )
    (iter '() items)
)

(for-each (lambda (x) (newline) (display x)) (list 57 321 88))
