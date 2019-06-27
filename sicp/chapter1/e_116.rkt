#lang sicp

;;设计一个iterative process且log(n)
(define (fast-expt b n)
  
      (fast-iter 1 b n))
 

(define (fast-iter a b n)
  (cond ((= n 0) a)
    ((even? n)  (fast-iter a (square b) (/ n 2)))
    ( else (fast-iter (* a b) b (- n 1))))
  )

(define (even? n)  (= (remainder n 2) 0))
(define (square x) (* x x))