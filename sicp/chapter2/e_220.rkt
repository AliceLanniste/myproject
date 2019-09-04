#lang racket
(define (same-parity f . last)
  (let (cond? (if (even? f)
                  even?
                  odd?))
    (define (iter items result)
      (if (null? items)
          (reverse result)
          (iter (cdr items) (if (cond? (car items))
                                 (cons (car items) result)
                                 result))))
    (iter last (list f))))