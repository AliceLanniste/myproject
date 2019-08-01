#lang racket
(#%require sicp)

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define x 
  (stream-map 
   show 
   (stream-enumerate-interval 0 10)))

;;(cons-stream 0 (stream-enumerate-interval 1 10))
;; 0

(stream-ref x 5)
;; 1 2 3 4 5
(stream-ref x 7)
;;6 7

