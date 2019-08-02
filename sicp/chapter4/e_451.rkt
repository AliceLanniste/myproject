#lang racket
(define (analyze-pernamenant-set? exp)
  (let ((var (assignment-variable exp))
        (proc (analyze (assignment-value exp))))
   (lambda (env success fail)
     ((proc env)
       (lambda(result fail2)
         (set-variable-value! var result)
         (success 'ok fail))
       fail))))


;;使用set!的话 count=1