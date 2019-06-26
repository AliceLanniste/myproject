#lang sicp

 (define (good-enough? guess x) 
   (< (abs (/ (- (improve guess x) guess) 
              guess)) 
      0.001)) 