#lang racket
(#%require sicp)

;;a
(define (integrate-series stream)
  (stream-map * (stream-map  / ones integers) stream))

;;b
(define exp-series
  (cons-stream 
   1 (integrate-series exp-series)))

(define cosine-series 
  (cons-stream 1 (integrate-series (scale-stream sine-series -1))))

(define sine-series 
  (cons-stream 0 (integrate-series cosine-series)))