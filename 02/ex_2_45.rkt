#lang racket

(define (split sec fir)
    (lambda (painter) (sec painter (fir painter painter)))
)

; cannot execute !!!!!!!