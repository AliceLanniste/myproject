#lang racket
(define (make-accumlator initial)
  (lambda(other)
    (begin (set! initial (+ initial other))
           initial)
  ))

(define A (make-accumlator 10))
(A 5)
(A 10)