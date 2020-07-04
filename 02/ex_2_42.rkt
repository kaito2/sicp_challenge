#lang racket

(define make-position cons)
(define get-col car)
(define get-row cdr)
(define null '())
(define empty-board null)

(define (adjoin-position row col positions)
    (cons (make-position col row) positions))

; (adjoin-position 1 2 (list (make-position 0 0)))
; '((2 . 1) (0 . 0))

(define (check? p1 p2)
    (cond ((= (get-col p1) (get-col p2)) #t)
        ((= (get-row p1) (get-row p2)) #t)
        ((= (abs (- (get-col p1) (get-col p2))) (abs (- (get-row p1) (get-row p2)))) #t)
        (else #f)
    )
)

(check? (make-position 0 0) (make-position 2 1))
; #f
(check? (make-position 0 0) (make-position 0 1))
; #t
(check? (make-position 0 0) (make-position 2 0))
; #t
(check? (make-position 1 4) (make-position 4 1))
; #t

(define (safe? col positions)
    (define (rec target positions)
        (if (null? positions)
            #t
            (if (check? target (car positions))
                #f
                (rec target (cdr positions))
            )
        )
    )
    (let ((latest (car positions)))
        (rec latest (cdr positions))
    )
)

(define safe-ps (list (make-position 0 0) (make-position 2 1) (make-position 5 3)))
(safe? 2 safe-ps)

(define unsafe-ps (list (make-position 6 4) (make-position 0 0) (make-position 2 1) (make-position 5 3)))
(safe? 3 unsafe-ps)

(define (enumerate-interval start end)
    (cond ((> start end) null)
        (else (cons start (enumerate-interval (+ start 1) end)))
    )
)

(define (accumulate op init seq)
    (if (null? seq)
        init
        (op (car seq) (accumulate op init (cdr seq)))
    )
)

(define (flatmap proc seq)
    (accumulate append null (map proc seq))
)

(define (queens board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
                (lambda (positions) (safe? k positions))
                (flatmap
                    (lambda (rest-of-queens)
                        (map 
                            (lambda (new-row)
                                (adjoin-position new-row k rest-of-queens)
                            )
                            ; candidate rows
                            (enumerate-interval 1 board-size)
                        )
                    )
                    (queen-cols (- k 1))
                )
            )
        )
    )
    (queen-cols board-size)
)

(queens 5)