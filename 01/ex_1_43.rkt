#lang racket
(provide repeat)

(define (compose f g)
    (lambda (x) (f (g x)))
)

(define (repeat f n)
    (define (identifier x)
        x
    )
    (define (repeat-iter f n composed)
        (if (= n 0)
            composed
            (repeat-iter f (- n 1) (compose f composed))
        )
    )
    (repeat-iter f n identifier)
)

(require "../tools/test/testing.rkt")

(define (square x) (* x x))
(define (inc x) (+ x 1))

; test compose
(assert-equal "" 49 ((compose square inc) 6))

; test repeat
(assert-equal "" 625 ((repeat square 2) 5))
(assert-equal "" 100 ((repeat inc 99) 1))
