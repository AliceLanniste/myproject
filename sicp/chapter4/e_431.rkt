#lang racket
(define (apply procedure arguments env)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure
          procedure
-          (list-of-arg-values
            arguments
            env)))
       ((compound-procedure? procedure)
        (let (params (procedure-parameters procedure))
          (eval-sequence
           (procedure-body procedure)
            (extend-parameters (flat-statements params)
                                (list-of-delayed-args parameters arguments env)
                                 (procedure-environment procedure)))))

       (else (error"unknown procedure type:APPLY" procedure))))


 (define (flat-statements parameters) 
   (if (null? parameters) 
       '() 
       (let ((first (car parameters)) (rest (cdr parameters))) 
         (cond ((or (lazy-parameter? first) 
                    (lazy-memo-parameter? first)) 
                (cons (car first) (rib-statements rest))) 
               ((variable? first) 
                (cons first (flat-statements rest))) 
               (else 
                (error "Bad Syntax" first)))))) 


(define (list-of-delayed-args paras exps env)                
   (if (no-operands? exps) 
       '() 
       (cons (cond ((lazy-parameter? (car paras)) 
                    (delay-lazy (first-operand exps) env)) 
                   ((lazy-memo-parameter? (car paras)) 
                    (delay-lazy-memo (first-operand exps) env)) 
                   (else 
                    (eval (first-operand exps) env))) 
             (list-of-delayed-args (cdr paras) (rest-operands exps) env)))) 

(define (lazy-parameter? p) 
   (and (pair? p) (eq? (cadr p) 'lazy) (null? (cddr p)))) 
  
 (define (lazy-memo-parameter? p) 
   (and (pair? p) (eq? (cadr p) 'lazy-memo) (null? (cddr p)))) 
  


(define (delay-lazy exp env)
  (list 'lazy exp env))

(define (delay-memo exp env)
  (list 'lazy-memo exp env))

(define (eval-lazy-memo? obj) 
   (tagged-list? obj 'eval-lazy-memo))


(define (force-it obj)
  (cond  ((lazy? obj)
          (actual-value(thunk-exp obj) (thunk-env obj)))
           ((lazy-demo? obj)
            (let ((result (actual-value (thunk-exp obj) (thunk-env obj)))
             (set-car! obj 'eval-lazy-memo)
             (set-car! (cdr obj) result)
             (set-cdr! (cdr obj) '()))
           result))
  ((eval-lazy-memo? obj)
   (thunk-value obj))
   (else obj)))