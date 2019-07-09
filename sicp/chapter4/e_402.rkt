#lang racket
;;a
;;application主要是使用procedure应用于实参计算得到返回值，而assignment是把value和variable绑定在一起
;;并不适用于appliation


;;b
;;使用call来表示application
(define (application? exp) (tagged-list? exp 'call))
(define (operator exp) (cadr exp))
(define (operand exp) (cddr exp))