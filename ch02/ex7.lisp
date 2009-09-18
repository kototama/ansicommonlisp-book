(defun contains-listp (l)
  (if (null l)
      nil
      (or (typep (car l) 'list)
	  (contains-listp (cdr l)))))


(contains-listp '(a b c)) ;; nil
(contains-listp nil) ;; nil
(contains-listp '(a nil c)) ;; t
(contains-listp '(a '(aa bb) c)) ;; t
