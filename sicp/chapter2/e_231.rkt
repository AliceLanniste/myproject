#lang racket
(define (tree-map proc tree)
  (map
      (lambda (subtree)
        (if (pair? subtree)
          (square-tree2 subtree)
          (proc subtree)))
    tree))