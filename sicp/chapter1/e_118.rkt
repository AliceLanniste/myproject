#lang racket
(define (double x) (+ x x))
(define (halve x) (/ x 2))

;; axb b=0 axb= 0 result为结果
(define (my-mult a b)
  (define  (helper a b result)
    (cond ((= b 0) result)
          ((even? b) my-mult (double a) (halve b))
          (else (my-mult a (- b 1) (+ a result))))
  
  )
  (helper a b 0)
  )