#lang racket
(define (accumulate op initial seq)
  (if (null? seq)
    ; the accumulated result goes to `initial`
    initial
    (op (car seq)
        (accumulate op initial (cdr seq)))))
(define (count-leaves t)
  (accumulate (lambda(x y) (+ x y))  0 (map (lambda(x) 1) (fringe t))))