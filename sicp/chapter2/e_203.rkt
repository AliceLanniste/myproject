#lang racket

  
 ;; Rectangle - 1st implementation 
  
 (define (make-rect bottom-left top-right) 
   (cons bottom-left top-right)) 
  
 ;; "Internal accessors", not to be used directly by clients.  Not sure 
 ;; how to signify this in scheme. 
 (define (bottom-left rect) (car rect)) 
 (define (bottom-right rect) 
   (make-point (x-point (cdr rect)) 
               (y-point (car rect)))) 
 (define (top-left rect) 
   (make-point (x-point (car rect)) 
               (y-point (cdr rect)))) 
 (define (top-right rect) (cdr rect)) 
  
 (define (width-rect rect) 
   (abs (- (x-point (bottom-left rect)) 
           (x-point (bottom-right rect))))) 
 (define (height-rect rect) 
   (abs (- (y-point (bottom-left rect)) 
           (y-point (top-left rect))))) 
  
 ;; Public methods. 
 (define (area-rect rect) 
   (* (width-rect rect) (height-rect rect))) 
 (define (perimeter-rect rect) 
   (* (+ (width-rect rect) (height-rect rect)) 2)) 
  
  