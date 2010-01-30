(defun read-exprs (filename)
  (let ((path (make-pathname :name filename))
        (exprs nil))
    (with-open-file (str path :direction :input)
      (do ((expr (read str nil 'eof) (read str nil 'eof)))
          ((eql expr 'eof) (nreverse exprs))
        (push expr exprs)))))

(+ 1 2) (+ 4 3)
(read-exprs "ex2.lisp")

;; CL-USER> (read-exprs "ex2.lisp")

;; ((DEFUN READ-EXPRS (FILENAME)
;;    (LET ((PATH (MAKE-PATHNAME :NAME FILENAME)) (EXPRS NIL))
;;      (WITH-OPEN-FILE (STR PATH :DIRECTION :INPUT)
;;        (DO ((EXPR (READ STR NIL 'EOF) (READ STR NIL 'EOF)))
;;            ((EQL EXPR 'EOF) (NREVERSE EXPRS))
;;          (PUSH EXPR EXPRS)))))
;;  (+ 1 2) (READ-EXPRS "ex2.lisp"))


;; (eql 'eof (read-from-string "'eof"))
;; NIL
