#lang racket
(define (make-frame variables values)
  (if (= (length variables) (length values))
  (map cons variables values)
  (error "length mismatch -- MAKE-FRAME" variables values)))
                  