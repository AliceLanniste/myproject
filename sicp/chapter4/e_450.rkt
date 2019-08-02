#lang racket
;;这道题主要就是写一个analyze-ramb这样可以解析ramb语句的程序
;;但是可以通过在ramb-choice中随机抽取其中一个例子，那么analyze-amb只要改动一处就可以解析ramb语句

(define (ramb? exp) (tagged-list? 'ramb))
(define (ramb-choice exp) (shuffle exp))

 (define (shuffle seq) 
   (define (iter seq res) 
     (if (null? seq) 
         res 
         (let ((index (random (length seq)))) 
           (let ((element (list-ref seq index))) 
             (iter (remove seq element) 
                   (cons element res)))))) 
   (iter seq nil))


(define (analyze-ramb exp)
  (let ((cprocs
         (map analyze (ramb-choices exp))))
    (lambda (env succeed fail)
      (define (try-next choices)
        (if (null? choices)
            (fail)
            ((car choices) 
             env
             succeed
             (lambda ()
               (try-next (cdr choices))))))
      (try-next cprocs))))
