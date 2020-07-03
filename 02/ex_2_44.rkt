#lang sicp
; (require sicp-pict)
(#%require sicp-pict)

(define (up-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (up-split painter (- n 1))))
            (below painter (beside smaller smaller))
        )
    )
)

; (up-split wave 1)
; cannot execute !!!!!!!