#lang racket
(define (make-square a b) (cons a b))
(define (point-a x) (car x))
(define (point-b x) (cdr x))

(define (make-point x y) (cons x y))
(define (x-coord a) (car a))
(define (y-coord a) (cdr a))

(define (abs n)
  (if (< n 0)
      (- n)
      n))

(define (get-area x)
  (abs (* (- (x-coord (point-a x))
             (x-coord (point-b x)))
          (- (y-coord (point-a x))
             (y-coord (point-b x))))))

(define (get-circum x)
  (+ (* 2
        (abs (- (x-coord (point-a x))
             (x-coord (point-b x)))))
     (* 2
        (abs (- (y-coord (point-a x))
                (y-coord (point-b x)))))))

(define p1 (make-point -1 -1))
(define p2 (make-point 4 4))
(define s1 (make-square p1 p2))

(get-circum s1)