#lang racket
(provide fib)

(define (fib n)
    (fib-iter 1 0 0 1 n)
)

(define (fib-iter a b p q count)
    (cond
        ((= count 0) b)
        ((even? count)
            (fib-iter
                a
                b
                (+ (* p p) (* q q))
                (+ (* q q) (* 2 p q))
                (/ count 2)
            )
        )
        (else
            (fib-iter
                (+ (* a p) (* a q) (* b q))
                (+ (* a q) (* b p))
                p
                q
                (- count 1)
            )
        )
    )
)

(define (even? x) (= (modulo x 2) 0))