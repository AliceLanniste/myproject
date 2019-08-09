#lang racket
(define (make-zero-crossings 
         input-stream last-value av-value)
  (let ((avpt 
         (/ (+ (stream-car input-stream) 
               last-value) 
            2)))
    (cons-stream 
     (sign-change-detector av-value avpt )
     (make-zero-crossings 
      (stream-cdr input-stream)  (stream-car input-stream) av-value))))