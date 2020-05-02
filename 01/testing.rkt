#lang racket
(define (assert-that msg assertion) (if (not assertion) (report-error msg) (void)))
(define (report-error msg) (error (string-append "assertion: '" msg "' has failed'")))

(provide assert-that)