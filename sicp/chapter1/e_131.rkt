#lang racket
(define (product a term b next)
  (if (> a b)
    1
    (* (term a)
       (product (next a) term b next))))

(define (identity x) x)
(define (inc x) (+ x 1))

(define (factorial n)
  (product 1 identity n inc))


(define (product2 a term b next)
  (define (iter a result)
    (if (> a b)
      1
      (* (term a)
         (iter (next a) result))))
  (iter a 1))