#lang racket

(define (iterative-improve test improve)
    (lambda (g)
        (define (iter g)
            (if (test g)
                g
                (iter (improve g))
            )
        )
        (iter g)
    )
)

(define (sqrt x)
    (define (good-enough? g)
        (define (square x) (* x x))
        (< (abs (- (square g) x)) 0.0001)
    )
    (define (improve g)
        (define (average x y) (/ (+ x y) 2.0))
        (average g (/ x g))
    )
    ((iterative-improve good-enough? improve) 1.0)
)

(sqrt 2)