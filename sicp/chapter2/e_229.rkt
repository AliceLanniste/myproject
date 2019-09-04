#lang racket
;;1
(define left-branch car)
(define right-branch cadr)

(define branch-length car)
(define branch-structure cadr)


;;2

(define (total-weight tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) tree)
        (else
         (+ (total-weigth (branch-structure (left-branch tree)))
             (total-weigth (branch-structure (right-branch tree))))))

  ;;3
  (define (torque branch) 
   (* (branch-length branch) (total-weight (branch-structure branch))))



 (define (balanced? mobile) 
   (if (not (pair? mobile)) 
       true 
       (and (= (torque (left-branch mobile)) (torque (right-branch mobile))) 
            (balanced? (branch-structure (left-branch mobile))) 
            (balanced? (branch-structure (right-branch mobile))))))















  
  
  