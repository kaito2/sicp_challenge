#lang racket

(define (make-frame-with-list origin edge1 edge2)
    (list origin edge1 edge2))
(define (get-origin-from-list frame)
    (car frame))
(define (get-edge1-from-list frame)
    (car (cdr frame)))
(define (get-edge2-from-list frame)
    (car (cdr (cdr frame))))

; XXX: Just check.
; It actually takes a vector as an argument.
(define frm (make-frame-with-list 1 2 3))
(get-origin-from-list frm)
(get-edge1-from-list frm)
(get-edge2-from-list frm)


(define (make-frame-with-cons origin edge1 edge2)
    (cons origin (cons edge1 edge2)))
(define (get-origin-from-cons frame)
    (car frame))
(define (get-edge1-from-cons frame)
    (car (cdr frame)))
(define (get-edge2-from-cons frame)
    (cdr (cdr frame)))

; XXX: Just check.
; It actually takes a vector as an argument.
(define frm2 (make-frame-with-cons 1 2 3))
(get-origin-from-cons frm2)
(get-edge1-from-cons frm2)
(get-edge2-from-cons frm2)
