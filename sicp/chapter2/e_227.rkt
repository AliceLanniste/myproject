#lang racket
(define (deep-reverse x)
  (cond ((null? x) nil)
        ((not (pair? x)) x)
  (else
   (append  (deep-reverse (cdr x))
      (list (deep-reverse (car x)))))