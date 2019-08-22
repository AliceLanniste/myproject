 (define (count-0-remainder-divisions n p d) 
         (if (= (remainder p d) 0) 
                 (count-0-remainder-divisions (+ n 1) (/ p d) d) 
                 n))

(define (pair a b) 
         (* (expt 2 a) (expt 3 b))) 
  
 (define (head pair) 
         (count-0-remainder-divisions 0 pair 2)) 
  
 (define (tail pair) 
         (count-0-remainder-divisions 0 pair 3)) 
  
  
 (define (print pair) 
         (newline) 
         (display "( ") 
         (display (head pair)) 
         (display " . ") 
         (display (tail pair)) 
         (display " )") 
         (newline)) 
  