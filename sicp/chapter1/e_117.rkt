#lang sicp

   (define (double x) (+ x x)) 
   (define (halve x) (/ x 2))

(define (define-mult a b)
  (helper a b 0)
  )

(define (helper a b n)
  (cond  ((= b 0) n)
         ((even? b) (helper (double a) (halve b) n))
         (else (helper a (- b 1) (+ a n))))
  )
