#lang racket


;;(let ⟨var⟩ ⟨bindings⟩ ⟨body⟩)

;;转成 (let ()
;;   (define (var bindings-params)
;;          <body>)
;;     var bindings-values)
;;named let bindings 和var绑在一起，named let和4.6的；let语句是一样只不过多了
;;转成let + definition
;;var


(define (let? exp) (tagged-list? exp 'let))
(define let-var (cadr exp))
(define let-bind  (caddr exp))
(define let-param  (map car let-bind))
(define let-values  (map cdr let-bind))
(define let-body  (cddr exp))


(define (let-combinaton exp)
  (list 'let '()
        (cons 'define (cons(cons let-var let-param)
              let-body)             
              )
        (cons let-var let-values)))

