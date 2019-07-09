#lang racket
;;left to right
(define  (left-to-right exps env)
  (if (no-operands?) exps)
     '()
      (let (left (first-operand exps))
       (cons (eval left env)
             (left-to-right (rest-operands exps) env))))

;;right to left
(define (right-to-left exps env)
  (if (no-operands? exps)
      '()
      (let ((right (right-to-left (rest-operands exps) env))
            (left (eval (first-operand exps) env)))
        (cons  left right)))
  )

  