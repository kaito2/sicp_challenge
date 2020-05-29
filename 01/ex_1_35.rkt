#lang racket
(define tolerance 0.00001)
(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2))
            tolerance
        )
    )
    (define (try guess)
        (display guess)
        (newline)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next)
            )
        )
    )
    (try first-guess)
)

; 1.35
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

; 1.36
; w/o average damping
(fixed-point (lambda (x) (/ (log 1000) (log x))) 3.0)
; 33 lines

; w average damping
(define (average a b)
    (/ (+ a b) 2)
)
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 3.0)
; 9 lines