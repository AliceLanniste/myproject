#lang racket
;;把while语句使用derived expression转成scheme语句

;;(while (<predicate> <variable>)
;;      <body>)
;;

;; if predicate 为true则不停的运行body，否则推出

(define (while? exp) (tagged-list? exp))

(define (predicate exp) (caadr exp))
(define (variable exp) (cdadr exp))
(define (body exp) (cddr exp))

;(list 'define ((symbol vairable) (<pre> variable) (body) ))
;;我的解决思路是把while语句转成define,这样就把循环转成递归
(define (while->combination exp)
 (let  ((var (variable exp))
        (pre  (predicate exp)))
    (list 'define (cons (list 'iter)
                        (make-if (pre var)
                                 (body exp)
                                 true))))
  )

 
