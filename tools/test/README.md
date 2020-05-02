## Usage

`sample.rkt`

```sample.rkt
#lang racket
(require "../tools/test/testing.rkt")

(assert-equal "Error is not expected!" 1 1)
(assert-equal "Error is expected!" 1 0)
```

```
$ racket sample.rkt
*** assertion failed ***
msg: 'Error is expected!'
want: '1'
got: '0'

  context...:
   "/Users/kaito2/.ghq/github.com/kaito2/sicp_challenge/tools/test/sample.rkt": [running body]
   temp35_0
   for-loop
   run-module-instance!
   perform-require!
```