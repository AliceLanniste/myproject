#lang racket

(#%require sicp)
(define balance 100)

(define (withdraw amount)
  (if (> balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "balance (- balance amount)")
  )

;;银行取钱把存钱的放入new-withdraw里面
(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance 
                       (- balance amount))
                 balance)
          "Insufficient funds"))))

;;可以把balance变成变量可以自己控制
(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin(set! balance (- balance amount))
              balance)
           "Insufficient funds")
    )
  )

(define w (make-withdraw 100))
;;(w 50)
;;(w 60)

(define (make-simplified-withdraw balance)
  (lambda (amount)
    (set! balance (- balance amount))
    balance))

(define W (make-simplified-withdraw 25))


;;(W 20)

(define (make-decrementer balance)
  (lambda (amount)
    (- balance amount)))

;;((make-decrementer 25) 20)

;; immutable table



(define (lookup key table)
  (let  ((record (assoc key (cdr table))))
        (if record
            (cdr record)
         false))
  )


(define (assoc key records)
  (cond ((null? records) false)
        ((equal? key (caar records)) 
         (car records))
        (else (assoc key (cdr records)))))


(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
        (set-cdr! record value)
        (set-cdr! table
                  (cons (cons key value) 
                        (cdr table)))))
  'ok)

(define (make-table1) (list '*table*))


(define A-table (make-table1))

;;(insert! 'a 1 A-table)
;;(insert! 'b 2 A-table)

;;half adder为了解决half adder问题先从需求入手，首先需要wire和signal
;;因此先设定wire和基本组件

(define a (make-wire))
(define b (make-wire))
(define c (make-wire))
(define d (make-wire))
(define e (make-wire))
(define s (make-wire))


(or-gate a b d)


(and-gate a b c)


(inverter c e)



(define (half-adder a b s c)
  (let ((d (make-wire)) (e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))

(and-gate d e s)

