#lang sicp

;;recursive procedure
(define (recursive n)
  ( if (< n 3)
       n
       (+ (recursive (- n 1)) (* 2 (recursive (- n 2))) (* 3 (recursive (- n 3))))
       )
  )


;;iterative procedure
(define (iterative n)
  ( if (< n 3)
       n
  (iterative-helper 2 1 0 n)
  ))

(define (iterative-helper a b c  count)
  (if (< count 3)
     a
     (iterative-helper (+ a (* 2 b) (* 3 c)) a b (- count 1))
     )
  )