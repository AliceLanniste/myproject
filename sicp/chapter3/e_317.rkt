#lang racket

(define counter '())
(define (seen? x)
  (define (helper  s)
  (if (null? counter)
      #f
      (or (eq? x (car counter))
          (iter (cdr counter))))
  (helper counter))
(define (counter-pairs x)
(if (not (pair? x))
    0
    (if (seen? x) 
      0
      (begin
        (set! counter (cons x counter))
        (+ (count-pairs (car x))
           (count-pairs (cdr x))
           1)))))
  )