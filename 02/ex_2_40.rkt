#lang racket
(provide unique-pairs)

; `end` must be greater than or equal to `start`
(define (enumerate-interval start end)
    (cond ((> start end) null)
        ((= start end) (list end))
        (else (cons start (enumerate-interval (+ start 1) end)))))

; (enumerate-interval 1 10)

(define null '())
(define (accumulate op init sequence)
    (if (null? (cdr sequence))
        (car sequence) 
        (op (car sequence) (accumulate op init (cdr sequence)))))

; (accumulate + 0 (list 1 2 3 4 5))

(define (unique-pairs n)
    (accumulate
        append
        (list null)
        (map 
            (lambda (x) 
                (map 
                    (lambda (y) (append (list x) (list y)))
                    (enumerate-interval 1 (- x 1))))
            (enumerate-interval 1 n))))

; (unique-pairs 10)
(require "../01/smallest-divisor.rkt")
(define (prime-sum? pair)
    (prime? (sum-of-pair pair)))
(define (sum-of-pair pair)
    (+ (car pair) (cdr pair))
)

; (accumulate 
;     ; judge prime?(x.i + x.j)
;     (lambda (x y) 
;         (if (prime-sum? x)
;             (cons (list (car x) (cdr x) (sum-of-pair x)) y)
;             y
;         )
;     )
;     null 
;     (unique-pairs 10)
; )