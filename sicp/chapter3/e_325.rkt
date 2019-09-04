#lang racket
(define make-tablex make-table)
(define (lookupx keys table)
  (if (null? keys)
    table
    (let ((record (lookup (car keys) table)))
      (if record
        (lookupx (cdr keys) record)
        #f))))

(define (insertx! keys value table)
  (cond ((null? keys) (error "key list is empty"))
        ((null? (cdr keys))
          ; the last pair
          (insert! (car keys) value table))
        (else
          (let ((record (lookup (car keys) table)))
            (if record
              (insertx! (cdr keys) value record)
              (let ((subtable (make-table)))
                (insertx! (cdr keys) value subtable)
                (insert! (car keys) subtable table)))))))

