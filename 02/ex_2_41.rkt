#lang racket
(require "./ex_2_40.rkt")

(define null '())
(define (enumerate-interval start end)
    (define (inc x) (+ x 1))
    (cond ((> start end) null)
        ((= start end) (cons end null))
        (else (cons start (enumerate-interval (inc start) end)))))

; (enumerate-interval 1 10)

(define (accumulate op init seq)
    (if (null? seq) 
        init
        (op (car seq) (accumulate op init (cdr seq)))
    )
)

(define (unique-trios n)
    (accumulate 
        append
        null
        (map
            (lambda (x) 
                (display x)
                (newline)
                (map 
                    (lambda (y) (cons x y)) 
                    (unique-pairs (- x 1))
                )
            )
            (enumerate-interval 3 10)
        )
    )
)
; (unique-trios 10)

(define (sum-of-trio trio)
    (+ (car trio)
        (car (cdr trio))
        (car (cdr (cdr trio)))
    )
)

; (sum-of-trio (list 1 2 3))
; 6

(define (find-sum-of-trio n)   
    (accumulate 
        (lambda (x y) 
            (if (= (sum-of-trio x) n)
                (cons x y)
                y
            )
        )
        null
        (unique-trios n)
    )
)

(find-sum-of-trio 10)