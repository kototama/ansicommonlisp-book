(defun read-lines (filename)
  (let ((path (make-pathname :name filename))
        (lines nil))
    (with-open-file (str path :direction :input)
      (do ((line (read-line str nil 'eof) (read-line str nil 'eof)))
          ((eql line 'eof) (nreverse lines))
        (push line lines)))))

;; (read-lines "test1.txt")
;; ("First Line... first line...." "Second Line... second line..." "Third line..."
;;  "4 . . . . ." "5 . . . . ." "6" "" "8")
