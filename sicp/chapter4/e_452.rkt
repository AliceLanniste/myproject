#lang racket
(define (if-fail? exp) (tagged-list? exp 'if-fail))

(define (analyze-if-fail exp)
  (let ((first (analyze(cadr exp)))
        (second (analyze(cddr exp))))
    (lambda (env  success fail)
    (first env
           success
           (lambda ()
             (second env success fail))))))