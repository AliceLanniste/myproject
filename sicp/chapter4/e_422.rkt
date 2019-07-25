#lang racket
;;let->combination由4.6提供


(define (analyze-let exp)
  (analyze (let->combination exp)))



