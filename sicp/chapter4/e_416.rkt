#lang racket
(#%require sicp)
;;a

(define (look-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond? ((null? vars)
              (env-loop (enclosing-enviornment env)))
            ((eq? var (car vars))
             (car vals))
             (if ((eq? (car vals)  '*unassigned*))
                 (error "variable is unassigned" var)
                  (car vals))
             (else (scan (cdr vars)
                         (cdr vals)))
             ))
     (if (eq? env the-empty-environment)
         (error "Unbound variable" var)
         (let ((frame  (first-frame env)))
           (scan (frame-variables frame)
                 (frame-values frame))))
    )
  (env-loop env))

;;b

(define (make-let bindings body)
  (list 'let bindings body))

;;
(define (scan-out-defines body)
    (define (internal-define-var de-exp) (defintion-variable de-exp))
    (define (internal-define-val de-exp) ( defintion-values de-exp))
    (define (set-values de-exp)  (map (lambda(x) (list 'set! (internal-define-var x) (internal-define-val x))) de-exps))
    ;;(define <var1 val1> )(define <var2 val2>)
    ;;把所有define中var绑定到unassigned
    (define (unassigned-vars vars)   (map (lambda(x) (list (internal-define-var x) '*unassigned)) vars))
    ;;如果body中是define语句则把define语句组合，如果不是就直接装进let语句
    (define  (define->let body defines)
            (let (first-clause (first-exp body))
              (if (definition? first-clause)
                  (define->let (rest-exp body) (cons (rest-exp first-clause) defines) )
                 (make-let (unassigned-vars defines) (append (set-values defines) first-clause) ) ))
        )
    
      (define->let body '()))
  

;;c
;;其实我觉得无所谓，如果要选择放到make-procedure会更好，因为make-procedure有env，在计算的时候可以省点力气





