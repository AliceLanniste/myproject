#lang racket
;;amb是怎么构建的
;;. In nondeterministic Scheme the evaluation of an expression may in addition result in the discovery of a dead end,
;;which case evaluation must backtrack to a previous choice point.

(define (ambeval exp env succeed fail)
  ((analyze exp) env succeed fail))

(define (amb? exp) (tagged-list? exp 'amb))
(define (amb-choices exp) (cdr exp))


(define (analyze-self-evaulating exp)
  (lambda(env success fail)
    (success exp fail)))


(define (analyze-quoted exp)
  (let ((qval(text-of-quotation exp)))
    (lambda(env success fail)
      (sucess quval fail))))
;;在env中找变量，一旦没找着就会直接报错，fail不需要在去寻找另一条路径
(define (analyze-variable exp)
  (lambda (env success fail)
    (success (look-up-variable-value exp env) fail)))

(define (analyze-lambda exp)
  (let ((vars (lambda-parameters exp))
        (bproc (analyze-sequence (lambda-body exp))))
    (lambda (env success fail)
      (success(make-procedure vars bproc env) fail))))

(define (analyze-if exp)
  (let ((pproc (analyze (if-predicate exp)))
        (cproc (analyze (if-consequent exp)))
        (aproc (analyze (if-alternative exp))))
        (lambda (env success fail)
          (pproc env
                 (lambda (pred-value fail2)
                   (if (true? pred-value)
                       (cproc env success fail2)
                       (aproc env success fail2)))
                   fail))))



(define (analyze-amb exp)
  (let ((cprocs
         (map analyze (amb-choices exp))))
    (lambda (env succeed fail)
      (define (try-next choices)
        (if (null? choices)
            (fail)
            ((car choices) 
             env
             succeed
             (lambda ()
               (try-next (cdr choices))))))
      (try-next cprocs))))


;;drive loop

(define input-prompt ";;;Amb-Eval input:")
(define output-prompt ";;;Amb-Eval output")

(define (drive-loop)
  (define (internal-loop try-again)
    (prompt-for-input input-prompt)
    (let (eq? input 'try-again)
         (try-again)
          (begin
            (newline)
             (display
              ";;; Starting a new problem")
              (ambeval
                input
                the-global-environment
                ;;ambeval success
                (lambda (val next-alternative)
                  (announce-output
                    output-prompt)
                    (user-print val)
                     (internal-loop
                      next-alternative))
                (lambda ()
                  (announce-output
                   ";;; There are no 
                 more values of")
                  (user-print input)
                  (drive-loop))))))
    (internal-loop
     (lambda ()
       (newline)
        (display
         ";;; There is no current problem")
       (drive-loop))))