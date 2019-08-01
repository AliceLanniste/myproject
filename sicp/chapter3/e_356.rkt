#lang racket
(define S (cons-stream 1 (merge(merge (scale-stream S 2) (scale-stream 3))
                               (scale-stream 5))))