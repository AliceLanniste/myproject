#lang racket
(#%require sicp)
;;把eval使用data-directed style重写一遍
;;data-direted style 即是把syntax和操作组件一个表，先使用put组件使用get获取
;;使得eval更加精简

(put 'op )