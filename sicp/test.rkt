#lang racket
(#%require sicp)
(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))

(define (assignment? exp)
  (tagged-list? exp 'set!))

(define (assignment-variable exp) 
  (cadr exp))

(define (assignment-value exp) (caddr exp))

(assignment? (cons 'set!(cons 'a 1)))
(define A (cons 'set!(cons 'a (cons 1 nil))))

(assignment-value A)
(define z (lambda(a) (+ a 1)))

(z 1)