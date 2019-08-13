#lang racket
(define counter '())
(define (seen? x)
  (define (helper  s)
  (if (null? counter)
      #f
      (or (eq? x (car counter))
          (iter (cdr counter))))
  (helper counter))


(define (has-cirle x)
  (if (pair? x)
    (if (seen? x)
      #t
      (begin (set! counter (cons x counter))
             (or (has-cirle (car x))
                 (has-cirle (cdr x)))))
      #f)
  )