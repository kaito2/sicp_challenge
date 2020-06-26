#lang racket
(define nil '())
(define (filter predicate sequence)
    (cond ((null? sequence) nil)
        ((predicate (car sequence)) 
            (cons (car sequence) (filter predicate (cdr sequence)))
        )
        (else (filter predicate (cdr sequence)))
    )
)

(filter odd? (list 1 2 3 4 5))

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence) (accumulate op initial (cdr sequence)))
    )
)

(accumulate + 0 (list 1 2 3 4 5))
; 15
(accumulate * 1 (list 1 2 3 4 5))
; 120

(define (enumerate-interval low high)
    (if (> low high)
        nil
        (cons low (enumerate-interval (+ low 1) high))
    )
)

(enumerate-interval 2 7)
; (2 3 4 5 6 7)

(define (enumerate-tree tree)
    (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))
    )
)

(enumerate-tree (list 1 (list 2 (list 3 4 )) 5))
; (1 2 3 4 5)

(define (sum-odd-squares tree)
    (define (square x) (* x x))
    (accumulate + 0 (map square (filter odd? (enumerate-tree tree))))
)

(sum-odd-squares (list 1 2 (list 3 4) 5))