#lang racket
(#%require sicp)

(define (clause-arrow? clause)
  (eq? (cadr clause) '=>))
(define (cond? exp) 
  (tagged-list? exp 'cond))
(define (cond-clauses exp) (cdr exp))
(define (cond-else-clause? clause)
  (eq? (cond-predicate clause) 'else))
(define (cond-predicate clause) 
  (car clause))
(define (cond-actions clause) 
  (cdr clause))



(define (tagged-list? exp tag)
  (if (pair? exp)
      (eq? (car exp) tag)
      false))

(define (cond->if exp)
  expand-clauses (cond-clauses exp))

(define (expand-clauses clauses env)
  (if (null?  clauses)
       'false

       (let ((first (car clauses))
             (rest (cdr clauses)))
            (if (cond-else-clause? first)
                (if (null? rest)
                    (sequence->exp
                      (cond->actions first ))
                    (error "ELSE cluase isn't last:COND->IF" clause))

                  (if (clause-arrow? first)
                     (make-if (cond-predicate first)
                         (list (cadr (cond-actions first))
                                  (cond-predicate first))
                      (expand-clause rest env))

                     (make-if (cond-predicate first)
                              (cond-actions first)
                              (expan-clause rest env))
                     )
         ))
  ))
