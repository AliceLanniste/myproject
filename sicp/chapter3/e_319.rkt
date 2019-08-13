#lang racket
(define (has-circle x)
  (define (safe-cdr l)
    (if (pair? l)
        (cdr l)
     '()))
 (define (iter slow fast)
   (cond ((eq? slow fast) #t)
         ((not (pair? slow)) #f)
         ((not (pair? fast) ) #f)
         ((eq? (slow (safe-cdr fast)) #t)
         (else (iter (safe-cdr slow) (safe-cdr(safe-cdr fast)))))
   )
  (iter (safe-cdr x) (safe-cdr(safe-cdr x))))