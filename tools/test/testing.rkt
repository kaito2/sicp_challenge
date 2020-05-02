#lang racket
(define (assert-that msg assertion) (if (not assertion) (report-error msg) (void)))
(define (report-error msg) (error (string-append "assertion: '" msg "' has failed'")))
(define (assert-equal msg want got)
    (if (not (= want got)) 
        (error (string-append "*** assertion failed ***\n" "msg: '" msg "'\n" "want: '" (~a want) "'\n" "got: '" (~a got) "'\n"))
        (void)
    )
)

(provide assert-that assert-equal)