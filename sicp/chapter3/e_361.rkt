#lang racket
(define (invert-unit-series stream)
  (cons-stream 1 (scale-stream (mul-stream (stream-cdr stream) (invert-unit-series stream)) -1)))

