#lang racket

(define (div-series stream1 stream2)
  (let (c (stream-car stream2))
    (if (= c 0)
        (error "constant term of s2 can't be 0!")
        (mul-series stream1 (invert-united-series stream2)))
  ))