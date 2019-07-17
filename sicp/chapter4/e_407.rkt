#lang racket
(#%require sicp)


(define (eval-let* exp env)
  (eval (let*->nested-lets exp) env))

(define (let* exp) (tagged-list? exp 'let*))
(define (let-pair exp) (cadr exp))
(define (let-body exp) (cddr exp))
(define (make-let bindings body)
  (cons 'let (cons bindings body)))


(define (let*->nested-lets exp)
   (define (helper vars body)
     (if (null? vars)
         (sequence->exp body)
         (make-let (list (car vars))
                   (list (helper (cdr vars) body)))))
  (helper (let-pair exp) (let-body exp)))
  