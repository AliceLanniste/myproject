#lang racket
 (define (random-in-range low high) 
   (let ((range (- high low))) 
     (+ low (random range))))
(define (get-area lower-x lower-y upper-x upper-y) 
   (* (- upper-x lower-x) 
      (- upper-y lower-y))) 
  
 (define (estimate-integral pred lower-x lower-y upper-x upper-y trials) 
   (let ([area (get-area lower-x lower-y upper-x upper-y)] 
         [experiment (lambda () (pred (random-in-range lower-x upper-x) 
                                      (random-in-range lower-y upper-y)))]) 
     (* area (monte-carlo trials experiment)))) 