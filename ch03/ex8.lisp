(defun showdots (lst)
  (let ((elt (car lst)))
    (if (null elt)
	(format t "~a" elt)
	(progn
	  (format t "(")
	  (format t "~a" elt)
	  (format t " . ")
	  (showdots (cdr lst))
	  (format t ")")))))

(showdots '(a b c)) ;; output (A . (B . (C . NIL)))
