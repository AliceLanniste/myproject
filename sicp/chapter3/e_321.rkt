#lang racket
(define (print-queue q)
 (define (iter x)
   if (null? x)
       'done
       (begin
          (display (car x))
          (iter (cdr x))))
(iter (front-ptr q)))