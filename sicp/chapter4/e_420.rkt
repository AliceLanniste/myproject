#lang racket
;;letrec 转化成let

;; make-let (bindings body)
;;(lambda <vars>
;;    (define u <e1>)
;;    (define v <e2>)
;;   <e3>)

;;把上面define包裹在letrec中,最后还是转化成
;;(let (( u '*unassinged)..
;;     (set! u <e1>)
;;     <e3>)
;;如果做了4.17的话这道题相当简单
(define (letrec? exp)
  (tagged-list? exp 'letrec))

(define (letrec-pair exp) (cadr exp))
(define (letrec-body exp) (cddr exp))

(define (make-assigned exp)
  (map   (lambda(x) (list (car x) 'unassigned))  (letrec-pair exp)))

(define (set-variable exp)
  (map (lambda(x)  (list 'set! (car x) (cdr x)))  (letrec-pair exp)))

(define (letrec->let exp)
  (list 'let (make-assigned exp)
        (append (set-variable exp) (letrec-body exp))))

;;b 使用let 的话
;;(（lambda （even？ odd？）
;;  <let-body>）
;;  (even-exp)
 ;; (odd-exp))

;;其中even-exp有odd？，odd-exp有even？而这两个是在未定义




