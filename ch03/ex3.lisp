(defun occurences (lst)
  (let ((res nil))
    (dolist (elt lst)
      (let ((stat (assoc elt res)))
	(if (null stat)
	    (push (cons elt 1) res)
	    (setf (cdr stat) (+ (cdr stat) 1)))))
    (sort res (lambda (x y) (> (cdr x) (cdr y))))))


(occurences '(a b a d a c d c a)) ;; ((A . 4) (C . 2) (D . 2) (B . 1))
