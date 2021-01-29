#lang br

(require brag/support)

(define-lex-abbrev digits (:+ (char-set "0123456789")))

(define basic-lexer
  (lexer-srcloc
   ["\n" (token 'NEWLINE lexeme)]
   [whitespace (token lexeme #:skip? #t)]
   [(:or "push" "add" "sub" "nop" "print") (token lexeme lexeme)]
   [digits (token 'INTEGER (string->number lexeme))]))

(provide basic-lexer)
