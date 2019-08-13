#lang racket

(define three '(a b c))

(define p1 '(y))
(define p2 cons(p1 p1))
(define p3 cons('a p2))

;;同理
;;无限递归