#lang racket

(define (square x) (* x x))

(define (square-list1 items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter 
                (cdr things) 
                ; ここで先頭に追加していっているから逆順になるよね…
                (cons (square (car things)) answer)
            )
        )
    )
    (iter items '())
)

(square-list1 (list 1 2 3 4))

(define (square-list2 items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter 
                (cdr things)
                ; cons でフラットなリストを作りたかったら、
                ; 第一引数に要素で、第二引数がリストである必要がある。
                ; 2.18 でめちゃくちゃ悩んだ…
                (cons answer (square (car things)))
            )
        )
    )
    (iter items '())
)

(square-list2 (list 1 2 3 4))