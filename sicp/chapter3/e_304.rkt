#lang racket
(define (make-account balance password)
  (define (withdraw amount)
   (if (>= balance amount)
        (begin (set! balance 
                     (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
   (define limit 0)
   (define (counter)  (begin (set! limit (+ limit 1)) limit))
  
  (define (dispatch pass m)
    (cond ((not (eq? pass password))
           (if (> (counter) 7)
               (lambda(x) "call the cops")
               (lambda(x) "wrong password")))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit)  deposit)
          (else (error "Unknow request: MAKE-ACCOUNT" m))
    ))
dispatch)



;;old version 这个版本是错误的原
;;(define (make-account2 balance password)

;; (define (withdraw amount)
;;   (if (>= balance amount)
;;        (begin (set! balance 
;;                     (- balance amount))
 ;;              balance)
;;        "Insufficient funds"))
;;  (define (deposit amount)
;;    (set! balance (+ balance amount))
;;    balance)
;;  (define limit 0)
;;  (define (dispatch pass m)
 ;;   (cond ((not (eq? pass password))
;;             (if (> limit 7)
;;                (lambda (x) "call the cops")
;;               (lambda (x) (set! limit (+ limit 1)) (print limit))))
;;          ((eq? m 'withdraw) withdraw)
;;          ((eq? m 'deposit)  deposit)
;;          (else (error "Unknow request: MAKE-ACCOUNT" m))
;;    ))
    



(define acc 
  (make-account 100 'secret-password))
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)
((acc 'some-other-password 'deposit) 50)