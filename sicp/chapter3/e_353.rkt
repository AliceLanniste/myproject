#lang racket
(#%require sicp)

(define s (cons-stream 1 (add-streams s s)))

;;s = 1,2,4.....