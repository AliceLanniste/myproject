#lang racket
  
 (define (for-each proc list) 
   (cond 
    ((null? list) #t) 
    (else (proc (car list)) 
          (for-each proc (cdr list))))