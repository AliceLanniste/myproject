#lang sicp
(define (pascal col row)
   (if (or (= col 1) (= col row))
       1
       (+ (pascal (- col 1) (- row 1))  (pascal col (- row 1)))
       )
  
  )

;;Testing
(pascal 1 1)
(pascal 1 2)
(pascal 2 2)
(pascal 2 3)


(define (fast-expt b n)
  (cond ((= n 0) 
         1)
        ((even? n) 
         (square (fast-expt b (/ n 2))))
        (else 
         (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (square x) (* x x))