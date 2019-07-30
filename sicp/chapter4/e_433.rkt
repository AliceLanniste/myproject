#lang racket
(define (cons x y) (lambda (m) (m x y)))
(define (car z) (z (lambda (p q) p)))
(define (cdr z) (z (lambda (p q) q)))


(define (quoted->lazy-list exp)
  (let (text (text-of-quote exp))
    (define (make-list text)
      (if (null? text)
          (list 'quote '())
          (list 'cons (list 'quote (car text))
                (list 'quote (cdr text)))
          ))
   (make-list text))
  )


(define (text-of-quote exp)
  (cadr exp))