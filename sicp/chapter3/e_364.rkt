#lang racket
(define (stream-limit stream tol)
  (if (< (abs (- (stream-ref stream 1) (stream-ref stream 0)) ) tol)
      (stream-ref stream 1)
      (stream-limit (stream-cdr stream) tol)))