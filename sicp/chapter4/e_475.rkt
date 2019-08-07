#lang racket
(define (unique-handler pattern stream)
   (stream-flatmap
     (lambda (frame)
        (let ((stream (qeval (negated-query pattern)
                             (singleton-stream frame))))
          (if (singleton-stream? stream)
              stream
              the-empty-stream)))
     stream))