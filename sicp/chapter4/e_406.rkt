#lang racket
(#%require sicp)
;;使用derived expression来实现let语句

(define (let? exp) (tagged-list? exp 'let))
(define (let-pair exp) (cadr exp))

(define (let-var clause) (map car clause))
(define (let-exps clause) (map cadr clause))
(define (let-body exp) (cddr exp))


(define (eval-let exp env)
 (eval (let->combination exp) env)
  )


(define (let->combination exp)
   (if (null? exp)
    'false
    (cons (make-lambda (let-var (let-pair exp)) (let-body exp))
    (let-exp (let-pair exp)))))