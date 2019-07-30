#lang racket
(define (unless-predicate exp) (cadr exp))
(define (unless-consequence exp) (caddr exp))
(define (unless-alternative exp) (cadddr exp))

(define (unless-> if exp)
  (make-if (unless-predicate exp) (unless-consequence exp) (unless-alternative exp)))s