#lang racket

(define (encode message tree)
  (if (null? message)
      '()
      (append 
       (encode-symbol (car message) 
                      tree)
       (encode (cdr message) tree))))
(define (encode-symbol symbol tree)
  (define (branch-correct?  branch)
    (if (leaf? branch)
        (equal? symbol (symbol-leaf branch))
        (element-of-set! symbol (symbols branch))))

  (let ((left (left-branch tree))
        (right (right-branch tree))
        )
    (cond ((branch-correct? left)
           (if (leaf? left) '(0) (cons 0 (encode-symbol symbol left))))
            ((branch-correct? rb) 
            (if (leaf? rb) '(1) (cons 1 (encode-symbol smb rb)))) 
           (else (error "bad symbol -- ENCODE-SYMBOL" bit))))) 