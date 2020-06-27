#lang racket

(define (square-tree tree)
    (define (square x) (* x x))
    (cond 
        ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
            (square-tree (cdr tree)))
        )
    )
)
(define l (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(square-tree l)
; (1 (4 (9 16) 25) (36 49))

(define (square-tree-with-map tree)
    (define (square x) (* x x))
    (map 
        (lambda (sub-tree) 
            ; map なので null チェックをする必要がない
            (if (pair? sub-tree)
                (square-tree-with-map sub-tree)
                (square sub-tree)
            )
        )
        tree
    )
)
(square-tree-with-map l)