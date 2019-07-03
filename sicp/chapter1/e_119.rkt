#lang racket
;;题目我完全搞不懂意思
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; normal order
(gcd 206 40)

;;(gcd 40 (remainder 206 40)) 1
;;(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;;
;;3
(gcd (remainder 40 (remainder 206 40))
     (remainder((remainder 206 40)  (remainder 40
                           ((remainder 40 206 40)))
                        ) ))