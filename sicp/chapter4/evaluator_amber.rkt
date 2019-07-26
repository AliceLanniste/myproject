#lang racket
;;amb是怎么构建的
;;. In nondeterministic Scheme the evaluation of an expression may in addition result in the discovery of a dead end,
;;which case evaluation must backtrack to a previous choice point.

((amb? exp) (analyze-amb exp))
(define (ambeval exp env succeed fail)
  ((analyze exp) env succeed fail))