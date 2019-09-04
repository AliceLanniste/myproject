#lang racket
(define (make-center-percent center percentage)
  (let (w (* center (/ percentage 100.0)))
    (make-interval (- c w) (+ c w))))

(define (precent i)
   (let ((center (/ (+ (upper-bound i) (lower-bound i)) 2.0)) 
         (width (/ (- (upper-bound i) (lower-bound i)) 2.0))) 
     (* (/ width center) 100))) 