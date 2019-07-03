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
  
  (define (dispatch pass m)
    (cond ((not (eq? pass password)) (lambda (x) "Incorrect password"))
          ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit)  deposit)
          (else (error "Unknow request: MAKE-ACCOUNT" m))
    ))
  dispatch)


;;test
(define acc 
  (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40) ;; 60 bingo

((acc 'some-other-password 'deposit) 50);; bingo


