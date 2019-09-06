#lang racket
(define (adjoin-set a set)
  (cond
    ((null? set) (cons a set))
    ((= (car set) a) set)
    ((< a (car set) )
      (cons a set))
    (else 
      (cons (car set)
        (adjoin-set a (cdr set))))))