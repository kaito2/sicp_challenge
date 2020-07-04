; how to execute: http://community.schemewiki.org/?sicp-ex-2.44
#lang racket
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1))) 

(define (split sec fir)
    (define (rec painter n) 
        (if (= n 0)
            painter
            (rec 
                (sec painter (fir painter painter))
                (- n 1)
            )
        )
    )
    rec
)

 (paint ((split beside below) einstein 2)) 