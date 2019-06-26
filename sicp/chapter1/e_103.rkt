#lang sicp
(define (take-two-large-value a b c)
  (cond ((and (>= a c) (>= b c) )  sumsquare a b)
        ((and (>= a b) (>= c b) )  sumsquare a c)
        ((and (>= b a) (>= c a))  sumsquare b c)
        )
  )