#lang br/quicklang

(require "parser/parser.rkt" "parser/tokenizer.rkt")

(define (read-syntax path port)
  (define parse-tree (parse path (make-tokenizer port path)))
  (strip-bindings
   #'(module tiny-stack-mod tiny-stack/expander/expander
       #,parse-tree)))

(module+ reader
  (provide read-syntax))
