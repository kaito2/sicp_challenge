#lang racket
(require "smallest-divisor.rkt")

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (current-inexact-milliseconds))
)

(define (start-prime-test n start-millisec)
    (if (prime? n)
        (report-prime (- (current-inexact-milliseconds) start-millisec))
        (display "not prime")
    )
)

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time)
)

(timed-prime-test 216063822110665427813261110433)