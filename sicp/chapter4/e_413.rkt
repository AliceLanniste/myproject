#lang racket
;;我觉得这道题也太简单了吧总体就是三种情况，env中没有，报错，有把var排除，重组新的env，继续找

(define (make-unbound var env)
  (let ((frame (first-frame env))
         (vars (frame-variable frame))
         (vals (frame-values frame)))
         (define (scan vars vals)
           (cond ((null? vars)
                  (error "variable is not in the environment -- MAKE-UNBOUND"      
                   var))
                 ((eq? var (car vars))
                  (set-car! env (cons (cdr vars) (cdr vals))))
                 (else (scan (cdr vars) (cdr vals))))
           )
    (scan vars vals)))