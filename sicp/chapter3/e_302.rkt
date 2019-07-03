#lang racket

(define (make-monitored f)
 (define counter 0)
 (define (mf m)
   (cond ((eq? m 'reset-count) (set! counter 0))
         ((eq? m 'how-many-calls?) counter)
         (else (set! counter (+ counter 1)) (f m)))
   )
 mf )

(define s (make-monitored sqrt))

(s 4) ;; 2

(s 100);;10
(s 'how-many-calls?);; 2