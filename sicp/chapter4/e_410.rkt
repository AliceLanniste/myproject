#lang racket
;;这题意思是设计一个新语法，但是不给eval和apply添加新的语法，这不就是一个新语法换成现有旧语法

(define (boring->self-evaluating exp) exp)

;;哈哈哈鸡贼一把