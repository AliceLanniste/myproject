#lang racket
(define (cons x y) (list 'lazy-list (lambda (m) (m x y))))
(define (car z) ((lazy-list-body z) (lambda (p q) p)))
(define (cdr z) ((lazy-list-body z) (lambda (p q) q)))

(define (lazy-list? exp)
  (tagged-list? exp 'lazy-list))

(define (lazy-list-body exp)
  (cadr exp))

(define (print-lazy-list exp)
   (define (helper current level)
      (if (null? current)
          'done
          (if (> level 10)
              (display "....")
              (begin (display (car current))
                     (newline)
                     (helper (cdr current) (+ level 1))))))
  (helper exp 0))


(define (user-print object)
  (cond ((compound-procedure? object)
         (display
          (list 'compound-procedure
                (procedure-parameters object)
                (procedure-body object)
                '<procedure-env>))
         ((lazy-list? object)
          (print-lazy-list object))
         (else (display object))))