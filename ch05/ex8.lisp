(defun maxmin (v)
  (let ((len (length v)))
    (when (> len 0)
      (let ((val (svref v 0)))
        (maxmin-acc v (- (length v) 1) val val)))))

(defun maxmin-acc (v i min max)
  (if (< i 0)
      (values max min)
      (let ((val (svref v i)))
        (cond ((> val max) (maxmin-acc v (- i 1) min val))
              ((< val min) (maxmin-acc v (- i 1) val max))
              (t  (maxmin-acc v (- i 1) min max))))))


(maxmin #(1 2 3 4 5)) ;; 5 1

(maxmin #(1)) ;; 1 1

(maxmin #()) ;; nil

