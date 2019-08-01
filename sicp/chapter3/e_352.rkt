#lang racket
(#%require sicp)
(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-car stream) 
  (car stream))


(define (stream-cdr stream) 
  (force (cdr stream)))

(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq 
  (stream-map 
   accum 
   (stream-enumerate-interval 1 20)))
;;(cons 1 (lambda () (stream-enum 1 20)))

(define y (stream-filter even? seq))

(define z 
  (stream-filter 
   (lambda (x) 
     (= (remainder x 5) 0)) seq))

(stream-ref y 7)
;;stream-ref (stream-cdr y) 7)
;;(cons 1 (stream-filter even? (lambda () (stream 2 20))))
(display-stream z)

如果把delay转成（lambda() <exp>）,z函数在计算的时候，会把初始值加在sum上。
y函数返回6时，sum=6， z函数计算时（sum (+ x sum)）,x要从1开始计算