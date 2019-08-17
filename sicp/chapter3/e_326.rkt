#lang racket
(define (make-tree entry left right)
  (list entry left right))
(define (entry tree)
(car tree))
(define (left tree) (cadr tree))
(define (right tree) (cddr tree))


(define (adjoint x table)
  (cond ((null? table) (make-tree x '() '()))
        ((= (car x) (car (entry table))) table)
        ((< (car x) (car (entry table)))
         (make-tree (entry table)
                    (adjoint x (left table))
                    (right table)))
        ((> (car x) (car (entry table)))
         (make-tree (entry table)
                     (left table)
                     (adjoint x (right table))))))
        
(define (make-table)
  (let ((local-table '()))
    (define (lookup key records)
      (cond ((null? records) #f)
            ((= key (car (entry records)))  (entry records))
            ((< key (car (entry records))) (lookeup key (left records)))
            ((> key (car (entry records)) (lookup key (rigth records))))))
    

    (define (insert! key value)
      (let ((reocrd (lookup key local-table)))
       (if record
           (set-cdr! record value)
           (set! local-table (adjoint (cons key value) local-table)))
        ))

     (define (dispatch m) 
       (cond ((eq? m 'get-proc) get) 
             ((eq? m 'insert-proc) insert!)
             (else (error "Undefined operation -- TABLE" m)))) 
     dispatch)) 