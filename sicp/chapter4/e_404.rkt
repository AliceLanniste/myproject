#lang racket
(#%require sicp)

;;a
;; install and
;; (and <exp1>... <expn>)
(define (and? exps) (tagged-list? exp 'and))
(defin (and-clause exps) (cdr exps))
(define (first-clause exps) (car exps))
(define (empty-clause exps)  (null? exps))
(define (rest-clause exps) (cdr exps))

(define (eval-and exps env)
  (cond ((empty-clause exps) true)
      (else
        (let ((first (eval (first-clause exps) env)))
             (if (eq? first true)
                 (first (eval-and(rest-clause exps) env))
                 false)

          )
       )
  )

)


;;install or
(define (or? exps) (tagged-list? exp 'or))
(define (or-clause exps) (cdr exps))


(define (eval-or exps env)
  (cond ((empty-clause exps) false)
        (else
          (let ((first (eval (first-clause exps) env)))
            (if (eq? first false)
                false
                (first (eval-or (rest-clause exps) env)))
         )
        )
  ))


;;b
;;所谓的derived expression也就是把and和or的语法转换成现成的语法
;;cond通过cond->if 和expand-clause把cond转成nested if语句
;;因此and和or也可以如下转换
(define (and->if exps)
  (expand-and-clause exps))

(define (expand-and-clause exps)
  (if (empty-clause exps)
      true
      (make-if (first-clause exps) (expand-and-clause(rest-clause exps)) false)))

(define (or->if exps)
  (expand-or-claus exps))
(define (expand-or-clause exps)
  (if (empty-clause exps)
      false)
      (make-if (first-clause exps) true  (expand-or-clause(rest-clause exps))))


