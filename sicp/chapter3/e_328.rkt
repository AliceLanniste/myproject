#lang racket

(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
           (logical-or (get-signal a1) 
                        (get-signal a2))))
      (after-delay 
       and-gate-delay
       (lambda ()
         (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)

(define (logic-or s1 s2) 
   (if (or (= s1 1) (= s2 1)) 
         1 
         0)) 