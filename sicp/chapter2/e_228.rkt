#lang racket

(define (fringe tree)
  (cond
    ((not (pair? (car tree)))
     (cons (car tree) (fringe (cdr tree))))
    ((null？ (cdr tree))
     (if (pair? (car tree))
         (fringe (car tree))
         tree))
    (else
     (append (fringe(car tree))
             (fringe (cdr tree))))))

