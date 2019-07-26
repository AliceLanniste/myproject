#lang racket
(#%require sicp)


(define (require p)
  (if (not p) (amb)))

(define (an-element-of items)
  ;;如果items是空则失败
  (require (not (null? items)))
  (amb (car items) 
       (an-element-of (cdr items))))
(define (square x) (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))


(define (prime-sum-pair list1 list2)
  (let ((a (an-element-of list1))
        (b (an-element-of list2)))
    (require (prime? (+ a b)))
    (list a b)))

;;parsing natural language

(define nouns 
  '(noun student professor cat class))

(define verbs 
  '(verb studies lectures eats sleeps))

(define articles '(article the a))

;;the cat eats
;;(sentence
;; (noun-phrase (article the) (noun cat))
;; (verb eats))

(define (parse-sentence)
  (list 'sentence
         (parse-noun-phrase)
         (parse-word verbs)))


(define (parse-noun-phrase)
  (list 'noun-phrase
        (parse-word articles)
        (parse-word nouns)))


(define (parse-word word-list)
  (require (not (null? *unparsed*)))
  (require (memq (car *unparsed*) 
                 (cdr word-list)))
  ;;(display *unparsed*)
  ;;(newline)
  (let ((found-word (car *unparsed*)))
    (set! *unparsed* (cdr *unparsed*))
    (list (car word-list) found-word)))

(define *unparsed* '())
(define (parse input)
  (set! *unparsed* input)
  (display *unparsed*)
  (newline)
  (let ((sent (parse-sentence)))
    ;;(require (null? *unparsed*))
    sent))

(parse '(the cat eats))