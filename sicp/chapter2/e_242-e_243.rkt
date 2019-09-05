#lang racket
(define empty-board '())


  (define (safe? k positions)
    (define (item-check row-of-new-queen rest-of-queens i)
      (if (null? rest-of-queens)
          #t
          (let ((row-of-current-queen (car rest-of-queens)))
            (if (or (= row-of-new-queen row-of-current-queen)
                    (= row-of-new-queen (+ row-of-current-queen i))
                    (= row-of-new-queen (- row-of-current-queen i)))
                #f
                (item-check row-of-new-queen
                            (cdr rest-of-queens)
                            (+ i 1))))))
    (item-check (car positions)
                (cdr positions)
                1))

     
(define (adjoin-position row k col)
  (cons row col) )

(define (enumerate-interval n)
    (if (< n 1)
      '()
      (append (enumerate-interval (- n 1))
              (list n))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) 
           (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position 
                    new-row 
                    k 
                    rest-of-queens))
                 (enumerate-interval 
                  1 
                  board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
;;2.42中queen-cols只要运行一次就行