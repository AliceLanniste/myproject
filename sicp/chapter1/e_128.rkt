#lang racket

(define (timed-prime-test n)
  
  (start-prime-test n (runtime)))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) 
         (fast-prime? n (- times 1)))
        (else false)))

(define (start-prime-test n start-time) 
   (if (prime? n) 
       (report-prime n (- (runtime) start-time)))) 


(define (report-prime elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))