#lang racket
(#%require sicp)
;;把eval使用data-directed style重写一遍
;;data-direted style 即是把syntax和操作组件一个表，先使用put组件使用get获取
;;使得eval更加精简

 (define operation-table make-table) 
 (define get (operation-table 'lookup-proc)) 
 (define put (operation-table 'insert-proc)) 

(put 'op 'quote text-of-quote)
(put 'op  'assgin eval-assignment)
(put 'op 'define eval-definiton)
(put 'op 'lambda  (lambda (exp env)
        (make-procedure (lambda-parameters exp)
                        (lambda-body expe) env)))
(put 'op 'begin (lambda (x y)  
                   (eval-sequence (begin-sequence x) y))) 
 (put 'op 'cond (lambda (x y)  
                  (eval (cond->if x) y))) 
  


(define (eval exp env)
  (cond  ((self-evaluating? exp) exp)
         ((variable? exp)  (lookup-variable-value exp env))
         ((get 'op (car exp)) (get 'op (cdr exp)))
         ((application? exp)
          (apply (eval (operator exp)) (list-of-values (operands exp) env)))
          (else (error "unknow expression type:EVAL" exp)))
  )


