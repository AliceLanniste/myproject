#lang racket

;;这道题最开始我想使用message pass方法，但发现写出来的代码太丑陋，
;;经过发现唯一会变化的就是null-proc和eq-proc只要把这俩单独摘出来其他的不变

(define (env-loop env null-proc  eq-proc)
  (define (scan vars vals)
         (cond ((null? vars)
                (null-proc)
                ((eq? var (car vars))  eq-proc)
                (else (scan (cdr vars) (cdr vals)))
               )))
  (if (eq? env the-empty-environment)
      (error "unbound variable")
   (let ((frame (first-frame env)))
     (scan (frame-variables frame) (frame-values frame)))
  ))

  

(define  (define-variable! variable value env)
  (define (helper)
    (add-binding-to-frame! variable value (first-frame env)))
  (env-loop env (helper) (set-value value)))

(define (set-value val)
  (lambda(vals)(set-car!vals val)))

(define (set-variable-value! var val env)
  (define (set-helper env)
    (set-variable-value! var val (enclosing-environment env)))
   (env-loop env (set-helper env) (set-value val)))

(define (lookup-variable-value variable env)
    (define (look-helper env)
    (set-variable-value! var val (enclosing-environment env)))
  (env-loop env   (look-helper env) car))