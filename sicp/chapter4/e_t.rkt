#lang racket
(define (first-exp seq) (car seq))
(define (rest-exps seq) (cdr seq))


(define f (first-exp`((define u val1)
        (define v val2)
        (something)
        (foo))))

(define (definition? exp)
  (tagged-list? exp 'define))
(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))

(rest-exps f)

(define f-clause (definition? f))