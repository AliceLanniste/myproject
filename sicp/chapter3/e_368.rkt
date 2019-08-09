#lang racket



(define (pairs s t)
  (interleave
   (stream-map
    (lambda (x) 
      (list (stream-car s) x))
    t)
   (pairs (stream-cdr s)
          (stream-cdr t))))

;;会导致栈溢出，原先那版因为有了cons-stream可以延时计算所以不会出现这个问题