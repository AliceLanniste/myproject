#lang racket
(#%require sicp)
(define (an-integer-starting-from n)
  (amb n (an-integer-starting-from (+ n 1))))

;;确定K的上限就可以确定i,j的上限

(define (all-pythagorean-triple)
  (let ((k (an-integer-starting-from 1)))
    (let ((j (an-integer-between 1 k)))
      (let ((i (an-integer-between 1 j)))
        (require (= (+ (* i i) (* j j))
                    (* k k)))
        (list i j k)))))

