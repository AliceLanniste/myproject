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
