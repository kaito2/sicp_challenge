#lang racket

(define (same-parity? x y)
    (= (modulo x 2) (modulo y 2))
)

; 反復プロセス
(define (same-parity first . items)
    (define (iter answer items)
        (if (null? items)
            answer
            (if (same-parity? (car answer) (car items))
                (iter (append answer (list (car items))) (cdr items))
                (iter answer (cdr items))
            )
        )
    )
    (iter (list first) items)
)

(same-parity 1 2 3 5 7)

; 再帰プロセス
; => 表現できなさそう!! できれば教えてほしい!!