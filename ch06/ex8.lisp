(defun expensive (x)
  (sleep 5)
  (* x x))

(let ((results (make-hash-table)))
  (defun frugal (x)
    (let ((res (gethash x results)))
      (if (null res)
          (setf (gethash x results) (expensive x))
          res))))

;; the answer of http://www.automatous-monk.com/lisp/aclp/chap06-exer08.html
;; is false!
