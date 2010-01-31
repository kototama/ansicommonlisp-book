(defun print-array (a)
  (let* ((dim (array-dimensions a))
         (row (car dim))
         (col (cadr dim)))
    (dotimes (r row)
      (dotimes (c col)
        (format t "~10,2,,,F" (aref a r c)))
      (terpri))))

;; old school but nice :-)
;; 
;; CL-USER> (print-array #2a ((0.245 124.3 3.14156) (42.0 41.1234 314.1562)))
;;       0.25    124.30      3.14
;;      42.00     41.12    314.16
;; NIL


