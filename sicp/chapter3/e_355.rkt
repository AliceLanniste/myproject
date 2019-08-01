#lang racket

(define (partial-sums S)
  (add-stream S  (cons-stream 0 (partial-sum S))))