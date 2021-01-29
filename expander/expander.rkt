#lang br/quicklang

(struct machine
  (stack ;; list value
   instrs ;; list function
   instr-ptr ;; int
   )
  #:transparent)

(define-macro (ts-module-begin (ts-program OP))
  #'(#%module-begin
     OP
     (define virtual-machine
       (machine
        '()
        (OP)
        0))
     (run machine)))

(provide (rename-out [ts-module-begin #%module-begin]))

;; Running the machine
(define (run m)
  (define instr-ptr (machine-instr-ptr m))
  (cond
    [(< instr-ptr (length (machine-instrs m)))
     (define instr (list-ref (machine-instrs m) instr-ptr))
     (define next-m (instr m))
     (run next-m)]
    [else m]))

;; Defining Functions
(define (ts-nop)
  (λ (m)
    (machine
     (machine-stack m)
     (machine-instrs m)
     (add1 (machine-instr-ptr m)))))

(define (ts-push v)
  (λ (m)
    (machine
     (cons v (machine-stack m))
     (machine-instrs m)
     (add1 (machine-instr-ptr m)))))

(define (ts-add)
  (binary-instr +))

(define (ts-sub)
  (binary-instr -))

(define (binary-instr op)
  (λ (m)
    (define old-stack (machine-stack m))
    (machine
     (cons (op (first old-stack) (second old-stack)) (rest (rest old-stack)))
     (machine-instrs m)
     (add1 (machine-instr-ptr m)))))

(define (ts-print m)
    (print (first (machine-stack m))))

  