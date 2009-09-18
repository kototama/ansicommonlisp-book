(defun our-fourth (l)
  (car (cdr (cdr (cdr l)))))


(our-fourth nil) ;; nil
(our-fourth '(1 2 3)) ;; nil
(our-fourth '(1 2 3 4)) ;; 4
(our-fourth '(a nil c d e f)) ;; d
(our-fourth '(a b c '(aa bb) d)) ;; (AA BB)


