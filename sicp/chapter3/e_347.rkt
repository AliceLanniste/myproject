#lang racket

;;多个mutex使用

(define (make-mutex)
  (let ((cell (list false)))
    (define (the-mutex m)
      (cond ((eq? m 'acquire)
             (if (test-and-set! cell)
                 (the-mutex 'acquire))) ; retry
            ((eq? m 'release) (clear! cell))))
    the-mutex))
(define (clear! cell) (set-car! cell false))

(define (test-and-set! cell)
  (if (car cell)
      true
      (begin (set-car! cell true)
             false)))



(define (make-semaphore n) 
   (let ((lock (make-mutex)) 
         (taken 0)) 
     (define (semaphore command) 
       (cond ((eq? command 'acquire) 
              (lock 'acquire) 
              (if (< taken n) 
                  (begin (set! taken (+ 1 taken)) (lock 'release)) 
                  (begin (lock 'release) (semaphore 'acquire)))) 
             ((eq? command 'release) 
              (lock 'acquire) 
              (set! taken (- taken 1)) 
              (lock 'release)))) 
     semaphore)) 