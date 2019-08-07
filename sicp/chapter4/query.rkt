#lang racket
(#%require sicp)

(define input-prompt ";;; Query input:")
(define output-prompt ";;; Query results:")

(define (query-driver-loop)
  (prompt-for-input input-prompt)
  (let ((q (query-syntax-process(read))))
    (cond ((assertion-to-be-added? q)
           (add-rule-or-assertion!
             (add-assertion-body q))
             (newline)
             (display
              "Assertion added to data base.")
              (query-driver-loop))
          (else
           (newline)
           (display output-prompt)
           (display-stream
             (stream-map
               (lambda (frame)
                 (instantiate
                     q
                   frame
                   (lambda (v f)
                       (contract-qustion-mark v))))
               (qeval q (singleton-stream '()))))
           (query-driver-loop))
          )))


(define (instantiate
            exp frame unbound-var-handler)
  (define (copy exp)
    (cond ((var? exp)
           (let ((binding (binding-in-frame
                           exp frame)))
             (if binding
                 (copy
                   (binding-value binding))
                 (unbound-var-handler
                  exp frame))))
           ((pair? exp)
            (cons (copy (car exp))
                  (copy (cdr e xp))))
           (else exp)))
  (copy exp))


;;qeval
(define (qeval query frame-stream)
  (let ((qproc (get (type query) 'qeval)))
    (if qproc
        (qproc (contents query) frame-stream)
        (simple-query query frame-stream))))

;;simple query
(define (simple-query query-pattern frame-stream)
  (stream-flatmap
    (lambda(frame)
       (stream-append-delayed
         (find-assertions query-pattern frame)
         (delay
           (apply-rules query-pattern frame))))
    frame-stream))

;;conjoin expression
(define (conjoin conjuncts frame-stream)
  (if (emppty-conjunction? conjuncts)
      frame-stream
      (conjoin (rest-conjunct conjuncts)
               (qeval
                 (first-conjunct conjuncts)
                 frame-stream))))

;;disjoin
(define (disjoin disjuncts frame-stream)
  (if (empty-disjunction? disjuncts)
      the-empty-stream
       (interleave-delayed
         (qeval (first-disjunct disjuncts)
                frame-stream)
         (delay (disjoin
                 (rest-disjuncts disjuncts)
                 frame-stream)))))
;;filter

(define (negate operands frame-stream)
  (stream-flatmap
    (lambda (frame)
       (if (stream-null?
             (qeval (negated-query operands)
                    (singleton-stream frame)))
           (singleton-stream frame)
           the-empty-stream))
    frame-stream))


(define (lisp-value call frame-stream)
  )