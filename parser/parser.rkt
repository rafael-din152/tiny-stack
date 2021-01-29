#lang brag

; NEWLINE "\n" ( done )
; INTEGER      ( done )
; operation    ( done )

ts-program: [ ts-operation ] (NEWLINE [ ts-operation ])*
ts-operation: ts-push
|ts-add
|ts-sub
|ts-nop
|ts-print
ts-add: /"add"
ts-sub: /"sub"
ts-nop: /"nop"
ts-print: /"print"
ts-push: /"push" ts-number
@ts-number: INTEGER