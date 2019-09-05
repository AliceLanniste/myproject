#lang racket
(define (unique-pairs n) 
   (flatmap (lambda (i)  
              (map (lambda (j) (list i j)) 
                   (enumerate-interval 1 (- i 1)))) 
            (enumerate-interval 1 n)))


(define (prime-sum-pairs n) 
   (map make-sum-pair 
        (filter prime-sum? (unique-pairs n)))) 