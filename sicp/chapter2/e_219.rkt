#lang racket
(define (no-more? items)
  (null? items))

(define  (first-denomination items) (car items))
(define (except-first-denomination items) (cdr items))